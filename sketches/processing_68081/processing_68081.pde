
import processing.video.*;
MovieMaker myMovie;
Capture video;
PVector loc, des, vel, acc;
PImage img;

void setup() {
  size(640, 480);
  background(0);
  myMovie = new MovieMaker (this,width,height,"capture.mov",25,MovieMaker.H263, MovieMaker.BEST);
  loc = new PVector (width/2,height/2);
  des = new PVector (mouseX,mouseY);
  vel = new PVector (0,0);
  acc = new PVector (0,0);
    video = new Capture(this, 640, 480);
 img= loadImage("hat.png");   
 }



void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0);
    myMovie.addFrame();
    image (img, mouseX,mouseY,340,340);
  }
}

void keyPressed(){
  if (key==' '){
  myMovie.finish();
  }
}

void stop(){
  myMovie.finish();
  super.stop();
}
