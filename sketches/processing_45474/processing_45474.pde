
/* 
This example needs a folder named "data" 
inside data, the name of the images are fy000.jpg 
fy223.jpg
if you change the code to work with your images
you will have to change line 18 to make it work 


*/
import processing.video.*;

MovieMaker mm;
int frame = 0; //FOR FORWARDS, START WITH 0 INSTEAD
int numFrames = 126; //STAYS THE SAME
PImage[] images = new PImage[numFrames];

void setup() {
  size(500,344);
  frameRate(9);
  mm = new MovieMaker(this, width, height, "testMovie.mov", 9, MovieMaker.ANIMATION, MovieMaker.HIGH); 
  
  for (int i = 0; i<images.length; i++){
    //change the line below to the name of the images in your data folder
    String imageName = "IMG_" + nf(i,1) + ".JPG";
    println("imageName" + imageName);
    images[i] = loadImage(imageName);
    println(numFrames);
  }

}

void draw() {
  
  frame++; //THIS GOES BACKWARDS INSTEAD OF frame++;
  if(frame == numFrames){
    mm.finish();
    frame=0;
    
  }
  image(images[frame], 0, 0);
    mm.addFrame();
  } 
  


//void keyPressed(){
  //mm.finish();
  //println("key pressed, now end");
//}
  
  
//void keyPressed(){
   // if (key == ' '){
     // mm.finish();
    //}
    //if(key == 'a'){
      //saveFrame("line-###.JPG", "JPG");
    //}
    
   // println("key pressed, now end");
//}
  


