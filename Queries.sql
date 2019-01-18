### Media Type Usage for Tracks ###

SELECT MediaType.Name Media_Type, COUNT(MediaType.MediaTypeId) Num_of_times_played
FROM Track 
JOIN MediaType
ON MediaType.MediaTypeId = Track.MediaTypeId
GROUP BY MediaType.MediaTypeId
ORDER BY Num_of_times_played DESC;


### Genre type distribution in USA #####

select Genre.Name,Invoice.BillingCountry,count(*) Num_of_invoices
from Invoice
join InvoiceLine
on Invoice.InvoiceId = InvoiceLine.InvoiceId
join Track
On InvoiceLine.TrackId = Track.TrackId
join Genre
on Track.GenreId = Genre.GenreId
GROUP BY Genre.Name,Invoice.BillingCountry
HAVING Invoice.BillingCountry='USA'
ORDER BY Num_of_invoices DESC
LIMIT 15;



### Total sales amount per track ###

SELECT Track.Name AS Track_Name, Album.Title as Album_Title, Artist.Name as Artist_Name, SUM(InvoiceLine.Quantity * InvoiceLine.UnitPrice) as Invoice_Total
FROM Invoice
JOIN InvoiceLine
ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
JOIN Album
ON Track.AlbumId = Album.AlbumId
JOIN Artist
ON Album.ArtistId = Artist.ArtistId
GROUP BY InvoiceLine.TrackId
ORDER BY Invoice_Total DESC
LIMIT 10;


### Top 10 customers ###

SELECT Customer.FirstName, Customer.Country, MAX(Invoice.Total) AS Total_Amount
FROM Invoice
JOIN Customer
ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY Invoice.Total DESC
LIMIT 10;


