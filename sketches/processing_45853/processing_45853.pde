

// Based on Daniel Shiffman http://www.learningprocessing.com

// A Class to describe a "Bubble"

class Bubble {
  float x,y;
  float diameter;
  float speed;
  float r,g;
  
  // The constructor initializes color and size
  // Location is filled randomly
  Bubble(float r_, float g_, float diameter_) {
    x = random(width);
    y = height;
    r = r_;
    g = g_;
    diameter = diameter_;
  }
  
  // Display the Bubble
  void display() {
    stroke(20);
    fill(r*100,g,255,150);
    ellipse(x,y,diameter+50,diameter+50);
  }
  
  // Move the bubble
  void drift() {
    y += random(-5,-0.1);
    x += random(-1,1);
    if (y < -diameter*2) {
      y = height + diameter*2;
    }
  }

}

