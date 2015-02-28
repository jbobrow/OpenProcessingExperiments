
final int MAX = 11;

int [] sides;
float xCenter, yCenter;
float rad, rad2;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  
  sides = new int [MAX];
  xCenter = width/2;
  yCenter = height/2;
  rad = -200;
  rad2 = -50;
  
  translate( xCenter, yCenter);
  drawShape();
  drawStar();
}

void drawShape() {
  fill(255);
  stroke(255);
  strokeWeight(2);
  for( int i = 0; i<sides.length; i++) {
    rotate(radians(360.0/sides.length));
    line(0, rad, rad*sin(radians(360.0/sides.length)), rad*cos(radians(360.0/sides.length)));
    //ellipse(0, rad, 10, 10);
  }
}

void drawStar() {
  noFill();
  for( int i = 0; i<sides.length; i++) {
    rotate(radians(360.0/sides.length));
    beginShape();
      vertex(0, rad);
      vertex(rad2*sin(radians(360.0/sides.length)/2.0), rad2*cos(radians(360.0/sides.length)/2.0));
      vertex(rad*sin(radians(360.0/sides.length)), rad*cos(radians(360.0/sides.length)));
    endShape();
  }
}
