
float def = 30;

void setup() {
  size(255, 255);
  noCursor();
  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(0);
  fill(mouseX, 0, 0);
  //line(mouseX-def, mouseY-def, mouseX+def, mouseY+def);
  //line(mouseX-def, mouseY+def, mouseX+def, mouseY-def);
  //line(mouseX-def*2, mouseY, mouseX+def*2, mouseY);
  //line(mouseX, mouseY-def*2, mouseX, mouseY+def*2);
  ellipse(mouseX-def, mouseY-def, mouseY/4, mouseY/4);
  ellipse(mouseX+def, mouseY-def, mouseY/4, mouseY/4);
  ellipse(mouseX-def, mouseY+def, mouseY/4, mouseY/4);
  ellipse(mouseX+def, mouseY+def, mouseY/4, mouseY/4);
  ellipse(mouseX, mouseY, mouseY/2, mouseY/2);
  
  fill(mouseY, 0, 0);
  ellipse(mouseX-def*2, mouseY, mouseY/6, mouseY/6);
  ellipse(mouseX+def*2, mouseY, mouseY/6, mouseY/6);
  ellipse(mouseX, mouseY-def*2, mouseY/6, mouseY/6);
  ellipse(mouseX, mouseY+def*2, mouseY/6, mouseY/6);
  ellipse(mouseX, mouseY, mouseY/6, mouseY/6);
}

