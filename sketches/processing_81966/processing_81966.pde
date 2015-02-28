
import processing.video.*;
Movie myMovie;

void setup() {
  size(750, 400, P2D);
  background(0);
  myMovie = new Movie(this, "d.mov");
  myMovie.loop();
  frameRate(60);
}


void movieEvent(Movie myMovie) {
  myMovie.read();
}

void draw() {
  tint(250, 20);
  image(myMovie, mouseX-myMovie.width/2, mouseY-myMovie.height/2);
}

