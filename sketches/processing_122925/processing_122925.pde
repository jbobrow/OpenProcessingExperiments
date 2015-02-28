
    
import processing.video.*;
Movie myMovie;

void setup() {
  size(200, 200);
  myMovie = new Movie(this, "http://www.youtube.com/watch?feature=player_detailpage&v=kCfrkbi7xvo");
  myMovie.loop();
}

void draw() {
  tint(255, 20);
  image(myMovie, 10,10);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
