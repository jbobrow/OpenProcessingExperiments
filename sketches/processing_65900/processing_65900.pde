
PVector location, destination, velocity, acceleration;
float d;
void setup() {
  size(800, 600);
  smooth();
  location = new PVector(width/2, height/2);
  destination = new PVector(mouseX, mouseY);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  background(255);
}

void draw() {
  ellipse(location.x, location.y, 15, 15);

  destination = new PVector(mouseX, mouseY);
  d = dist(destination.x, destination.y, location.x, location.y);
  if (d > 10) {
    PVector home = PVector.sub(destination, location);
    home.normalize();
    home.mult(1.1);
    acceleration = home;
    location.add(velocity);
    velocity.add(acceleration);
    if (d < 130) {
      velocity.limit(4 * sin(radians(d)));
    }
    else {
      velocity.limit(4);
    }
  }
}


