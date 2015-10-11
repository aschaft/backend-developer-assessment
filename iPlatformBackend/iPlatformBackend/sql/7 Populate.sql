
-- Not needed currently
insert into Country (CountryId, CountryName)
Values
('US', 'United States'),
('GB', 'Great Brittain')

Go

Declare @ID int = 0
--Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Metallica', @UniqueID = '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab', @CountryId = 'US', @ArtistID = @ID Output
--Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Metalica'
--Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'메탈리카'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Lady Gaga', @UniqueID = '650e7db6-b795-4eb5-a702-5ea2fc46c848', @CountryId = 'US', @ArtistID = @ID Output
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Lady Ga Ga'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Stefani Joanne Angelina Germanotta'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Mumford & Sons', @UniqueID = 'c44e9c22-ef82-4a77-9bcd-af6c958446d6', @CountryID = 'GB'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Mott the Hoople', @UniqueID = '435f1441-0f43-479d-92db-a506449a686b', @CountryID = 'GB'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Mott The Hoppie'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Mott The Hopple'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Megadeth', @UniqueID = 'a9044915-8be3-4c7e-b11f-9e2d2ea0a91e', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Megadeath'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'John Coltrane', @UniqueID = 'b625448e-bf4a-41c3-a421-72ad46cdb831', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'John Coltraine'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'John William Coltrane'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Mogwai', @UniqueID = 'd700b3f5-45af-4d02-95ed-57d301bda93e', @CountryID = 'GB'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Mogwa'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'John Mayer', @UniqueID = '144ef525-85e9-40c3-8335-02c32d0861f3', @CountryID = 'US'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Johnny Cash', @UniqueID = '18fa2fd5-3ef2-4496-ba9f-6dae655b2a4f', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Johhny Cash'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Jonny Cash'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Jack Johnson', @UniqueID = '6456a893-c1e9-4e3d-86f7-0008b0a3ac8a', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Jack Hody Johnson'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'John Frusciante', @UniqueID = 'f1571db1-c672-4a54-a2cf-aaa329f26f0b', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'John Anthony Frusciante'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Elton John', @UniqueID = 'b83bc61f-8451-4a5d-8b8e-7e9ed295e822', @CountryID = 'GB'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'E. John'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Elthon John'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Elton Jphn'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'John Elton'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Reginald Kenneth Dwight'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Rancid', @UniqueID = '24f8d8a5-269b-475c-a1cb-792990b0b2ee', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'ランシド'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Transplants', @UniqueID = '29f3e1bf-aec1-4d0a-9ef3-0cb95e8a3699', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'The Transplants'

Exec proc_Artist @Cmd = 'Upd', @ArtistName = 'Operation Ivy', @UniqueID = '931e1d1f-6b2f-4ff8-9f70-aa537210cd46', @CountryID = 'US'
Exec proc_Artist @Cmd = 'UpdAlias', @ArtistID = @ID, @Alias = N'Op Ivy'

