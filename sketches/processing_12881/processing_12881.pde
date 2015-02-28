
//This code was taken from: Bouncing Ball Class, "http://www.learningprocessing.com/examples/chapter-10/example-10-2/", (accessed 1 Oct 2010)
//This code was adapted to conform to an electron-like element within my concept of Sydney resembling a circuit-board


class electron {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  electron(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 3,3);
    yspeed = random( - 3,3);
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // Draw the electron
  void display() {
    stroke(255);
    fill(255,90);
    ellipse(x,y,r*2,r*2);
  }
}





