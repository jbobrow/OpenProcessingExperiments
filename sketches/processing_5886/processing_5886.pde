
Ball[] balls = new Ball[1];
float gravity = 0.1;
int xy = 10;
int blauw = 20;
int rood = 40;
int groen = 60;

void setup() {
  size(600,620);
  smooth();
  frameRate(25);
  
balls[0] = new Ball(50,0,16);
}

void draw() {
  //background(100);
  for (int i = 0; i < balls.length; i++ ) {
  balls[i].gravity();
  balls[i].move();
  balls[i].display();
  }
}


void mousePressed() {
  Ball b = new Ball(mouseX,mouseY,xy);
  xy = int (random(2,15));
  
  balls = (Ball[]) append(balls,b);
  }
  
  
  class Ball {
  float x;
  float y;
  float speed;
  float w;
  
  Ball(float tempX, float tempY, float tempW) { 
  x = tempX;
  y = tempY;
  w = tempW;
  speed = 8;
  }
  
void gravity() {
  
  speed = speed + gravity;
  }

void move() {
  
  y = y + speed;
  
  if (y > height) {
  speed = speed * -0.75;
  y = height;
  }
}

void display() {
  
  fill(rood,blauw,groen);
  noStroke();
  ellipse(x,y,w,w);
  
    blauw = int(random(0,255));
    rood = int(random(0,255));
    groen = int(random(0,255));
  }
}

