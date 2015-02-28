
import processing.video.*;

Movie myMovie ;

void setup() {
  size (889, 500, P2D) ;
  frameRate (30) ;
  background (0) ;
  myMovie = new Movie(this, "ball2.mov") ;
  myMovie.play() ;
}

void movieEvent (Movie myMovie) {
  myMovie.read() ;
}

void draw() {
  tint (255, 20) ;
  image(myMovie, 0, 0) ;
}

