
Eye e1, e2;
PImage head;
PImage blink;

void setup() 
{
  head = loadImage("Head.jpg");
  blink = loadImage("Blink.jpg");
  size(620, 620);
  smooth();
  noStroke();
  e1 = new Eye( 217,  221,  100);
  e2 = new Eye( 403,  222,  100);  
 }

void draw() 
{
  frameRate(24);
  background(0);
  image(head,0,0);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  
  e1.display();
  e2.display();
  
}

class Eye 
{
  int ex, ey;
  int size;
  float angle = 0.0;
  
  Eye(int x, int y, int s) {
    ex = x;
    ey = y;
    size = s;
 }

  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }
  
  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, size/3, size/3);
    popMatrix();
  }
}

void mousePressed() { 
  background(102);
  image(blink,0,0);
  frameRate(4);
  }

