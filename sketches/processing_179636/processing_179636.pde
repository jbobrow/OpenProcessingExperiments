
PVector velocity = new PVector(0.01, 0.01);
PVector offset = new PVector(0.0, 50.0);

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw()
{

  PVector location = new PVector(noise(offset.x)*width, noise(offset.y)*height);
  
  offset.add(velocity);
  
  fill(200, 200, 200, 30);
  stroke(255);
  ellipse(location.x,location.y, 64, 64);
  
}
