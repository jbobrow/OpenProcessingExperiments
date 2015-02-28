
import processing.video.*;

Movie myMovie;
void setup() {
  size(854,480,P2D);
  frameRate(30);
  myMovie = new Movie(this,"compressed.mp4");
  myMovie.loop();
  myMovie.speed(0.5);
}

void draw() {
  if(myMovie.available()){
    myMovie.read();
  }
  image(myMovie,0,0);
}

void mousePressed() {
  myMovie.jump(random(myMovie.duration()));
}
//called every time a new frame is available  to read 
void movieEvent(Movie m){
  m.read();
}


