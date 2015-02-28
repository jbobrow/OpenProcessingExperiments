
/**
 * Continuous Lines. 
 * 
 * Click and drag the mouse to draw a line. 
 */

void setup() {
  size(400, 400);
  background(#D6D1BC);
  String s = "Use Mouse to draw line and tap B to place badges in network";
fill(50);
text(s, 10, 370, 400, 60);  // Text wraps within text box
}

void draw() {
  stroke(255);
  if (mousePressed == true) {
    stroke(#FA675B);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      stroke(#FA675B);
      fill(#69D7C4);
      ellipse(mouseX,mouseY,20,20);
    }
  }
}


