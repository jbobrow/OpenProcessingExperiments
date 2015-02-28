
void setup() {
  size(500,500);
  background(100,250,90);
  smooth();
}

void draw() {

  fill(mouseX, mouseY, 255, 255);
  stroke(mouseY, mouseX, 5);
  ellipse(mouseX, mouseY, 50, 50);



  fill(mouseY, mouseX, 10, 10);
  stroke(mouseY, mouseX, 10);
  strokeWeight(mouseX);
  ellipse(mouseY, mouseX, 10, 10);
  
  
  line(mouseY,mouseX,abs(mouseX-pmouseY),120);
  
}

void mousePressed() {
 
  saveFrame("color.png");
}


