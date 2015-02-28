
 
Eye e1, e2, e3, e4, e5, e6, e7, e8, e9;

void setup() {
  size(640, 360);
  noStroke();
  e1 = new Eye (250,  16, 120);
  e2 = new Eye (164, 185,  80);  
  e3 = new Eye (350, 200, 220);
  e4 = new Eye (43, 50, 123);
  e5 = new Eye (443, 70, 93);
  e6 = new Eye (590, 50, 23);
  e7 = new Eye (503, 291, 87);
  e8 = new Eye (45, 337, 137);
  e9 = new Eye (567, 145, 44);
}

void draw() {
  background(0, 0, 100);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);
  e9.update(mouseX, mouseY);
  
  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
  e9.display();
  
if (mousePressed){
    background (#CCFFCC);
}
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(250);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(#CC3366);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}



