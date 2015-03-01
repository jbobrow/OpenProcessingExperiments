
int fillColor;
float circleX;
float circleY;
float diameter;
int circleSpacing=90;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  for (int i=0; i<799; i++) {
    for (int j=0; j<422; j++) {
      setCircleCoordinates(i, j);
      setFillRelativeToMouse();
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }
}

void setCircleCoordinates(int x, int y) {
  circleX =(.5*circleSpacing)+(x*circleSpacing);
  circleY=(3.5*circleSpacing)+(y*circleSpacing);
}

void setFillRelativeToMouse() {
  fillColor = 172 - int(dist(mouseX, mouseY, circleX, circleY));
  if (fillColor<=5) {
    fillColor=99;
  }
  fill(fillColor);
  noStroke();
}

void setDiameterRelativeToMouse(){
diameter=dist(mouseX,mouseY,circleX,circleY);
}

void drawOneCircle(){
  ellipse(circleX,circleY,diameter,diameter);
}
