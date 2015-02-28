
int i=0;
void setup() {
  size(400,400);
  frameRate(2);
  smooth();
}
void draw() {
  background(255);
  translate (width/2, height/2);
  hexagon(120);
  ninedots(50);
}
void hexagon(int rad) {
  strokeWeight(4);
  strokeJoin(ROUND);
  strokeCap(ROUND);
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
}               
