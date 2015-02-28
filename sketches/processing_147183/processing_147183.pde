
float theta=0;
PImage src;

void setup() {
  src=loadImage("8.png");
  //  size(src.width, src.height);
  size(432, 432);
  background(230);
  src.loadPixels();
}

void draw() {
  theta+=.1;
  background(230);
  for (int j=0;j<src.height;j+=6) {
    noFill();
    stroke(0);
    beginShape();
    for (int i=0;i<src.width;i++) {
      if (src.get(i, j)==-16777216) {
        vertex(i, j-5*cos(theta));
      }
      else {
        vertex(i, j);
      }
    }
    endShape();
  }
}


