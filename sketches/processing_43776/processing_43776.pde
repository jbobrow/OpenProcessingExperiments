
PImage bg;
Ball[] balls = new Ball [1];
float gravity = 0.1;

void setup(){
  size(800,507);
  bg= loadImage ("bed.png");
  frameRate(30);
  balls[0] = new Ball (50,0,100);
}

void draw(){
  image(bg,0,0);
for (int i=0; i<balls.length; i++) {
  balls[i].gravity();
  balls[i].move();
  balls[i].display();
}
}
void mousePressed() {
  Ball b = new Ball (mouseX,mouseY,10);
  //a new ball object
  balls= (Ball[]) append(balls,b);
}

class Ball {
  float x;
  float y;
  float speed;
  float w;
  
  Ball(float tempX, float tempY, float tempW){
 x = tempX;
 y= tempY;
 w= tempW;
 speed = 0;
  }
  
  void gravity() {
    speed= speed + gravity;
  }
  
  void move() {
    y = y + speed;
    if (y> height) {
      speed = speed * -0.95;
      y= height;
    }
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(x,y,w,w);
  }
}

