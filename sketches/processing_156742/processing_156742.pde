
float circleX;
float circleY;
float circleX2;
float circleY2;
float diameter1;
float diameter2;
float diameter3;
float diameter4;
int circleSpacing = 80;

void setup(){
  size(1000,700);
}

void draw(){
  background(0);

  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      setCircleCoordinates(i,j);
      setDiameterRelativeToMouse();
      drawOneCircle();
    }
  }
}

void setCircleCoordinates( int x, int y){
  circleX = width/2-((.5*circleSpacing) + (x*circleSpacing));
  circleY = height/2-((.5*circleSpacing) + (y*circleSpacing));
  circleX2 = width/2+((.5*circleSpacing) + (x*circleSpacing));
  circleY2 = height/2+((.5*circleSpacing) + (y*circleSpacing));
}



void setDiameterRelativeToMouse(){
  diameter1 = dist(mouseX, mouseY, circleX, circleY);
  diameter2 = dist(mouseX, mouseY, circleX, circleY2);
  diameter3 = dist(mouseX, mouseY, circleX2, circleY);
  diameter4 = dist(mouseX, mouseY, circleX2, circleY2);
}

void drawOneCircle(){
  ellipse(circleX, circleY, diameter1, diameter1);
  ellipse(circleX, circleY2, diameter2, diameter2);
  ellipse(circleX2, circleY, diameter3, diameter3);
  ellipse(circleX2, circleY2, diameter4, diameter4);
}
