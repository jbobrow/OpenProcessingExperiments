
// this is what happens when the program starts:
//it only happens once.
void setup() {
  //this creates a canvas of 400 pixels wide
  //and 400 pixels high
  size(400, 400);
  smooth();
  //press 3 times garder when drawing lines
  strokeWeight(10);
}
void draw() {
  background(128);
  stroke(0);


  fill(300, 200, 0);

  //face!
  //this tells Processing how to draw
  //it happens continuously

  //draw a big round ellipse
  //at position 200,200
  //width 300
  //heights 300
  ellipse(200, 200, 300, 300); 


  //eyes!
  fill(100, 300, 0);
  stroke(150);
  ellipse(150, 150, 50, mouseX / 5);
  ellipse(250, 150, 50, mouseY / 5);

  fill(200, 50, 50);
  rect(100, 250, 200, mouseX / 10);

  //draw another line from 200, 200 to 200, 220
  line(200, 200, 200, 220);
}
