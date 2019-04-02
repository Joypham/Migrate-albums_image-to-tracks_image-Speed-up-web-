-- Fix format albums.image_url: 550 records


UPDATE	
	albums 
set
	albums.ext = 	JSON_SET(ext, '$.square_image.uri', REPLACE(ext ->> '$.square_image.uri','https://aimg.vibbidi-vid.com/',''))
WHERE
	square_image_url LIKE '%http%'
	and valid > 0
-- Fix format tracks.image_url: 3131
								   
UPDATE tracks
Join(
SELECT
	id,
	title,
	Artist,
	ImageURL,
	REPLACE ( ImageURL, 'https://uprof.vibbidi-vid.com/', '' ) as a
FROM
	tracks 
WHERE
	ImageURL LIKE '%https://uprof.vibbidi-vid.com/https%'
	-- and 
	-- id = 'D4F15E49818849718EB5126B04D53E6C'
	) as t1
	on t1.id = tracks.id
	set
	tracks.ImageURL = t1.a
