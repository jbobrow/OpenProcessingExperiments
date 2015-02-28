
Controller controller;
Timer timer;
Ball[] balls;
Healer[] healers;

boolean fire = false;
int numBalls = 125;
float diameter = 20;

void setup() {
  size(640, 740);
  controller = new Controller(diameter);
  balls = new Ball[numBalls];
  for (int i=0; i<balls.length; i=i+1) {
    balls[i] = new Ball(diameter);
  }
  healers = new Healer[10];
  for (int i=0; i<healers.length; i=i+1) {
    healers[i] = new Healer(diameter);
  }
  timer = new Timer(5000);
  timer.start();

  smooth();
}

void draw() {
  background(0);
  controller.setLocation(mouseX, mouseY);
  controller.display();

  for (int i=0; i<healers.length; i=i+1) {
    healers[i].move();
    healers[i].display();
  }

  for (int i = 0; i<balls.length; i++) {
    balls[i].move();
    balls[i].display();
  }

  if (fire == true) {
    for (int i = 0; i<balls.length; i++) {
      if (controller.intersect(balls[i])) {
        balls[i].infected();
        fire = false;
      }
    }
  }

  for (int j = 0; j<balls.length; j++) {
    for (int i = 0; i<balls.length; i++) {
      if (balls[j].intersect(balls[i]) && balls[i].isInfected()) {
        balls[j].infected();
      }
    }
  }

  for (int j = 0; j<balls.length; j++) {
    for (int i = 0; i<balls.length; i++) {
      if (balls[i].isInfected() && timer.isFinished() && balls[i].intersect(balls[j]) == false) {
        balls[i].cured();
        timer.start();
      }
    }
  }

  for (int j = 0; j<healers.length; j++) {
    for (int i = 0; i<balls.length; i++) {
      if (healers[j].intersect(balls[i])) {
        balls[i].cured();
      }
    }
  }
}

void mousePressed() {
  fire = true;
}

class Ball {

  float r;   // radius
  float x, y; // location
  float xspeed, yspeed; // speed
  color cFill = color(100, 50);
  color cStroke = color(100, 50);
  int infected = 0;
  

  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height-100);
    xspeed = random( - 1, 1);
    yspeed = random( - 1, 1);
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-100 || y < 0) {
      yspeed *= - 1;
    }
  }

  // Draw the ball
  void display() {
    noStroke();
    fill(cFill);
    stroke(cStroke);
    strokeWeight(2);
    ellipse(x, y, r*2, r*2);
    stroke(cStroke);
    strokeWeight(2);
    ellipse(x+2, y+2, r*2/2, r*2/2);
    // After the ball is displayed, the color is reset back to a darker gray.
    cFill = color(#9A109B,125);
    if (infected == 1) {
      cFill = color(#8E3437,215);
      cStroke = color(#8E3437);
    } else {
      cFill = color(#9A109B,125);
      cStroke = color(#F465F5);
    }
  }

  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball b) {

    // Objects can be passed into functions as arguments too! 
    float distance = dist(x, y, b.x, b.y); // Calculate distance

    // Compare distance to sum of radii
    if (distance < (r + b.r)/2) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean isInfected() {
    if (infected == 1) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  void infected() {
    infected=1;
  }
  
  void cured() {
    infected=0;
  }
}

class Controller{
  float r;
  float x,y;
  
  Controller(float tempR){
    r=tempR;
    x=0;
    y=0;
  }
  
  void setLocation(float tempX, float tempY){
    x = tempX;
    y = tempY;
  }
  
  void display(){
    noStroke();
    fill(255*0.5);
    ellipse(x,y,r*2,r*2);  
  }
  
  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball d) {
    
    // Objects can be passed into functions as arguments too! 
    float distance = dist(x,y,d.x,d.y); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < r + d.r) {
      return true;
    } else {
      return false;
    }
  }
}
class Healer {

  float r;   // radius
  float x, y; // location
  float xspeed, yspeed; // speed
  color c = color(100, 50);
  int infected = 0;

  // Constructor
  Healer(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height-100);
    xspeed = random( - 1, 1);
    yspeed = random( - 1, 1);
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-100 || y < 0) {
      yspeed *= - 1;
    }
  }

  // Draw the ball
  void display() {
    stroke(#0C390A);
    strokeWeight(2);
    fill(#7AF074,215);
    ellipse(x, y, r*2, r*2);
    
    stroke(#65BC61);
    strokeWeight(2);
    fill(#388E34,215);
    ellipse(x+2, y+2, r*2/2, r*2/2);
  }

  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball b) {

    // Objects can be passed into functions as arguments too! 
    float distance = dist(x, y, b.x, b.y); // Calculate distance

    // Compare distance to sum of radii
    if (distance < (r + b.r)/2) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Infector{
  float r;
  float x,y;
  int i = 0;
  
  Infector(float tempR){
    r=tempR;
    x=0;
    y=0;
  }
  
  void setLocation(float tempX, float tempY){
    x = tempX;
    y = tempY;
  }
  
  void display(){
    if (i<width){
      i = i+2;
      noStroke();
      fill(0);
      ellipse(x+i,y,r*2,r*2);
      ellipse(x,y+i,r*2,r*2);
      ellipse(x-i,y,r*2,r*2);
      ellipse(x,y-i,r*2,r*2);
    }
  }
}
class Timer {

  int savedTime;
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int passedTime = millis()-savedTime;
    if (passedTime > totalTime) {
      return true;
    }
    else {
      return false;
    }
  }
}



