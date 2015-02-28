
import processing.video.*;


MovieMaker mm;


int frame = 0;
int numFrames = 14;
PImage[] images = new PImage[numFrames];

void setup(){
    size(960,720);
  frameRate(5);
  mm = new MovieMaker(this, width, height, "testMovie.mov", 12, MovieMaker.ANIMATION, MovieMaker.HIGH); 
  
  for (int i = 0; i<images.length; i++){
    //change the line below to the name of the images in your data folder
    String imageName = "IMG" + nf(i,3) + ".JPG";
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
  image(images[frame], 3, 3);
    mm.addFrame();
  } 

