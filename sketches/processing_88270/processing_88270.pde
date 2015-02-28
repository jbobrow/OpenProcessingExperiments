
int i = 255;
PImage img;
PImage img2;

void setup() {
  size(600, 600);
  background(0);
  img = loadImage("blue_sky.gif");
  img2 = loadImage("pink.gif");
}


void draw() {
  int al=frameCount%i;
  smooth();
  translate(300, 300);
  rotate(random(360));
  tint(random(255), random(255), random(255), al);
  shearX(PI/4.0);
  float b = random(0, 50);
  image(img, 100, 100, b, b);

  pushMatrix();
  float b2 = random(0, 80);
  tint(255, 255, 255, al);
  image(img2, random(1,10), random(1,10), b2, b2);
  popMatrix();

}



