
float delta=3;
float r=100;
float i =0;
float idelta =1;
float startDeg =0;
float hue = 53;
boolean turnOn = false;

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0,1,50);

  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));

  noStroke();
  colorMode(HSB, 360, 100, 100);
  fill(hue, 62, 99);
  if (hue<360)
    hue+=5;
  else hue =0;
  drawCylinder(25, 50, 500);

  if (turnOn) {
    drawStairs();
  }
}

void drawStairs() {
  strokeWeight(2);
  stroke(0);
  fill(0, 1, 25);
  i=0;

  for (float z=0-300; z<200-300; z+=5) {
    for (float deg=startDeg+0; deg<startDeg+360; deg+=delta) {
      float theta=radians(deg);
      float nextTheta = radians(deg+delta);
      float x= r*cos(theta);
      float y=r*sin(theta);
      float x2 = r*cos(nextTheta);
      float y2 = r*sin(nextTheta);

      beginShape();
      vertex(x, y, z+(i));
      vertex(x2, y2, z+(i));
      vertex(x+x2, y+y2, z+5+(i));
      vertex(x+x, y+y, z+5+(i));
      endShape(CLOSE);

      i = i+ idelta;
    }
  }
  if (startDeg>=360) startDeg =0;
  else startDeg++;
}



void drawCylinder(int sides, float r, float h)
{
  float angle = 360 / sides;
  float halfHeight = h/1.5;
  // draw top shape
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, -halfHeight );
  }
  endShape(CLOSE);
  // draw bottom shape
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight );
  }
  endShape(CLOSE);
  // draw side shape
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
}


void mousePressed() {
  turnOn = !(turnOn);
}


