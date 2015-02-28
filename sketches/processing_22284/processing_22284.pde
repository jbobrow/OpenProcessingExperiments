
import processing.video.*;
Movie myMovie;

void setup() {
  size(1000, 700);
  myMovie = new Movie(this, "eye_emotions2.mov");
  myMovie.play();
  myMovie.loop();
}

void draw() {
  image(myMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}

