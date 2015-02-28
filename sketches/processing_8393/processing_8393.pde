
// Pics
String[] filenames = {"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"}; 
PImage[] images = new PImage[filenames.length]; 
int imageIndex = 0; 
 
// Timer 
int savedTime; 
int totalTime = 5000; 
 
void setup () {   
  size (800,600); 
  
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


