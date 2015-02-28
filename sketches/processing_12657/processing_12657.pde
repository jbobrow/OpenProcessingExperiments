
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
  
  // Multiple raindrops using a for loop
  for (float x = 100; x < 601; x = random(0,600)) {  
    // Draw a drop
    fill(255);
    ellipse(x,y,4,6);
    
  // Make raindrops "fall"
  y = y + 2;
  }


}

  
 

