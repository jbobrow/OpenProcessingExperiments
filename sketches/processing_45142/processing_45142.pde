
class Drop {
  float x,y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  color c;
  float r;     // Radius of raindrop

    Drop() {
   // r = 8;                 // All raindrops are the same size
   r = dropRadius; //relating to the slider
    x = random(width);     // Start with a random x location
    y = -r*4;              // Start a little above the window
    speed = random(2,5);   // Pick a random speed
    c = color(knobR, knobG, knobB); // Color
  }

  // Move the raindrop down
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

  // Display the raindrop
  void display() {
    // Display the drop
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x,y + i*4,i*2,i*2);
    }
  }

  // If the drop is caught
  void finished() {
    finished = true;
  }
}



