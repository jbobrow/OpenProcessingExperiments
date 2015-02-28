
int index = 0;
PImage b;
float t=0;

void setup() {
  size(800, 800, P3D);
  frameRate(5);
  b = loadImage("bite.png");
  background(#00ccff);
}

void draw() {
  t+=random(0,1);
  translate(random(300,500), random(350,450));
  rotateZ(t);
  noFill();
  stroke(255);
  image(b, 0, 0, b.width/5, b.height/5);
}



