

class FlyingMeat {
  float  theta;
  float  distance;
  PImage meat;


// The constructor starts here; I am specifiying the type of meat image, the rotation, and the distance from the center
// This will allow FlyingMeat to be used as a variable type, which I think is cool
  FlyingMeat(PImage meatType, float tempTheta, float tempDistance) {
    meat = meatType;
    theta = tempTheta;
    distance = tempDistance;
  }

// This 
  void move() {
    theta = theta + random(.01,.08);
  }

  void display() {  
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    smooth();
    stroke(100);
    image(meat, distance, distance);
    popMatrix();
  }
}


