
class Drop {
  PVector location;
  PVector velocity;
  PVector acceleration;

  boolean killMe = false;
  float noiseStep = 0.2;
  float noiseIndex = 0;
  int diameter = 16;
  float speedLimit = 3;

  Drop() {
    // set location, from top and left edge of screen
    if(random(1) < 0.5) {
      // from the top
      location = new PVector(random(width), -10);
    }
    else {
      // from the right
      location = new PVector(width + 10, random(height));
    }

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    acceleration = new PVector(random(-1,1),random(-1,1));
    acceleration.x -= (carSpeed / 10);
    acceleration.normalize();
    acceleration.mult(noise(noiseIndex += noiseStep) * 3);

    velocity.add(acceleration);
    velocity.x = constrain(velocity.x, -3, 3); // limit x velocity
    velocity.y = constrain(velocity.y, 0, speedLimit); // limit y velocity    
    location.add(velocity);
  }

  void display() {
    // tk a tail of diminishing size to get the drop shape?

    // simple square
    if(fancyGraphics == 0) {
      stroke(1);
      fill(200);
      rect(location.x, location.y, 16, 16);
    }

    // smear the window
    //window.beginDraw();
    window.fill(0);
    window.noStroke();
    window.ellipse(location.x, location.y, diameter, diameter);    
    //window.endDraw();

  }

  void checkEdges() {
    if (location.y > height) {
      // mark for deletion
      killMe = true;
    } 
  }

}

