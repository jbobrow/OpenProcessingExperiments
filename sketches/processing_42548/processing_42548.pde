



//simple imported video show and display by mouseX 

import processing.video.*;

Movie movie;

void setup(){
size (800, 400);
background (0);
movie = new Movie (this, "shawn.mov");
}

void draw() {
  float ratio = mouseX / (float) width;
  movie.jump (ratio *movie.duration());
  movie.read(); //read that frame of that moment
  image (movie, 0, 0); // show it
}



//simple video show
/*
Movie movie;

void setup() {
  size (800, 400);
movie = new Movie (this, "shawn.mov");
movie.loop(); //play it
}


void draw() {
image (movie, 0, 0); //show it
}
*/

