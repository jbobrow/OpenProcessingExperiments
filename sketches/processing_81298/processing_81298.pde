
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8297*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


String[] filenames = {"IMG_0654_2.jpg", "IMG_0657_2.jpg", "IMG_0660_2.jpg", "IMG_0662_2.jpg" , "IMG_0665_2.jpg"}; // fotos im data ordner


PImage[] images = new PImage[filenames.length]; 
int imageIndex = 0; 

//Timer
int savedTime;
int totalTime = 3000;

 
void setup() { 
  size(467,400); //angegebene größe aus unterricht 
  //background (0);
  
 
 //Timer
savedTime = millis(); 
   
  for(int i = 0; i<filenames.length; i++) 
  { images[i] = loadImage(filenames[i]);     
  }  


} 
 
void draw() { 
  background(255);   
  
  //timer
  int passedTime = millis() - savedTime;
  
  image(images[imageIndex],0,0,width,height); // größe passend machen
  
  
  if (passedTime > totalTime) {
  println ("3 seconds have passed!");
  imageIndex++;
  savedTime = millis();
  }
  
  if (imageIndex>filenames.length-1)
  imageIndex = 0;


}




//void mousePressed() { 
  
// if(imageIndex<filenames.length-1) 
// { imageIndex++; 
 //} 
 //else imageIndex = 0;  
    
//}

/*Source: http://www.openprocessing.org/sketch/8297*/



