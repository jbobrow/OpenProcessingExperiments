
int sam=0; // a variable
PImage img;

void setup() {
  size(434,600);
}

void draw() {
  img = loadImage("http://i43.tinypic.com/2ahxxsg.jpg");
  background (img);
  sam = sam+1; //printIn(Sam)
  ellipse(235,sam,20, 20);
  noStroke();
  if(sam > 610) {sam = -10;} //how to make it side scroll
  if(sam < 225) {
    noFill(); } else {fill (0,255,0);
  }
}
