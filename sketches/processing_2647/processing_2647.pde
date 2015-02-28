

float x = 100;   // x location of square
float y = 0;     // y location of square

float speed = 0;   // speed of square

// A new variable, for gravity (i.e. acceleration).   
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.   
// Try changing this number to 2.0 and see what happens.
float gravity = 0.1;  

void setup() {
  size(640,480);

}

void draw() {
  background(25);

  // Display the square
  fill(204, 102, 0);
  stroke(0);
  rectMode(CORNERS);
  rect(x,y,710,710);  
  rect(23,y,741,741);
  triangle(x, y, 52, 62, 63, 33);
  
  // Add speed to location.
  y = y + speed;
  
  // Add gravity to speed.
  speed = speed + gravity;
  
  // If square reaches the bottom
  // Reverse speed
  if (y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    speed = speed * -0.95;  
  }
}









