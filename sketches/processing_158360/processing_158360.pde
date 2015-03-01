

Oscillator[] oscillators = new Oscillator[30];

void setup() {
  size(400,400);
  //background(255);
  smooth(0);
  
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  background(10);
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
  
  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(random(width/2),random(height/2));
  }
void oscillate() {
  angle.add(velocity);
}

void display() {
  float x = sin(angle.x)*amplitude.x;
  float y = sin(angle.y)*amplitude.y;
  
  pushMatrix();
  translate(width/2,height/2);
  stroke(0,180,180,12);
  fill(0,180,180,100);
  line(0,0,x,y);
  ellipse(x,y,5,5);
  popMatrix();
}

}


