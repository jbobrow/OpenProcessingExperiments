

void setup() {
  size(400, 400);
 
  background(0);
  fill(225, 0, 0);
  rect(175, 150, 50, 200);
  fill(126);
  rect(125, 0, 50, 400);
  fill(0, 225, 0);
  rect(75, 250, 40, 100);
  fill(0, 0, 225);
  rect(75, 50, 50, 200);
  fill(0, 225, 0);
  ellipse(240, 400, 100, 100);
}



void draw() {
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);
 
  }
  line(mouseX-5, mouseY, mouseX+5, mouseY);
  line(mouseX, mouseY-5, mouseX, mouseY+5); 
  
  
}



