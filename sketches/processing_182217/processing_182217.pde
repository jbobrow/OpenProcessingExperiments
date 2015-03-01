
// The Nature of Code, Introduktion
// Random Walker

class Walker {
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    noStroke();
    fill(0,50);
    ellipse(x,y,5,5);
  }
  
  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      x=x+4;
    } else if (choice == 1) {
      x=x-4;
    } else if (choice == 2) {
      y=y+4;
    } else {
      y=y-4;
    }
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
  
  
  
  


