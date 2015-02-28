
  ArrayList alist = new ArrayList();
void setup() {
  size(500,500);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
  for (int i=0; i<6;i++) {
  alist.add(new Ball(int(250+i*random(-5,5)),int(250+i*random(-5,5))));

  }
  
  
  
}
int count = 300;
float x = 250;
float y = 250;

void draw() {
  fill(0,100);
  rect(0,0,500,500);
  stroke(185,100,100);
  fill(255);
  for (int i=0;i<alist.size();i++) {
    Ball ball = (Ball)alist.get(i);
    ball.drawBall();
    float distance = dist(x,y,ball.xPt,ball.yPt);
    if (distance > count/2-ball.sz/2) {
      float ang = atan2(y-ball.yPt, x-ball.xPt);
      ball.direction = ang;
      ball.speed = 4;
      ball.xInc= cos(ball.direction)*ball.speed;
      ball.yInc= sin(ball.direction)*ball.speed;
    }
      
  }
  noFill();
  stroke(60,100,100);
  strokeWeight(3);
  ellipse(x, y, count, count);
  strokeWeight(2);
  ellipse(x, y, count-13, count-13);
  strokeWeight(1);
  ellipse(x, y, count-25, count-25);

    
  x = x + mouseX/10-x/10;
  y = y + mouseY/10-y/10;
  //count++;
  //count = count%300;
}

class Ball{
  int sz = 30;
  float xPt;
  float yPt;
  float xInc;
  float yInc;
  float direction = 0;
  float speed = 0;
  
  public Ball(int x, int y){
    xPt = x;
    yPt = y;
  }
  void drawBall(){
    ellipse(xPt, yPt,sz,sz);
  
    if (speed > 0){
      speed -= 0.02;
    }
    else speed = 0;
    
    if ((xPt < sz/2) || (xPt > 500-sz/2)) {
      xInc = -xInc;
    }
      
    if ((yPt < sz/2) || (yPt > 500-sz/2)) {
      yInc = -yInc;
    }
    xPt += xInc*speed;
    yPt += yInc*speed;
    
  }
}




