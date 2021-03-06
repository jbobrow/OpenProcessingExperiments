

// 1D Collision

Ball[] balls = {new Ball(100, 200, 30), new Ball(300, 200, 30)};
Vect2D[] vels = {new Vect2D(1.3, 0), new Vect2D(-1.3, 0)};

void setup(){
  size(400, 400);
  smooth();
  noStroke();
}

void draw(){
  background(255);
  fill(150);
  for (int i= 0; i< 2; i++){
    balls[i].x += vels[i].vx;
    ellipse(balls[i].x, balls[i].y, balls[i].r*2, balls[i].r*2);
    checkBoundaryCollision(balls[i], vels[i]);
  }
  checkObjectCollision(balls, vels);
}

class Ball{
  float x, y, r;
  
  Ball(){
  }
  
  Ball(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
  }
}

class Vect2D{
  float vx, vy;
  
  Vect2D(){
  }
  
  Vect2D(float vx, float vy){
    this.vx = vx;
    this.vy = vy;
  }
}

//chekBoundaryCollision() function:
void checkBoundaryCollision(Ball ball, Vect2D vel){
  if (ball.x > width- ball.r){
    ball.x = width- ball.r;
    vel.vx *= -1;
  }
  else if (ball.x < ball.r){
    ball.x = ball.r;
    vel.vx *= -1;
  }
  else if (ball.y > height- ball.r){
    ball.y = height- ball.r;
    vel.vy *= -1;
  }
  else if (ball.y < ball.r){
    ball.y = ball.r;
    vel.vy *= -1;
  }
}

void checkObjectCollision(Ball[] b, Vect2D[] v){
  float d = dist(b[0].x, b[0].y, b[1].x, b[1].y);
  if (d < b[0].r+ b[1].r){
    Vect2D vTemp = new Vect2D();
    vTemp.vx = v[0].vx;
    v[0].vx = v[1].vx;
    v[1].vx = vTemp.vx;
  }
}

    
    
















































