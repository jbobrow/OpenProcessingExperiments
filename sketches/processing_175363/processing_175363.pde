
Oscillator[] oscillators = new Oscillator[10];

void setup()  {   
  size(640,360);  
  smooth();  
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(i);
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

  Oscillator(int i) {
    if (i < 5) {
      angle = new PVector(-100, TWO_PI * i / 4);
      velocity = new PVector(0.05, 0.05);
      amplitude = new PVector(50, 50);
    } else {
      angle = new PVector(100, TWO_PI * (i - 5) / 4);
      angle = new PVector(100, i);
      velocity = new PVector(0.05, 0.05);
      amplitude = new PVector(50, 50);
    }
  }   

  void oscillate() {
    angle.y += velocity.y;
  }   

  void display() {   

    //float x = sin(angle.x)*amplitude.x;
    float x = angle.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    line(0, 0, x, y);  
    ellipse(x, y, 32, 32);  
    popMatrix();
  }
}   


