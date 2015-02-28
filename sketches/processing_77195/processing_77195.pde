
PFont f;
Eye e1, e2, e3, e4, e5, e6, e7, e8;

void setup() {
  size(800, 600);
  f = createFont ("Courier New-Bold", 16, true);
  noStroke();
  e1 = new Eye( 350,  75, 120);
  e2 = new Eye( 50, 400,  80);  
  e3 = new Eye( 675, 425, 200);
  e4 = new Eye( 425, 525, 50);
  e5 = new Eye( 600, 150, 150);
  e6 = new Eye( 150, 550, 75);
  e7 = new Eye( 350, 375, 225);
  e8 = new Eye( 65, 75, 100);
}

void draw() {
  background(65);
  
  textFont (f, 36);
  fill (200);
  text ("Yeah, they're watching you.", 100, 225);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);
  e4.update(mouseX, mouseY);
  e5.update(mouseX, mouseY);
  e6.update(mouseX, mouseY);
  e7.update(mouseX, mouseY);
  e8.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
  e4.display();
  e5.display();
  e6.display();
  e7.display();
  e8.display();
  
  textFont (f, 12);
  fill (200);
  text ("created using Processing and Processing.js", 525, 575);
  textFont (f, 16);
  fill (200);
  text ("Kenny Rose Design", 200, 575);
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
    fill(255, 127, 127);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(75, 102, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}



