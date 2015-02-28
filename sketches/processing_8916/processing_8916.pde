
// plaatjes
String[] filenames = {"boomfestival.jpg","concept1","boom.jpg","d21.jpg","2008.jpg"};  
PImage[] images = new PImage[filenames.length];  
int imageIndex = 0;  
  
// Timer  
int savedTime;  
int totalTime = 500;  
  
void setup () {    
  size (500,400);  
   
// Timer  
  savedTime = millis();  
   
  for(int i = 0; i<filenames.length; i++)  
  {images[i]  = loadImage(filenames[i]);  
  }  
}  
  
void draw () {  
  background (0); 
   
  int passedTime = millis() - savedTime;  
   
// match width, height 
  image(images[imageIndex],0,0,width,height);   
   
  if (passedTime > totalTime) {  
  println("5 Seconds Passed");    
  imageIndex++;  
  savedTime = millis();   
  }  
   
  if(imageIndex>filenames.length-1)  
    {imageIndex = 0;  
    }  
}  
 


