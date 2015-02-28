
// project 1

Blob myBlob1;
Blob myBlob2;

void setup() {
  size(500,500);
  myBlob1 = new Blob (color(255),0,50,2);
  myBlob2 = new Blob (color(100),0, 200,5);
}

void draw() {
  background(0);
  myBlob1.drive();
  myBlob1.display();
  myBlob2.drive();
  myBlob2.display();
}
class Blob {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Blob(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed; 
  }
  void display () {
    fill(c);
    stroke(255);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,100,100);
  }
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0; }
  }
}
    
  

