
int num = 100;
PImage img;
 
crawl[] mycrawl = new crawl [num];
 
 
void setup() {
  img = loadImage("Picture 1.jpg");
  size(200, 200);
  background(0);
  smooth();
 
  for (int i=0; i<mycrawl.length; i++) {
    mycrawl[i] = new crawl();
  }
}
 
 
void draw() {
 
  for (int i=0; i < mycrawl.length; i++) {
 
    mycrawl[i].update();
    mycrawl[i].display();
  }
}
 
 
class crawl {
  // makes the composition begin drawing from the point 50, 110
  int x = int(50);
  int y = int(110);
 
  crawl() {
  }
 
  void update() {
    x = x + int(random(-10, 10));
    y = y + int(random(-10, 10));
  }
 
 
  void display() {
    // selects the color from the original image
    color c = img.get(x, y);
    stroke(c);
    point (x, y);
  }
}


