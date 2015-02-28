
void setup() {
  size(300, 300); 
  smooth();
  background(0);
}

float x = 0;
float y = 300;

void draw() {

  colorMode(RGB);
  fill(mouseX, 8);
  rect(-10, -10, height+11, width+11);

  noFill();
  stroke(mouseX, mouseY, 97);
  ellipse(mouseX, mouseY, mouseX, mouseX);

  stroke(255);
  beginShape();
  curveVertex(40, mouseY); //curve
  curveVertex(mouseY, mouseX); 
  curveVertex(180, mouseX);
  curveVertex(mouseY, 100);
  curveVertex(mouseY, mouseX); 
  curveVertex(mouseX, mouseX);
  endShape();

  colorMode(HSB);
  stroke(mouseX, 100, 200);
  rect(x, x+.25, x+.25, x++);

  stroke(100, 200, 150);
  rect(y, y-.25, y-.25, y--);

  stroke(150, 100, 150);
  rect(-y, -y-.25, -y-.25, -y--); 

  stroke(100, 200, mouseY);
  rect(-y, -y+.25, -y+.25, -y++);

  if (x > width) {
    x = 0;//repeating square
  }
}


