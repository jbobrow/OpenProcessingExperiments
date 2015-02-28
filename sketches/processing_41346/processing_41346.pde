


Bubble b1;
Bubble b2;

void setup() {
  size(200,200);
  b1 = new Bubble(64);
  b2 = new Bubble(64);
}

void draw() {
  background(255);
  b1.display();
  b1.jiggle(); 
  
  b2.display();
  b2.jiggle(); 

  
}


class Bubble {

  float x;
  float y;
  float r;
  
  Bubble(float tempR) {
    x = width/2;
    y = height/2;
    r = tempR;
    
  }

  void display() {
    noFill();
    stroke(0);
    ellipse(x, y, r, r);
  }

  void jiggle() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
    //x = x + 0.2;
  }
  

  
  
  
}



