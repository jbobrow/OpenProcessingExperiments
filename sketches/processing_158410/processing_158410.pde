

Oscillator[] oscillators = new Oscillator[10];

void setup() {
  size(400,400);
  background(255);
  smooth();
  
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  //background(255);
}

void draw() {
  //background(255);
  
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
  }
}
class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  PVector acceleration;
  
  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(random(width),random(height));
    acceleration = new PVector(random(-0.05,0.05),random(-0.05,0.05));
  }
void oscillate() {
  angle.add(velocity);
}

void display() {
  float x = cos(angle.x)*amplitude.x;
  float y = cos(angle.y)*amplitude.y;
  
  pushMatrix();
  translate(width/2,height/2);
  stroke(0);
  fill(175,12);
  line(0,0,x/2,y/2);
  ellipse(x/2,y/2,100,100);
  popMatrix();
}

}


