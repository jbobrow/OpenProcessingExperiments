
Eye e1, e2;
PImage img;
PImage img2;

void setup()
{
  size(400, 600);
  smooth();
  noStroke();
  e1 = new Eye( 208,  310,  20);
  e2 = new Eye( 249,  310,  20); 
  img2 = loadImage("pic1stick.png");
  img = loadImage("pic1.jpg");
  e1 = new Eye( 208,  310,  20);
  e2 = new Eye( 249,  310,  20); 
 }
 
 void draw() {
   image(img, 0, 0);

 frameRate(24);
     
  e1.update(mouseX, 440);
  e2.update(mouseX, 440);
   
  e1.display();
  e2.display();
   
  image(img2, mouseX, 230);
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

