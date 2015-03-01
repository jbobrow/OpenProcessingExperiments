
// The Nature of Code, Introduktion
// Random Walker

class Walker {
  float x;
  float y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    noStroke();
    fill(0,20);
    ellipse(x,y,5,5);
  }
  
  void step() {
    
    float r=random(1);
    
    float xstep;
    float ystep;
    
    if (r<0.02) {
      xstep = random(-75,75);
      ystep = random(-75,75);
    } else {
      xstep = random(-5,5);
      ystep = random(-5,5);
    }
    
    x += xstep;
    y += ystep;
    
  }
}

Walker w;

void setup() {
  size(1280, 720);
  w = new Walker();
  background(255);
}
  
void draw() {
  w.step();
  w.display();
}  
  
  
  
  


