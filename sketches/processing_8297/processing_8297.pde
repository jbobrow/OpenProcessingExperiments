



String[] filenames = {"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"}; // fotos im data ordner
 
PImage[] images = new PImage[filenames.length]; 
 
int imageIndex = 0; 

//Timer
int savedTime;
int totalTime = 3000;

 
void setup() { 
  size(800,600); //angegebene größe aus unterricht 
  //background (0);
 
 //Timer
savedTime = millis(); 
   
  for(int i = 0; i<filenames.length; i++) 
  { images[i] = loadImage(filenames[i]);     
  }  


} 
 
void draw() { 
  background(0);   
  
  //timer
  int passedTime = millis() - savedTime;
  
  image(images[imageIndex],0,0,width,height); // größe passend machen 
  
  if (passedTime > totalTime) {
  println ("3 seconds have passed!");
  imageIndex++;
  savedTime = millis();
  }
  
  if (imageIndex>filenames.length-1)
  {imageIndex = 0;



}
}




//void mousePressed() { 
  
// if(imageIndex<filenames.length-1) 
// { imageIndex++; 
 //} 
 //else imageIndex = 0;  
    
//} 



