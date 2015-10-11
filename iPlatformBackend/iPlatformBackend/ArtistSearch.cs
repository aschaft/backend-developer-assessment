using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using Nancy;
using System.Data.SqlClient;
using System.Xml;
using System.Xml.Linq;
using Newtonsoft.Json;
using Formatting = Newtonsoft.Json.Formatting;

namespace iPlatformBackend
{
    public class ArtistSearch : NancyModule
    {
        private const string ConnString =
            "Data Source=.\\SQLExpress;Initial Catalog=ipMusic;Persist Security Info=True;User ID=ip;Password=Music";

        public ArtistSearch()
        {
            Get["/artist/search/{artistSearch}/{pageNo:int}/{pageSize:int}"] = parameters => artistSearch(
                parameters.artistSearch,
                parameters.pageNo,
                parameters.pageSize);


            Get["/artist/{id}/releases"] = parameters => artistReleases(parameters.id);
        }

        private string artistSearch(string artistSearch, int pageNo, int pageSize)
        {

            var reqResult = "";

            var artistSearchResult = new ArtistSearchResult();

            try
            {
                var sqlConn = new SqlConnection(ConnString);

                SqlCommand sqlCmd = new SqlCommand();
                DataSet dataSet = new DataSet("results");
                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                

                sqlConn.Open();

                sqlCmd.CommandText = "proc_Artist";
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Connection = sqlConn;

                sqlCmd.Parameters.AddWithValue("@Cmd", "Get");
                sqlCmd.Parameters.AddWithValue("@ArtistName", artistSearch);
                sqlCmd.Parameters.AddWithValue("@PageNo", pageNo);
                sqlCmd.Parameters.AddWithValue("@PageSize", pageSize);

                dataAdapter.SelectCommand = sqlCmd;

                dataAdapter.Fill(dataSet);

                artistSearchResult.Page = pageNo.ToString();
                artistSearchResult.PageSize = pageSize.ToString();
                artistSearchResult.NumberOfPages = dataSet.Tables[1].Rows[0].ItemArray[1].ToString();
                artistSearchResult.NumberOfSearchResults = (int) dataSet.Tables[1].Rows[0].ItemArray[0];

                foreach (DataRow artistRow in dataSet.Tables[0].Rows)
                {
                    var artistResult = new ArtistResult(artistRow["artist"].ToString(), artistRow["country"].ToString());

                    XmlDocument xml = new XmlDocument();

                    if (artistRow["alias"].ToString() != "")
                    {
                        xml.LoadXml(artistRow["alias"].ToString());

                        foreach (XmlNode aliasnode in xml.FirstChild)
                        {
                            artistResult.AddAlias(aliasnode.InnerText);
                            artistSearchResult.AddArtist(artistResult);
                        }
                    }
                }
                
                
                dataSet.Dispose();
                dataAdapter.Dispose();
                sqlCmd.Dispose();
                sqlConn.Close();
                sqlConn.Dispose();


                reqResult = JsonConvert.SerializeObject(artistSearchResult, Formatting.Indented);
                return reqResult;

            }
            catch (Exception ex)
            {
                reqResult = "Failed to open connection to database, " + ex.Message;
            }

            return reqResult;
        }

        
        private class ArtistResult
        {
             public string Name;
             public string Country;
             public readonly List<string> Alias;
          
            public ArtistResult(string name, string country) 
            {
                Name = name;
                Country = country;
                Alias = new List<string>();
            }

            public void AddAlias(string name)
            {
                Alias.Add(name);
            }

        }
        
        
        private class ArtistSearchResult
        {
            
             public List<ArtistResult> results = new List<ArtistResult>();


             public string Page;

             public string PageSize;


             public string NumberOfPages;


             public int NumberOfSearchResults;

            public void AddArtist(ArtistResult artist)
            {
                results.Add(artist);
            }


        }

        private string artistReleases(string artistId)
        {
            var musicBrainzUrl = "http://musicbrainz.org/ws/2/release/?query=arid:" + artistId + "%20and%20primarytype:album";

            var reqResult = "";
            var artistReleaseResult = new ArtistReleaseResult();
            XmlDocument xml = new XmlDocument();
            ArtistRelease release;

            xml.Load(new XmlTextReader(musicBrainzUrl));

            try
            {

                // Get the release-list tag
                var releaseList =  xml.ChildNodes[1].FirstChild;

                // Loop through release
                foreach (XmlNode releaseNode in releaseList)
                {
                    release = new ArtistRelease();
                    XmlNode artistCredit;
                    release.ReleaseId = releaseNode.Attributes["id"].Value;

                    release.Title = releaseNode["title"].InnerText;

                    release.Status = releaseNode["status"].InnerText;

                    if (releaseNode["label-info-list"] != null)
                    {
                        release.Label = releaseNode["label-info-list"]["label-info"]["label"]["name"].InnerText;
                    }
                    release.NumberOfTracks = releaseNode["medium-list"].FirstChild.InnerText;

                    artistCredit = releaseNode["artist-credit"];
                    foreach (XmlNode nameCredit in artistCredit)
                    {
                        // Loops through name-credit tags
                        var artist = nameCredit["artist"];

                        
                        if (artist != null && artist.Attributes["id"].Value != artistId)
                        {
                            var otherArtist = new OtherArtist();
                            var name = artist["name"];
                            otherArtist.id = artist.Attributes["id"].Value;
                            if (name != null) otherArtist.name = name.InnerText;

                            release.OtherArtists.Add(otherArtist);
                                
                        }
                    }

                    
                    artistReleaseResult.releases.Add(release);
                }


                return Newtonsoft.Json.JsonConvert.SerializeObject(artistReleaseResult, Formatting.Indented);

            }
            catch (Exception ex)
            {
                return ex.Message + " : " + ex.ToString();
            }
            //return reqResult;

        }
        private class OtherArtist
        {
            public string id;
            public string name;

        }
        private class ArtistRelease
        {
            public string ReleaseId;
            public string Title;
            public string Status;
            public string Label;
            public string NumberOfTracks;
            public List<OtherArtist> OtherArtists;

            public ArtistRelease()
            {
                ReleaseId = "";
                Title = "";
                Status = "";
                Label = "";
                NumberOfTracks = "";
                OtherArtists = new List<OtherArtist>();

            }
        }
        private class ArtistReleaseResult
        {
            public List<ArtistRelease> releases;

            public ArtistReleaseResult()
            {
                releases = new List<ArtistRelease>();
            }
        }

        
    }
}