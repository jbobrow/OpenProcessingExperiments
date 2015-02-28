
import processing.video.*;
Movie myMovie;

void setup() {
  size(640, 480);
  myMovie = new Movie(this, "quentinlol.mov");
  myMovie.loop();
}


void draw() {
  image(myMovie, 0, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

boolean b = false;

void keyPressed() {
  
  if (b== false) {
     myMovie.pause();
     b= true;
  }

  if (b== true) { 
     myMovie.read();
     b= false;
  } 

}
