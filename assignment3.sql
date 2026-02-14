--query 1
CREATE TABLE "Music_video" (
	"video_id"	INTEGER NOT NULL,
	"videoDirector"	TEXT,
	"TrackId"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("video_id" AUTOINCREMENT),
	FOREIGN KEY("TrackId") REFERENCES "tracks"
);


-- query 2
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (1, 'Alexander Zhu');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (2, 'Nick Stallone');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (3, 'Timmy Pap');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (4, 'John Smith');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (5, 'Mark Zuck');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (6, 'Chris kozak');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (7, 'Anton Dijion');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (8, 'Ny Mustard');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (9, 'Dave Finklestein');
INSERT INTO Music_video (TrackId, videoDirector) 
VALUES (10, 'Joseph Poke');

--query 3
INSERT INTO Music_video (TrackId, videoDirector)
SELECT TrackId, "John Smokes"
FROM tracks
WHERE name == "Voodoo";

--query 4
SELECT * FROM tracks
WHERE Name LIKE '%á%'
   OR Name LIKE '%é%'
   OR Name LIKE '%í%'
   OR Name LIKE '%ó%'
   OR Name LIKE '%ú%';

-- query 5
SELECT 
    tracks.Name,
    Music_video.videoDirector
FROM tracks
JOIN Music_video ON tracks.TrackId = Music_video.TrackId;

-- query 6
SELECT 
    genres.Name AS Genre,
    COUNT(tracks.TrackId) AS TrackCount,
    ROUND(AVG(tracks.Milliseconds)) AS AvgLength
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name;

-- query 7
SELECT DISTINCT
    customers.FirstName,
    customers.LastName
FROM customers
JOIN invoices ON customers.CustomerId = invoices.CustomerId
JOIN invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
WHERE tracks.Milliseconds > (SELECT AVG(Milliseconds) FROM tracks)
  AND tracks.Milliseconds <= 900000;
  
--query 8
--i have no clue what this is asking to be honest