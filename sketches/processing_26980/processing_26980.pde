
// An array of balls 
Ball[] balls = new Ball[1000];

int totalBalls = 0;
void setup() { 
  size(400,400); 
  smooth(); 
  background(255);
}
void draw() { 
  background(0);
  
// Initialize one ball 
balls[totalBalls] = new Ball(); 
totalBalls++; 
// If the ball hits the end of the array 
if (totalBalls >= balls.length) { 
totalBalls = 0; //Start over 
}

// Move and display balls 
for (int i = 0; i < totalBalls; i++) {
balls[i].move(); 
balls[i].display();
}
}
class Ball {
float x,y;	// Variables for location of ball
float speed; // Speed of ball
color c; 
float r;	// Radius of ball

Ball() { 
  r = 3;
y = random(height); 
x = -r*10; 
speed = random(2,7); //first number=bottom speed and 2nd number = top speed
c = color(247,7,28);
}
//Move the ball down 
void move() {
x += speed;	// Increment by speed

}

// Check the ball it hits the bottom 
boolean reachedBottom() {
// If the ball goes past the bottom 
if (x > width+r*7) {
return true; 
} else {
return false;
}
}
// Display the ball
void display() {
fill(247,7,28); 
noStroke(); 
ellipse(x,y,r*10,r*10);
}
}

