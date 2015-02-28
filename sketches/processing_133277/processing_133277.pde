
float circleX;
float circleY;
int resolution = 200;
float radius=50;
float waveMag = 200;
float waveNum = 10;
void setup() {
  size(800, 400);
  circleX = width*.5;
  circleY = height*.5;
  background(#ffffff);
  noStroke();
}



void draw() {
  waveMag = map(mouseX,0,width,5,width);
  resolution = mouseY;
  drawCircle();
}

void drawCircle() {

  beginShape();
  for (int i=0; i<resolution; i++) {
        fill(211,i,77,55);

    float waveAngle = map(i, 0, resolution, 0, TWO_PI*waveNum);
    float waveOffset = sin(waveAngle) * waveMag;
    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle)*(radius+waveOffset);
    float circleOffY = sin(angle)*(radius+waveOffset);
    float x = circleX + circleOffX + random(-1,1);
    float y = circleY + circleOffY + random(-1,1);
    ellipse(x, y,2,2);
//    fill(220,220,220,100);
  }
  endShape(CLOSE);
}

