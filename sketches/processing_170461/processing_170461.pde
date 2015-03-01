
Ball ball1;
Ball ball2;
Ball ball3;

Ball [] balls = new Ball[3];

void setup() {
  size(400, 400);
  
  for (int i = 0; i < balls.length; i ++ ) { 
    balls[i] = new Ball(); 
  }
}

void draw() {
  for (int i = 0; i < balls.length; i ++ ) {  
    balls[i].grow();
    balls[i].display();
    if (i>0){
    if (balls[i].intersect(balls[i-1])) { 
      color c = color(random(255),random(255),random(255));
      balls[i].resetMe(c);
      balls[i-1].resetMe(c);
    }}
  
  }
}

class Ball{
  color c;
  float x;
  float y;
  float r;
  int count=0;


void grow(){
  r= count; 
}

void display(){  
  ellipse(x,y,r*2,r*2);
  fill (c);
  noStroke();
  count++;

}

void resetMe(color c_){
  c= c_;
  x= random(400);
  y= random (400);
  r= random(5);
  count = 0;
  background (255);
}

boolean intersect (Ball b) {
 float distance = dist(x,y,b.x,b.y);
 if (distance < r + b.r) {
      return true;
    } else {
      return false;
    } 
 
 }
}



