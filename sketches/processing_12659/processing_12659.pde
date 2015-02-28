
/// Rainy Monday
/// Week 3 Assignment
/// Gabriela Gutierrez

/// Let's make some raindrops

float x;
float y;

void setup() {
  size(600,400);  
  smooth(); 
  // Make raindrop appear at a random x position
  x = random(0,600);
}

void draw() {
  background(666699);
  
  // Display raindrops
  fill(255);
  ellipse(x,y,7,10);
  
  // Make them fall
  y = y + Y*9 ;
  
  // Make them stop at the ground
  if (y > 400) {
  y = 400;
  }   
}


