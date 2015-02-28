
PImage img;

void setup() {
  background(0);
  img = loadImage("monalisa.jpg");
  size(img.width, img.height);
}

void draw() {
  //image(img, 0, 0);
  for (int a=0; a<width ; a=a+15) {
    for (int d=0; d<height ; d=d+15) {
      color c= img.get(a, d);
      //float b= brightness(c);
      stroke(c-d-a,20);
      fill(c, 5);
      ellipse(a, d, 20, 20);
    }
  }
}

