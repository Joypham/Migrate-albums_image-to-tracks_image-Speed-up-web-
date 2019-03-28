-- Fix format albums.image_url

UPDATE	
	albums 
set
	albums.ext = 	JSON_SET(ext, '$.square_image.uri', REPLACE(ext ->> '$.square_image.uri','https://aimg.vibbidi-vid.com/',''))
WHERE
	square_image_url LIKE '%http%'
	and valid > 0
	and uuid = '58D00FACF043482C8AC02F2E48B2E52C'
