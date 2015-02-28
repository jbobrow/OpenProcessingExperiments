
PImage img;

void setup () {
  size(1000*3/4, 1194*3/4);
  smooth();
  img = loadImage("TheLadywiththeVeil-1768-2.jpg");
}


void draw() {
  image (img, 0, 0, width, height);

  for ( int i = 0; i < width; i+=1) {
    color c = get(i, mouseY);
    stroke(c);
    line(i, mouseY, i, 0);
  }
  //line(0, mouseY, width/2, mouseY);
}




