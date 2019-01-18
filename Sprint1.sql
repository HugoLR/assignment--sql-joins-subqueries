-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT
  CONCAT(FirstName," ",LastName) AS "Name",
  CustomerId,
  Country
  FROM Customer WHERE Country IS NOT "USA";

  -- Provide a query only showing the Customers from Brazil.
SELECT *
  FROM CUSTOMER WHERE COUNTRY IS "Brazil";

  -- Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT
	C.CustomerId AS "#",
    FirstName,
    LastName,
    InvoiceId AS "#Invoice",
	  InvoiceDate,
    BillingCountry
    FROM Customer C
    INNER JOIN Invoice I
    ON C.CustomerId = I.CustomerId
    WHERE C.Country = "Brazil";

-- Provide a query showing only the Employees who are Sales Agents.
SELECT *
  FROM Employee WHERE Title IN("Sales Manager");

  -- Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT distinct BillingCountry
  FROM Invoice;

  -- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT
  E.FirstName,
  E.LastName,
  E.Title,
  I.InvoiceId
  FROM Employee E
  INNER JOIN Customer C
  ON E.EmployeeId = C.SupportRepId
  INNER JOIN Invoice I
  ON C.CustomerId = I.CustomerId;

  -- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT
  Total,
  C.FirstName,
  C.LastName,
  C.Country,
  E.FirstName,
  E.LastName
  FROM Employee E
  INNER JOIN Customer C
  ON E.EmployeeId = C.SupportRepId
  INNER JOIN Invoice I
  ON C.CustomerId = I.CustomerId;

  -- How many Invoices were there in 2009 and 2011?
SELECT  strftime('%Y', InvoiceDate),COUNT(*) AS Total FROM Invoice WHERE strftime('%Y', InvoiceDate)
IN("2009","2011")
GROUP BY strftime('%Y', InvoiceDate);

-- What are the respective total sales for each of those years?
SELECT InvoiceDate,SUM(Total) FROM Invoice WHERE strftime('%Y', InvoiceDate) BETWEEN "2009" AND "2011" GROUP BY strftime('%Y', InvoiceDate);

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(Quantity) FROM InvoiceLine WHERE InvocieId=37

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
SELECT InvoiceId,COUNT(Quantity) FROM InvoiceLine GROUP BY InvoiceId;

-- Provide a query that includes the purchased track name with each invoice line item.
SELECT
  T.Name,
  InvoiceLineId,
  InvoiceId,
  I.UnitPrice,
  Quantity
  FROM InvoiceLine I
  INNER JOIN Track T
  ON I.TrackId = T.TrackId;

-- Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT
  I.InvoiceLineId,
  T.Name,
  Ar.Name
  FROM InvoiceLine I
  INNER JOIN Track T
  ON T.TrackId = I.TrackId
  INNER JOIN Album Al
  ON Al.AlbumId = T.AlbumId
  INNER JOIN Artist Ar
  ON Ar.ArtistId = Al.ArtistId;

-- Provide a query that shows the # of invoices per country.
SELECT
  BillingCountry,
  COUNT(InvoiceId)
  FROM Invoice
  GROUP BY BillingCountry;

-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
SELECT
  P.Name AS "PlaylistName",
  COUNT(Pt.TrackId) AS "NumberOfTracks"
  FROM Playlist P
  INNER JOIN PlaylistTrack Pt
  ON Pt.PlaylistId = P.PlaylistId
  INNER JOIN Track T
  ON T.TrackId  = Pt.TrackId
  GROUP BY PlaylistName;

-- Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT
  T.Name AS "TrackName",
  Al.Title AS "AlbumName",
  Mt.Name AS "MediaType",
  G.Name AS "Genre"
  FROM Track T
  INNER JOIN Album AL
  ON AL.AlbumId = T.AlbumId
  INNER JOIN Genre G
  ON G.GenreId  = T.GenreId
  INNER JOIN MediaType Mt
  ON Mt.MediaTypeId = T.MediaTypeId;

  -- Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT
  InvoiceId,
  COUNT(InvoiceId) AS "Invoice Of Line Items"
  FROM InvoiceLine
  GROUP BY InvoiceId;

  -- Provide a query that shows total sales made by each sales agent.
SELECT
  E.FirstName,
  E.LastName,
  SUM(I.Total)
  FROM Employee E
  INNER JOIN Customer C
  ON E.EmployeeId = C.SupportRepId
  INNER JOIN Invoice I
  ON C.CustomerId = I.CustomerId
  GROUP BY E.EmployeeId;

  -- Which sales agent made the most in sales in 2009?
