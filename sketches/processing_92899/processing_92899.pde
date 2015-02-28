
float x;
float y;
float targetX;
float targetY;
float easing = .05;
void setup () 
{
  size (800,800);
  background (20,20,225);
  noStroke ();
  smooth ();
  PVector[] vels = { 
  new PVector(2.15, -1.35), 
  new PVector(-1.65, .42) 
};

}

void draw()
{
  background (20,20,225);
 targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1){
    x += dx * easing;
                  }
  targetY = mouseY;
  float dy =targetY - y;
  if (abs(dy) > 1){
    y += dy * easing;
}
fill (0,255,0);
ellipse(x,y,25,25);
noStroke();
 fill (225, 10,10);
  rect (100,100,175,230); 
  rect (375,400,175,230); 
}
void checkBoundaryCollision(Ball ball, PVector vel) {
  if (ball.x > width-ball.r) {
    ball.x = width-ball.r;
    vel.x *= -1;
  } 
  else if (ball.x < ball.r) {
    ball.x = ball.r;
    vel.x *= -1;
  } 
  else if (ball.y > height-ball.r) {
    ball.y = height-ball.r;
    vel.y *= -1;
  } 
  else if (ball.y < ball.r) {
    ball.y = ball.r;
    vel.y *= -1;
  }
}
class Ball{
  float x, y, r, m;
  Ball() {
  }
  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    m = r*.1;
  }
}








