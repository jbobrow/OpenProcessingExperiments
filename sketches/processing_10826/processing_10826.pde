
int maxImages = 9; 
int imageIndex = 0; 
PImage[] images = new PImage[maxImages]; 
 
int savedTime; 
int totalTime = 2500; 
PFont f; 
 
int speed = 3; 
int x = 0; 
 
    
void setup () 
{ size(550,370); 
  smooth(); 
  savedTime = millis(); 
 
  for(int i = 0; i<images.length; i++) 
  { images[i] = loadImage("slideshow_" + (i+1) + ".jpg");  
  } 
 
  f = loadFont("InaiMathi-30.vlw"); 
} 
 
void draw () 
{ background(0); 
  image(images[imageIndex],0,0,width,height); 
 
  int passedTime = millis() - savedTime; 
  if (passedTime > totalTime)  
   { imageIndex = (imageIndex + 1) % images.length; 
   savedTime = millis(); 
   } 
 
  x = x + speed; 
 
  textFont(f,50); 
 
  fill(255); 
  text ("Reverse Engineering",x,35); 
 
 
} 


