
/* symmetry_pen */
/* draw symmetrical red and blue lines with the mouse */
/* rfboyce@gmail.com */
/* 08 Feb 2012 */

/* define globals */
color bgFill = color(0, 0, 0);
color penStroke = color(0, 255, 0);
color bluePenStroke = color(0, 0, 255);

/* set the canvas and base shapes*/
void setup(){
  size(600, 400);
  background(bgFill);
}

void draw(){
  rectMode(CORNER);
  noStroke();
  fill(bgFill, 10);
  rect(0, 0, width, height);
  smooth();
  // draw a pen tool
  strokeWeight(2);
  stroke(penStroke);
  line(mouseX, mouseY, pmouseX, pmouseY); 
  // and its reflection around Y
  pushMatrix();
  translate(width, 1);
  scale(-1, 1);
  stroke(penStroke, 80);
  line(mouseX, mouseY, pmouseX, pmouseY);
  popMatrix();
  // its reflection around X
  pushMatrix();
  translate(1, height);
  scale(1, -1);
  stroke(bluePenStroke, 100);
  line(mouseX, mouseY, pmouseX, pmouseY);
  popMatrix();
  // and its reflection around Y and X
  pushMatrix();
  translate(width, height);
  scale(-1, -1);
  stroke(bluePenStroke, 180);
  line(mouseX, mouseY, pmouseX, pmouseY);
  popMatrix();
}

/* print canvas when "p" is pressed */
void keyPressed(){
  if (key == 'p') {
    save("symmetry_pen.jpg");
  }
}


