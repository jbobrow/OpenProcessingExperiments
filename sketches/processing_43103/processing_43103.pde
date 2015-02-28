
int nextball = 0; //to spawn and display the correct ball(s)
int thisball; //to reference the current ball
Ball[] balls = new Ball[100]; //balls for everyone!

void setup() {
  size (500,500);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  colorMode(HSB);
}

void draw() {
  background (255);
  for (int i=0; i < nextball; i++) {
    if (mousePressed){
      balls[thisball].setLocation(mouseX,mouseY);
    }
    balls[i].display();
    //balls[i].derp1();
    //balls[i].derp2();
    balls[i].draw();
    collisionTestAll();
  }
}

void mousePressed() {
  if (nextball < balls.length) {
    balls[nextball] = new Ball(mouseX,mouseY,color(int(random(255)),255,175)); //ball of random color created where user clicks
    thisball = nextball;
    nextball++;
  } else if (thisball == nextball - 1){
    thisball = 0;  //effectively loops thisball when it reaches the maximum without looping nextball
  } else {
    thisball++;
  }
}

void mouseReleased() {
  float xthrow = (mouseX - pmouseX)*.85;
  float ythrow = (mouseY - pmouseY)*.85;
  balls[thisball].setSpeed(xthrow, ythrow);
}

class Ball {
  color c;
  float x, y, xspeed, yspeed;
  float diameter = 10;
  float radius = diameter/2;
  float gravity = 0.2;
  
  Ball(float inX, float inY, color inC) {
    c = inC;
    x = inX;
    y = inY;
  }
  void display() {
    //apply friction
    float decay = 0.99;
    xspeed *= decay;
    yspeed *= decay;
    //apply gravity
    yspeed += gravity;  
    //apply movement
    x += xspeed;
    y += yspeed;
    //...check boundaries
    checkBoundaries();
  }
  
  void checkBoundaries() {
    radius = diameter/2; //this is what a radius is!
    if (y >= height - radius) {
      y = height - radius;
      yspeed = -yspeed;
    } else if (y <= radius) {
      y = radius;
      yspeed = -yspeed;
    }
    if (x >= width - radius) {
      x = width - radius;
      xspeed = -xspeed;
    } else if (x <= radius) {
      x = radius;
      xspeed = -xspeed;
    }
  }
  
  void setLocation(float inX, float inY) {
    x = inX;
    y = inY;
  }
  void setSpeed(float inXspeed, float inYspeed) {
    xspeed = inXspeed;
    yspeed = inYspeed;
  }
  //here be dragons
  void derp1() { //sends the ball flying when it is near a resting state, sometimes doesn't work for some reason
    if (abs(xspeed) < 0.1 && abs(yspeed) < 0.1 && y >= (height-radius)-1) {
      y--;
      xspeed = random(-30,30);
      yspeed = random(30);
    }  
  }
  void derp2() { //balls increase in size a bit when they bounce off the ground, when in resting state they grow huge
    if (y + radius == height && diameter < width){
      diameter++;
      //y--;
    }
  }
  //safe zone
  void draw() {
    fill(c);
    ellipse(x,y,diameter,diameter);
  }
}

//LOOOOOOOOOOOOOOOL
boolean collision(int ball1,int ball2) {
  float distance = dist(balls[ball1].x, balls[ball1].y, balls[ball2].x, balls[ball2].y);
    if (distance <= balls[ball1].radius + balls[ball2].radius) {
      return true;
    } else {
      return false;
    }
  }
void collisionTestAll() { //SHITTIEST COLLISION TEST EVER 
  for (int i=0; i < nextball; i++) {
    for (int i2=i+1; i2 < nextball; i2++) {
      if (collision (i2,i) && ((balls[i2].y+balls[i2].radius) < height-5 || (balls[i].y+balls[i].radius) < height-5)) {
        balls[i2].c = color(int(random(255)),255,175);
        balls[i].c = color(int(random(255)),255,175);
        /*balls[i2].yspeed *= -1;
        balls[i2].xspeed *= -1;   //lolnothisisterrible
        balls[i].yspeed *= -1;
        balls[i].xspeed *= -1;*/
      }
    }
  }
}

