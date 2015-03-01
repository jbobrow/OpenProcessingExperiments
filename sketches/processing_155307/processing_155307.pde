
int num = 20;
int circles = 30;
float theta, x, y, xp, yp, xn, yn;
 
void setup() {
  size(700, 500);
  frameRate(100);
}
 
void draw() {
  background(20);
  fill(255, 50);
  stroke(0,150);
  strokeWeight(2);
  for (int i=0; i<circles; i++) {
    drawWobble(180-i*5,PI/circles*i);
  }
  theta += 0.0600;
}
 
void drawWobble(float radius, float offSet) {
  beginShape();
  for (int i=0; i<num; i++) {
    x = width/2+cos(TWO_PI/num*i+offSet)*radius*1.2;
    y = height/2+sin(TWO_PI/num*i+offSet)*radius;
    xp = map(sin(theta+(TWO_PI/num*i)), -1, 1, -40, 90);
    yp = map(cos(theta+(TWO_PI/num*i)*2), -1, 1, -20, 0);
    xn = map (cos(theta + (TWO_PI/num * i)), -1, 1, 20, 30);
    yn = map(sin(theta+(PI/num*i)*4), -1, 1, -30, 0);
    if (i==0) curveVertex(x+xp, y+yp);
    curveVertex(x+xp, y+yp);
    if (i==num-1) curveVertex(x+xp, y+yp);
    curveVertex(x+xn, y+yn);
  if (i==num+1) curveVertex(x+xp, y+yp);
  }
  
  endShape(CLOSE);
}
