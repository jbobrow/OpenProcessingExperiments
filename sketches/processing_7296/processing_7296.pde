
int p1,p2,p3,p4,p5,p6;
int mx,my;
void setup() {
  size(400,400);
  smooth();
  ellipseMode(CENTER);
    background(0);
}
void draw() {
  p1 = int(random(400));
  p2 = int(random(400));
  p3 = int(random(400));
  p4 = int(random(400));
  p5 = int(random(400));
  p6 = int(random(400));
  fill(color(random(100),random(255),random(255)));
  triangle(p1,p2,p3,p4,p5,p6);
  mx = mouseX;
  my = mouseY;
  fill(color(random(100),random(255),random(255)));
  ellipse(random(400),random(400),random(160),random(160));
  stroke(255);
  strokeWeight(8);
  strokeWeight(random(2,6));
  stroke(random(255),random(255),random(255));
  for(int i = 0;i<50;i++) {
    point(random(400),random(400));
  }
}

