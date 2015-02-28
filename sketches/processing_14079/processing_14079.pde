
int maxImages = 11; 
int imageIndex = 0; 
PImage[] images = new PImage[maxImages]; 
 
int savedTime; 
int totalTime = 2500; 

    
void setup () 
{ size(500,375); 
  smooth(); 
  savedTime = millis(); 
 
  for(int i = 0; i<images.length; i++) 
  { images[i] = loadImage("Reverse" + (i+1) + ".jpg");  
  }
}

void draw ()
{ background(0); 
  image(images[imageIndex],0,0,width,height); 
 
  int passedTime = millis() - savedTime; 
  if (passedTime > totalTime)  
   { imageIndex = (imageIndex + 1) % images.length; 
   savedTime = millis(); 
   } 
} 


