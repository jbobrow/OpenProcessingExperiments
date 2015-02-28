
// this is what happens when the program starts
// it only happens once

void setup() {
  //this creates a canvas of 400 x 400 pixels
  size(400, 400);
  //draw smoothly
  smooth();

  //strokeWeight
  strokeWeight(10);
}

// this tells Processing how to draw
// it happens continuously

void draw() {
  background(128);
  fill(200);
  stroke(0);

  //draw a big round ellipse
  //at position 200,200
  ellipse(200, 200, 300, 300);

  fill(100);
  stroke(150);
  //eyes
  ellipse(150, 150, 70, mouseY/5);
  ellipse(250, 150, 70, mouseY/5);

  //mouth:
  //draw a line from 100,250 to 300,260
  // line(100, 250, 300, 260);
  fill(255,0,0);
  rect(100, 250, 200, mouseX / 10);
  
  //nose:
  //draw a line from 200,200 to 200,220
  line(200, 200, 200, 220);
}
