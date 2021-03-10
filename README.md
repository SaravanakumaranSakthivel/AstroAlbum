# Astronomy pictures Album 

Project to display all the Astronomy pictures and videos captured by NASA. 

### Architecture Design Pattern : MVVM 
### Device Type : iPhone 


### API details

* Source: https://api.nasa.gov/

* Resource: /planetary/apod 
* API reference: https://github.com/nasa/apod-api 
* Endpoit to get album details between the range : https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2021-03-09&end_date=2021-03-10&thumbs=true
* Api contract response : 
* 
[{"date":"2021-03-09","explanation":"Is that a fossil?\u00a0 Looking through recent images of Mars taken by the new Perseverance rover may seem a bit like treasure hunting, with the possibility of fame coming to the first person to correctly identify a petrified bone, a rock imprinted by an ancient plant, or any clear indication that life once existed on Mars.\u00a0 Unfortunately, even though it is possible that something as spectacular as a skeleton could be identified, most exobiologists think it much more likely that biochemical remnants of ancient single-celled microbes could be found with Perseverance's\u00a0chemical analyzers.\u00a0 A key reason is that multicellular organisms may take a greater amount of oxygen to evolve than has ever been present on Mars. That said, nobody's sure, so please feel free to digitally magnify any Perseverance image that interests you -- including the featured 360-degree zoomable image of the rocks and ridges surrounding Perseverance's landing location in Jezero Crater.  And even though NASA-affiliated scientists are themselves studying Perseverance's images, if you see anything really unusual, please post it to popular social media. If your sighting turns out to be particularly intriguing, scientifically, it is likely that NASA will hear about it.","media_type":"video","service_version":"v1","thumbnail_url":"","title":"Perseverance 360: Unusual Rocks and the Search for Life on Mars","url":"https://mars.nasa.gov/layout/embed/image/mars-panorama/?id=25674"},{"copyright":"Yannick Akar","date":"2021-03-10","explanation":"Could Queen Calafia's mythical island exist in space? Perhaps not, but by chance the outline of this molecular space cloud echoes the outline of the state of California, USA. Our Sun has its home within the Milky Way's Orion Arm, only about 1,000 light-years from the California Nebula. Also known as NGC 1499, the classic emission nebula is around 100 light-years long. On the featured image, the most prominent glow of the California Nebula is the red light characteristic of hydrogen atoms recombining with long lost electrons, stripped away (ionized) by energetic starlight. The star most likely providing the energetic starlight that ionizes much of the nebular gas is the bright, hot, bluish Xi Persei just to the right of the nebula.  A regular target for astrophotographers, the California Nebula can be spotted with a wide-field telescope under a dark sky toward the constellation of Perseus, not far from the Pleiades.   New: APOD now available in Arabic from Syria","hdurl":"https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_3296.jpg","media_type":"image","service_version":"v1","title":"NGC 1499: The California Nebula","url":"https://apod.nasa.gov/apod/image/2103/NGC1499_Akar_960.jpg"}]

# Features  
### Album 

*  Display last 30 days media from the NASA APOD service 
*  User can select custom data date range as they wish by sliding the slider, Maximum number of days they can slide is 200 days.
*  By default all the media's listed in the collection view, User can filter by only photos or only by videos taping the filter button. 


<img width="505" alt="Screenshot 2021-03-10 at 1 40 51 AM" src="https://user-images.githubusercontent.com/8506555/110589163-02394900-8144-11eb-915a-45481bfb5da6.png">

  
  
### Media Detail 

* Display the image of the selected picture in the album if avilable

* If the selected media is video type then display thumbnail image 

* Show the captured date, title and Explanation details. 

* If its a video type tapping on image will open the youtube url link in the Youtube app or in the safari browser.



<img width="505" alt="Screenshot 2021-03-10 at 2 05 03 AM" src="https://user-images.githubusercontent.com/8506555/110590076-4d079080-8145-11eb-9152-6dfbf02aaf3d.png">


<img width="505" alt="Screenshot 2021-03-10 at 1 41 32 AM" src="https://user-images.githubusercontent.com/8506555/110590102-57298f00-8145-11eb-899b-cf26b0182411.png">






# Future Improvements 

* Detail screen can be implemented with scorllview and expand the view depends on the explanation text size. 









  
