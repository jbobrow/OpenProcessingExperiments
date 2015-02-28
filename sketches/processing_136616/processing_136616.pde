
PImage img;

void setup() {
  background(0);
  img = loadImage("payaso.jpg");
  size(img.width, img.height);
}

void draw() {
  //image(img, 0, 0);
  for (int a=0; a<width ; a=a+5) {
    for (int d=0; d<height ; d=d+5) {
      color c= img.get(a, d);
      float b= brightness(c);
      stroke(c);
      fill(c, 60);
      if (dist(mouseX, mouseY, c, b  )>100) {
        ellipse(a, d, b*0.1, b*0.1);
      }
    }
  }
}
