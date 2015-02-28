
Ball ball1;
Ball ball2;

float x = 100;
float y = 0;

float speed = 0;
float gravity = 0.1;  

void setup() { 
  size(200, 200); 
  ball1 = new Ball(color(255, 0, 0), 50, 0, 16);
  ball2 = new Ball(color(0, 0, 255), 100, 50, 32);
} 

void draw() { 
  background(255); 
  ball1.display();
  ball2.display();
  ball1.update();
  ball2.update();
} 

class Ball {
  
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Ball(color tempC, float tempXpos, float tempYpos, float tempXspeed) {  
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = 0;
 
  }
 
 void display() {
   fill(c);
   noStroke();
   rectMode(CENTER);
   rect(xpos, ypos, 20, 20);
 }
   
 void update() {
  ypos = ypos + xspeed;
  xspeed = xspeed + gravity;
  
  if (ypos > height) {
    xspeed = xspeed * -0.95;
   
  }
 }
}

