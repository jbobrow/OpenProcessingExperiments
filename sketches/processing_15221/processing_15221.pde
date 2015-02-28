
class Apple {
  float x,y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  float r;     // Radius of raindrop

  Apple() {
    r = 8;                 // All raindrops are the same size
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    speed = random(4, 7);   // Pick a random speed
  }

  // Move the apples down
  void move() {
    // Increment by speed
    y += speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + r*4) { 
      return true;
    } 
    else {
      return false;
    }
  }

  // Display the apple
  void display() {
    // Display the apple
    image(apple,x,y);
  }
  
// If the apple is caught
void caught() {
  // Stop it from moving by setting speed equal to zero
 speed = 0; 
  // Set the location to somewhere way off-screen
 y = - 1000;
// image(appleBit,x,y);
}
}

