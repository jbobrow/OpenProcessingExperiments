
// this is what happens when the program starts :
// it only happens once.
void setup() {
  // this creates a canvas of 400 pixels wide
  // and 400 pixels high
  size(400, 400);
  // draw smoothly
  smooth();
  // press 3 times harder when drawing lines
  strokeWeight(8);
}

// this tells Processing how to draw :
// it happens continuously.
void draw() {
  // fill in the background
  background(200);
  // fill in my objects with light gray
  fill(230);
  // face!
  // draw a big round ellipse 
  ellipse(200, 200, 300, 300);
  
  // with lines that are white  
  stroke(200, 0, 0);
  // mouth
  // draw a line from 100, 250 to 300, 260
  // line(100, 260, 300, 240);
  // draw a rectangle
  fill(200, 0, 0);
  // start from 100, 260
  // width 200 height 20
  rect(100, 240, 200, mouseX/10);
  
  // nose
  stroke(200, 200, 0);
  // draw another line 200, 200 to 200, 220 
  line(200, 200, 200, 220);
  
  // with lines that are gray
  stroke(200);
  // fill in any objects with a different gray
  fill(50);
  // eyes
  ellipse(140, 180, 40, mouseX/5);
  ellipse(260, 180, 40, mouseY/5);
}
