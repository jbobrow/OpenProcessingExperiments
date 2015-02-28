
import processing.video.*;
MovieMaker myMovie;
import JMyron.*;

JMyron m;
 
void setup(){
  size(320,240);
  myMovie = new MovieMaker(this, width, height, "capture.mov",5, MovieMaker.H263,
MovieMaker.BEST);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  m.findGlobs(0);//disable the intelligence to speed up frame rate
  rectMode(CENTER);
  noStroke();
}

void draw(){
  background(0);
  m.update();//update the camera view
  int[] img = m.image(); //get the normal image of the camera
  float r,g,b;
  for(int y=0;y<height;y+=8){ //loop through all the pixels
    for(int x=0;x<width;x+=8){ //loop through all the pixels
      float av = (red(img[y*width+x])+green(img[y*width+x])+blue(img[y*width+x]))/3.0;
      fill(red(img[y*width+x]),green(img[y*width+x]),blue(img[y*width+x]));
       fill(random(255));
      
      pushMatrix();
      translate(x,y);
      rotate(av/32.0);
      rect(0,0,av/16.0,av/16.0);
      popMatrix();
      
    }
  }
  myMovie.addFrame();
}
void keyPressed() {
if (key == ' ') { // If we press spacebar...
myMovie.finish(); // Stop recording
}
}
void stop() {
myMovie.finish(); // This finishes off the file properly...
super.stop();
}

