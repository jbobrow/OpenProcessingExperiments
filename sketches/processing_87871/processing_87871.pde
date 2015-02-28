

/* @pjs preload="grandmere.JPG"; */
PImage imge;
void setup() {
  size(800, 800);
  imge = loadImage("grandmere.JPG");
  image(imge, 125, 40);
}
void draw() {
  fill(random(0, 256), random(0, 256), random(0, 256));
  noStroke();
  rect(0, 0, 100, 800);
  rect(700, 0, 100, 800);
  rect(100, 700, 800, 100);
  int eyeLeftX = 320;
  int eyeY = 270;
  int eyeRightX = 505;
  int leftXShift = 0;
  int leftYShift = 0;
  int rightXShift = 0;
  int rightYShift = 0;
  fill(0);

}


