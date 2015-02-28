
Ball[] balls = new Ball[1];
float gravity = 0.1;
float xSpeed = 0;
float ySpeed = 0;

void setup() {
  size(200,200);
  smooth();
  frameRate(30);
  for (int i=0; i < balls.length; i++) {
    balls[i] = new Ball(color(random(200)),random(width),random(height),10,0,0);
  }
}

void draw() {
  background(255);
  if ( mouseX-pmouseX > 0 ) {
    xSpeed = abs(mouseX-pmouseX);
  } else {
    xSpeed = -abs(mouseX-pmouseX);
  }
  
  if ( mouseY-pmouseY > 0 ) {
    ySpeed = abs(mouseY-pmouseY);
  } else {
    ySpeed = -abs(mouseY-pmouseY);
  }
  
  println(xSpeed);
  
  for (int i=0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
  }
}

void mousePressed() {
  Ball b = new Ball(color(random(200)),mouseX,mouseY,10,xSpeed,ySpeed);
  balls = (Ball[]) append(balls,b);
}



class Ball {
  float x;
  float y;
  float speedY;
  float speedX;
  float w;
  color c;

  Ball(color c_, float x_, float y_, float w_, float speedX_, float speedY_) {
    x = x_;
    y = y_;
    w = w_;
    speedY = speedY_;
    speedX = speedX_;
    c = c_;
  }

  void gravity() {
    speedY = speedY + gravity;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x,y,w,w);
  }

  void move() {
    y = y + speedY;
    if (y > height) {
      speedY = speedY *-0.95;
      y = height;
    }
    x = x + speedX;
    if (x > width) {
      speedX = speedX *-1;
      x = width;
    }
    if (x < 0) {
      speedX = speedX *-1;
      x = 0;
    }
  }
}


