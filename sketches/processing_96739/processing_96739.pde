
PImage img;
/*
Borrowed code from website "processing.org"
*/
void setup() {
  size(300,300);
  background(#08FAF8);
  img = loadImage("aceventura.jpg");
}
void draw() {
  image(img,45,65);
}


