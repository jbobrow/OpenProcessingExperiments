
/* 
This example needs a folder named "data" 
inside data, the name of the images are fy000.jpg 
fy005.jpg
if you change the code to work with your images
you will have to change line 18 to make it work 


*/
import processing.video.*;

MovieMaker mm;
int frame = 0;
int numFrames = 179;
PImage[] images = new PImage[numFrames];

void setup() {
  size(600,400);
  frameRate(10);
  mm = new MovieMaker(this, width, height, "testMovie.mov", 12, MovieMaker.ANIMATION, MovieMaker.HIGH); 
  
  for (int i = 0; i<images.length; i++){
    //change the line below to the name of the images in your data folder
    String imageName = "car" + nf(i,3) + ".jpg";
    println("imageName" + imageName);
    images[i] = loadImage(imageName);
    println(numFrames);
  }

}

void draw() {
  
  frame++;
  if(frame == numFrames){
    mm.finish();
    frame=0;
    
  }
  image(images[frame], 0, 0);
    mm.addFrame();
  } 
  

