
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
int numFrames = 48;
PImage[] images = new PImage[numFrames];

void setup() {
size(600,400);
frameRate(5);
mm = new MovieMaker(this, width, height, "testMovie.mov", 12, MovieMaker.ANIMATION, MovieMaker.HIGH); 

for (int i = 1; i<images.length; i++){
//change the line below to the name of the images in your data folder
  String imageName = i + ".jpg";
  //println("imageName" + imageName);
  images[i] = loadImage(imageName);
  //println(numFrames);
}

}
void draw() {

frame++;
if(frame == numFrames){
mm.finish();
frame=1; 
}
image(images[frame], 0, 0);
mm.addFrame();
}

