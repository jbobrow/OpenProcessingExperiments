
 //Practice Sketch
//code to play the “imagine justice” video in processing
//project #1 materials

 import processing.video.*;

Movie introMovie;

void setup() {
  size(720,480);
  introMovie = new Movie(this, "Intro.avi");
  introMovie.loop(); 
}

void movieEvent(Movie introMovie) {
  introMovie.read();
}


void draw() {  
  if (introMovie.available()) {
    introMovie.read();
  }  
  background(0);
  imageMode(CENTER);
  image(introMovie, width/2, height/2, 720,480);

  if (mouseX < width/2) {
    introMovie.speed(1.5);
  } else {
    introMovie.speed(.5);
  }

  if (mouseY < height/2) {
    tint(255,127,0);
  } else {
   tint(255,255,255);
  }
  if (mousePressed) {
    textSize(32);
    text("hello",10,30);
  }
}  
