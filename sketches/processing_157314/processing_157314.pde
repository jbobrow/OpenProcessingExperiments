
import processing.video.*;

Movie gopro;

void setup() {
  size(1000, 1000);
  gopro = new Movie(this, "movie_5.mov");
  gopro.loop();
}

void draw() {
  tint(255, 100);
  image(gopro, mouseX, mouseY);
}

void movieEvent(Movie m) {
  m.read();
}



