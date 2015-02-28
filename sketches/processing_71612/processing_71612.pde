
//defining the mover class and mover object

class Mover {

  PVector location;//vector that defines starting position 
  PVector velocity;//vector that determines rate of change of motion and direct
  PVector mouse;//vector that describes mouse location
  PVector dir;//vector that defines direction
  PVector acceleration;//vector that defines rate of change of velocity
  float maxSpeed;//cap on max magnitude of speed

  Mover() {
    location = new PVector(random(0, width), random(height));//assign random location for the start position vector
    velocity = new PVector(0, 0);// assign a zero value to the initial velocity (starts slow)
    acceleration = new PVector(1,1);// has an acceleration so it does actually move
    maxSpeed = 10;
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouse, location);//subtract location from mouse, to get a target direction
    dir.normalize();//unitze dir vector, make this target direction equal for all objects
    dir.mult(0.5);//multiple by scalar value
    acceleration = dir;//assign the dir vector to the acceleration

    velocity.add(acceleration);//add accelration to velocity
    velocity.limit(maxSpeed);//limit to magnitude
    location.add(velocity);
  }
  void display() {
    strokeWeight(abs(location.x/50));//this adds more 3dimensionality to the sketch
    ellipse(location.x, location.y, 20, 20);
  }
  }


