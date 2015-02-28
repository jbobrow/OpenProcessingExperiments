
// mouse PVector substraction
// processing.org/learning/pvector/
// 08.05.2012 10:30
// draw a line from window center to mouse position

void setup () {
  size(200,200);
  smooth();
  background(255);
}

void draw() {
  fill(255,20);
  rect(0,0,width,height); 
  
  // one PVector for mouse location
  // one PVector for center of window
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  // PVector substraction
  mouse.sub(center);
  
  // draw a line rapresenting the vector
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
