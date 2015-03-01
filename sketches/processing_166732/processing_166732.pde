
float px;
float py;
PImage img;

void setup() {
  size(426, 426);
  frameRate(24);
  background(255);
  img = loadImage ("mascara_pacblue2.png");
}

void draw() {
  image(img, 0, 0);
  smooth();
  pushMatrix();
  stroke(0, 24, 108);
  strokeWeight(1);
  line(random(852), random(512), random(852), random(512));
  popMatrix();

  pushMatrix();
  stroke(1.5);
  stroke(255);
  line(random(852), random(512), random(852), random(512));
  popMatrix();
}

void mousePressed() {
  saveFrame("ghost-###.jpg");
}



