
Oscillator[] oscillators = new Oscillator[100];

void setup()  {   
  size(640,360);  
  smooth();  
  // Initialize all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator();
  }
  background(255);  
}   

void draw() {     
  background(255);  
  // Run all objects
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
  }
}

class Oscillator {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  float curAngle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.00001;

  Oscillator() {   
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amplitude = new PVector(random(20, width/2), random(20, height/2));
  }   

  void oscillate() {
    angle.add(velocity);

    aVelocity += aAcceleration;
    curAngle += aVelocity;
  }   

  void display() {   

    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);    
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    rotate(curAngle);
    line(0, 0, x, y);
    ellipse(x, y, 32, 32);
    popMatrix();
  }
}   

