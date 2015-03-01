
int fillColor;
float circleX;
float circleY;
float diameter;
int circleSpacing=80;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);
  for (int i=0; i<233; i++) {
    for (int j=0; j<123; j++) {
      setCircleCoordinates(i, j);
      setFillRelativeToMouse();
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }
}

void setCircleCoordinates(int x, int y) {
  circleX =(.5*circleSpacing)+(x*circleSpacing);
  circleY=(1*circleSpacing)+(y*circleSpacing);
}

void setFillRelativeToMouse() {
  fillColor = 255 - int(dist(mouseX, mouseY, circleX, circleY));
  if (fillColor<=74) {
    fillColor=214;
  }
  fill(fillColor);

}

void setDiameterRelativeToMouse(){
diameter=dist(mouseX,mouseY,circleX,circleY);
}

void drawOneCircle(){
  ellipse(circleX/.5,circleY/2,diameter*.5,diameter*.5);
}
