//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace iPlatformBackend
{
    using System;
    using System.Collections.Generic;
    
    public partial class Artist
    {
        public Artist()
        {
            this.ArtistAlias = new HashSet<ArtistAlia>();
        }
    
        public int ArtistId { get; set; }
        public string ArtistName { get; set; }
        public string UniqueId { get; set; }
        public string CountryId { get; set; }
    
        public virtual ICollection<ArtistAlia> ArtistAlias { get; set; }
    }
}