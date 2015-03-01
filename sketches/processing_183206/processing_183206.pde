

import processing.video.*;

Movie hreyfimynd;  // PImage er gagnategund (datatype)

void setup() {
  size(640, 360);
  hreyfimynd = new Movie(this, "tekkno-dagsins.mov"); //ath ad setja video i moppuna: data
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  image(hreyfimynd, 0, 0);  //i vinstra horni efst
  //image(hreyfimynd, 111, 0, 88, 88);
  image(hreyfimynd, mouseX, mouseY, 100, 66); //thar sem musin er
}

void mousePressed() {
  hreyfimynd.play();
}



