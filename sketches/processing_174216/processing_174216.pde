
import processing.video.*;
Movie movie;
Movie movie2;
int y = 730;
void setup () {
  size (1280, 730, P2D);
  background(0);
  movie = new Movie(this, "inicio.mov");
  movie.stop();
  movie2 = new Movie(this, "NEGRO.mov");
  movie2.stop();
}
void draw() {
  image(movie, 0, 0);
  image(movie2, 0, y, 1280, 730);
}
void movieEvent(Movie movie) {
  movie.read();
  movie2.read();
}
void keyPressed() {
  movie2.play();
  movie2.loop();
  movie.play();
  if (y == 0) {
    y = 730;
  } 
  movie.loop();
}
void keyReleased() {

  movie.pause();
  if (y == 730) {
    y = 0;
  }
}



