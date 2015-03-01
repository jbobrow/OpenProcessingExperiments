
int fillColor;
float circleX;
float circleY;
float diameter;
int circleSpacing=78;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  for (int i=0; i<13; i++) {
    for (int j=0; j<13; j++) {
      setCircleCoordinates(i, j);
      setFillRelativeToMouse();
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }
}

void setCircleCoordinates(int x, int y) {
  circleX =(.5*circleSpacing)+(x*circleSpacing);
  circleY=(.5*circleSpacing)+(y*circleSpacing);
}

void setFillRelativeToMouse() {
  fillColor = 156 - int(dist(mouseX, mouseY, circleX, circleY));
  if (fillColor<=63) {
    fillColor=90;
  }
 fill(random(255), random(255), random(255));noStroke();
}

void setDiameterRelativeToMouse(){
diameter=dist(mouseX/2,mouseY/2,circleX/2,circleY/2);
}

void drawOneCircle(){
  ellipse(circleX/2,circleY,diameter/2,diameter);
}
