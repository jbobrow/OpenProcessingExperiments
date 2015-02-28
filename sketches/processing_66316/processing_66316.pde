
// Bouncing ball I give credit for http://www.learningprocessing.com
// From example 7-3: Bouncing ball with functions


int y = 0;
int speed = 5;

void setup() {
  size(300,300);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  moving(); 
  bouncing();
  display();
}


// A function to move the ball
void moving() { 
  // Change the y location by speed
  y+= speed;
}

// A function to bounce the ball
void bouncing() {
 
  if (y > 300 || y < 0) {
    speed *=  - 1;
  }
}

// A function to display the ball
void display() {
 
 // Apply Day04 mouseXY01_Color technique to the ball
 fill(100, y, 255);
  noStroke();
  rect(0, 0, width, height);
  
 // Color or the ball
  fill(0);
  ellipse(width/2,y,60,60);
}

