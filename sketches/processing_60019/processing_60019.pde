
void setup() {
  size(500,500);
  background (0);
  smooth();
} 
float angle = 0; // 0 ~ 360  -> 0 ~ 2*PI
float distance = 0;
float circleSize = 0;
void draw() {
  angle = angle + 80;
  // 거리를 계속 더해주는 변수
  distance = distance + 30;

  float distance2 = 100*sin(distance*(PI/180));
  circleSize = circleSize + 1;

  float circleSize2 = 40*sin(circleSize*(PI/180));
  float circleX = mouseX + distance2*cos(angle*(PI/180));
  float circleY = mouseY + distance2*sin(angle*(PI/180));
  fill(mouseX,mouseY,100);
  noStroke();
 ellipse(circleX, circleY, circleSize2, circleSize2);

}

