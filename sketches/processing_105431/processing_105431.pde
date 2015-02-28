
PImage smallcage;

void setup() {

  size(600, 600);

  smallcage = loadImage("smallcage.gif");
}

void draw() {

  for (int i=0; i<600; i+=100) {
    for (int j=0; j<600; j+=100) {
      image(smallcage, i, j);
    }
  }
}



