
//Candice Ferreira. Problemset 3 Question 4
// Complex
complex c[] = new complex[1000];

void setup() {
  size(400,400);
  smooth();
  for (int i = 0; i < c.length; i++) {
    c[i] = new complex(20,20,20,20);
  }
  
}
  
  void draw() {
    background(220);
    for (int i = 0; i < c.length; i++) {
      c[i].display();
    
    }
  }
  
  
  
  class complex {
    float x;
    float y;
    float w;
    float h;
    
    complex( float x, float y, float w, float h) {
      this.x = random(0,height);
    this.y = random(0,width);
    this.w = random(5,20);
    this.h = random(5,20);
    }
    
    void display() {
      rectMode(CENTER);
      noFill();
      stroke(25);
      rect(x,y,w,h);
    }
  }

