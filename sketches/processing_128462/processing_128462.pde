
//first, make divs from openprocessing.org under canvas transparent
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");// we call parent.document 'cause canvas are displayed in an ifram
// With the help of Poersch :) 
// http://forum.processing.org/two/discussion/2080/can-anyone-make-it-subtle-movements-and-flapping-

float yoff = 0.0;     
ArrayList<Fish> poop = new ArrayList();
void setup() {
  size(800, 360);
  for (int i=0;i<5;i++) {
    Fish f = new Fish(random(width), random(height-100, height));
    poop.add(f);
  }
  noStroke();
}
 
void draw() {
  background(-1,20);
  fill(#1C8AFC);
  beginShape(); 
  float xoff = 0;       
  for (int x = 0; x <= width; x += 30) {
    float y = map(noise(xoff, yoff), 0, 2, 50, height); 
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  for (int i=0;i<poop.size();i++) {
    Fish F = (Fish) poop.get(i);
    F.display();
    F.update();
  }
}
 
class Fish {
  float x, y;
  color c;
  Fish(float x, float y) {
    this.x = x;
    this.y = y;
    c = (color) random(#000000);
  }
 
  void display() {
    noStroke();
    fill(c);
    pushMatrix();
    translate(x, y + sin(frameCount / 30.0 + y) * 12.0);
    rotate(sin(frameCount / 30.0 + y + HALF_PI) * 0.3);
    pushMatrix();
    scale(sin(frameCount / 10.0 + y) * 0.3 + 0.7, 1.0); // The y creates a little more variety
    translate(-10, 0);
    triangle(0, 10, 0, -10, 10, 0);
    popMatrix();
    beginShape();
    vertex(0, 0);
    vertex(30, -15);
    vertex(45, 0);
    vertex(30, 15);
    vertex(0, 0);
    endShape();
    fill(0);
    ellipse(35, 0, 5, 5);
    popMatrix();
  }
 
  void update() {
    if(x>width) {
      x=0;
      c = (color) random(#000000);
      y = random(height-100, height);
    }
    x=x+1;
  }
}
