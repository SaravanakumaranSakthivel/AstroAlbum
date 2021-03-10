# Astronomy pictures Album 

Project to display all the Astronomy pictures and videos captured by NASA. 

### Architecture Design Pattern : MVVM 
### Device Type : iPhone 



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



### API details

* Source: https://api.nasa.gov/

* Resource: /planetary/apod 

* API reference: https://github.com/nasa/apod-api 






  
