
int fillColor;
float circleX;
float circleY;
float diameter;
int circleSpacing=80;

void setup(){
  size(1000, 1000);
}

void draw(){
  background(0);
  for (int i=0; i<13; i++){
    for (int j=0; j<13; j++){
      setCircleCoordinates(i, j);
      setFillRelativeToMouse();
      setDiameterRelativeToMouse();
      drawEllipse(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}

void setCircleCoordinates(int x, int y){
  circleX = (.5*circleSpacing)+(x*circleSpacing);
  circleY = (.5*circleSpacing)+(y*circleSpacing);
}

void setFillRelativeToMouse (){
  fillColor = 255 - int (dist(mouseX, mouseY, circleX, circleY));
  fill(fillColor);
  noStroke();
}

void setDiameterRelativeToMouse (){
  diameter = dist(mouseX, mouseY, circleX, circleY);
}


void drawEllipse(int x, int y, int i, int j) {
  float speed = abs(x-i) + abs(y-j);
  noStroke();
  fill(speed+(random(255)), speed+(random(255)), speed+(random(255)));
  ellipse(circleX, diameter, speed, speed);
//  stroke(speed+(random(255)), speed+(random(255)), speed+(random(255)));
//  line(mouseX, mouseY, speed, speed);
}




