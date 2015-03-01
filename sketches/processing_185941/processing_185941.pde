
void setup() {
  smooth();
  size(510, 510);
  background(255,0,153);
}

void draw() {

stroke(255,0,0);
noFill();
beginShape();
//vertex(50, 15); 
//bezierVertex(50, -5, 90, 5, 50, 40); 
//vertex(50, 15); 
//bezierVertex(50, -5, 10, 5, 50, 40); 

vertex(mouseX, mouseY); 
bezierVertex(mouseX, mouseY-20, mouseX+40, mouseY-10, mouseX, mouseY+25); 
vertex(mouseX, mouseY); 
bezierVertex(mouseX, mouseY-20, mouseX-40, mouseY-10, mouseX, mouseY+25); 
textSize(32);
text("Jojo", mouseX, mouseY+50); 


endShape();

 
}


