-- Get all invoices where the UnitPrice on the InvoiceLine is greater than $0.99.
SELECT
  I.InvoiceId,
  InvoiceDate,
  Il.UnitPrice AS "InvoiceLinePrice"
  FROM Invoice I
  INNER JOIN InvoiceLine Il
  ON Il.InvoiceId = I.InvoiceId
  WHERE Il.UnitPrice > 0.99;

-- Get the InvoiceDate, customer FirstName and LastName, and Total from all invoices.
SELECT
  DATE(InvoiceDate),
  C.FirstName AS "CustomerFirstName",
  C.LastName AS "CustomerLatsName",
  Total
  FROM Invoice I
  INNER JOIN Customer C
  ON I.CustomerId = C.CustomerId;

-- Get the customer FirstName and LastName and the support rep's FirstName and LastName from all customers.
SELECT
  C.FirstName AS "CustomerFirstName",
  C.LastName AS "CustomerLatsName",
  E.FirstName AS "SupportFirstName",
  E.LastName AS "SupportLastName"
  FROM Customer C
  INNER JOIN Employee E
  ON C.SupportRepId = E.EmployeeId;

-- Get the album Title and the artist Name from all albums.
SELECT
  Al.Title AS "Album Title",
  A.Name AS "ArtistName"
  FROM Album Al
  INNER JOIN Artist A
  ON Al.ArtistId = A.ArtistId;

-- Get all PlaylistTrack TrackIds where the playlist Name is Music.
SELECT
  Pt.TrackId AS "PlaylistTrack",
  P.Name AS "Playlist Name"
  FROM PlaylistTrack Pt
  INNER JOIN Playlist P
  ON Pt.PlaylistId = P.PlaylistId
  WHERE P.Name = "Music";

-- Get all Track Names for PlaylistId 5.
SELECT
  Pt.PlaylistId,
  T.Name
  FROM Track T
  INNER JOIN PlaylistTrack Pt
  ON T.TrackId = Pt.TrackId
  WHERE Pl.PlaylistId = 5;

-- Get all Track Names and the playlist Name that they're on.
SELECT
  T.Name AS "Track Name",
  P.Name AS "Playlist Name"
  FROM Track T
  INNER JOIN PlaylistTrack Pt
  ON T.TrackId = Pt.TrackId
  INNER JOIN Playlist P
  ON Pt.PlaylistId = P.PlaylistId;

-- Get all Track Names and Album Titles that are the genre "Alternative".
SELECT
  T.Name AS "Track Name",
  Al.Title AS "Album Title",
  G.Name AS "Genre Name"
  FROM Track T
  INNER JOIN Album Al
  ON T.AlbumId = Al.AlbumId
  INNER JOIN Genre G
  ON T.GenreId = G.GenreId
  WHERE G.Name IN("Alternative");
