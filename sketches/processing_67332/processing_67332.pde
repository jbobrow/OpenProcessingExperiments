
float circleX1, circleX2;
float circleY1, circleY2;

float XVel1;
float YVel1;
float XVel2;
float YVel2;


void setup(){
  size(500, 500);
  smooth();
  circleX1 = width/2;
  circleY1 = 50;
  circleX2 = width/2;
  circleY2 = 120;
  XVel1 = random(5, 8);
  YVel1 = random(8, 12);
  XVel2 = random(4, 10);
  YVel2 = random(7, 15);
}
void draw() {
  background(255);
  fill(255, 0, 255);
  noStroke();

  stroke(0);
  fill(0);
  ellipse(circleX1, circleY1, 100, 100);
  ellipse(circleX2, circleY2, 100, 100);
  
  if((circleX1 > width) || (circleX1 < 0)){
    XVel1 = XVel1 * -1;
  }
  if((circleX2 > width) || (circleX2 < 0)){
    XVel2 = XVel2 * -1;
  }
  if((circleY1 > height) || (circleY1 < 0)){
    YVel1 = YVel1 * -1;
  }
   if((circleY2 > height) || (circleY2 < 0)){
    YVel2 = YVel2 * -1;
  }
  // for(i = 0; i  
  
  circleX1 = circleX1 + XVel1;
  circleY1 = circleY1 + YVel1;
  circleX2 = circleX2 + XVel2;
  circleY2 = circleY2 + YVel2;
}

