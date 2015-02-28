
//fotos 
String[] filenames = {"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg"}; 
PImage[]  images = new PImage[filenames.length]; //new PImage[5]; 
int imageIndex = 0; 
 
//timer 
int savedTime; 
int totalTime = 1500; 
 
void setup () {   
  size (350,500); 
  //Timer 
  savedTime = millis(); 
  //Timer 
  for(int i = 0; i<filenames.length; i++) 
  { images[i]  = loadImage(filenames[i]); 
  } 
} 
 
void draw () { 
  background (0); 
  int passedTime = millis() - savedTime; 
 
  if (passedTime > totalTime) { 
  println( " 3 seconds have passed! " );  
  veranderPlaatje();   
 
  savedTime = millis();  
  } 
 
  
  image(images[imageIndex],0,0,width,height); 
} 

void veranderPlaatje()
{ if(imageIndex<filenames.length-1) 
 { imageIndex++; 
 } 
 else imageIndex = 0;    
}


void mousePressed() { 
  veranderPlaatje();    
} 


