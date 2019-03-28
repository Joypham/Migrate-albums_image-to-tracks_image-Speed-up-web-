-- Fix format albums.image_url: 550 records


UPDATE	
	albums 
set
	albums.ext = 	JSON_SET(ext, '$.square_image.uri', REPLACE(ext ->> '$.square_image.uri','https://aimg.vibbidi-vid.com/',''))
WHERE
	square_image_url LIKE '%http%'
	and valid > 0
-- 
