
Eye e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12;


void setup() {
  size(400, 400);
  e1 = new Eye(width/4, height/4, width/20);
  e2 = new Eye(1.25*width/4, height/4, width/20);  
  e3 = new Eye(width/2, height/4, width/20);
  e4 = new Eye(1.15*width/2, height/4, width/20);
  e5 = new Eye(width/4, height/2, width/20);
  e6 = new Eye(1.25*width/4, height/2, width/20);
  e7 = new Eye(width/4, 3*height/4, width/20);
  e8 = new Eye(1.25*width/4, 3*height/4, width/20);
  e9 = new Eye(width/2, height/2, width/20);
  e10 = new Eye(1.15*width/2, height/2, width/20);
  e11 = new Eye(width/2, 3*height/4, width/20);
  e12 = new Eye(1.15*width/2, 3*height/4, width/20);
}

void draw() {
  background(0);
  stroke(255);
  ellipse(1.125*width/4, height/4, width/8, width/8);
  ellipse(1.125*width/4, height/2, width/5.5, width/5.5);
  ellipse(1.125*width/4, 3*height/4, width/8, width/8);
  
  ellipse(1.075*width/2, height/4, width/5, width/5);
  ellipse(1.075*width/2, height/2, width/6, width/6);
  ellipse(1.075*width/2, 3*height/4, width/7, width/7);
 
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);
  e9.update(mouseX, mouseY);
  e10.update(mouseX, mouseY);
  e11.update(mouseX, mouseY);
  e12.update(mouseX, mouseY);
 
  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
  e9.display();
  e10.display();
  e11.display();
  e12.display();
  
  
}

class Eye {
  float x, y;
  float size;
  float angle = 0.0;
  
  Eye(float tx, float ty, float ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(float mx, float my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(0, 255, 0);
    stroke(0, 255, 0);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    stroke(0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}
