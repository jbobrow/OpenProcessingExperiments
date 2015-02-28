
int rot=0;
void setup() {
  size(400,400,P3D);
  frameRate(30);
  smooth();
  strokeWeight(1);
}

void draw() {
  translate (width/2, height/2, 0);
  camera(60.0, -80.0, 400.0, 60.0, 12.0, 0.0, 0.0, 1.0, 0.0);
  background(255);
  for (int i=0; i<=10; i++) {
    hexagon(24);
    ninedots(10);
    translate (160*cos(radians(36)), 0, 160*sin(radians(36)));
    rotateY(36);
  }
  rot++;
}

void hexagon(int rad) {
  noFill();
  stroke(0);
  beginShape();
  for (int r=90; r<=450; r+=60) {
    vertex (rad*cos(radians(r)),rad*sin(radians(r)));
  }
  endShape();
}

void ninedots(int rad) {
  ellipseMode(CENTER);
  for (int x=-rad; x<=rad; x+=rad) {
    for (int y=-rad; y<=rad; y+=rad) {
      int rand = int(random(2));
      if (rand==0) {
        noFill();
        noStroke();
      } else {
        fill(0);
        stroke(0);
      }
      ellipse (x,y,int(rad/5),int(rad/5));
    }
  }
  delay(150);
}

