
// this is what happens when the program starts:
// it only happens once.
void setup() {
  // this creates a canvas of 400 pixels wide
  // and 400 pixels high
  size(400, 400);
  
  //draw smmothly:
  smooth();
  
  //press 3 times harder when drawing lines
  strokeWeight(10);
}

// this tells Processing how to draw
// it happens continuously
void draw() {
  
  background(10,55,55);
  //fill in any objects with light gray
   fill(178, 235, 244);
   
  // face!
  // draw a big round ellipse
  // at position 200, 200
  // with width 300
  // and height 300
  ellipse (200, 200, 300, 300);
  
  // fill in any objects with a different gray
  fill(100, 55, 55);
  stroke(150);
  
  // eyes!
  ellipse (145, 160, 50, mouseY / 5);
  ellipse (265, 160, 50, mouseY / 5);
  
  //red mouth:
  fill (200, 50, 50);
  
   // mouth!
   // draw a line from 100,250 to 300,300
    //line (100, 250, 300, 260);
   rect (100, 250, 200, mouseX / 10);
  
  // nose!
  // draw another line 200,200 to 200,220
  line (200, 200, 200, 220);
}
