
void setup() {
  size(500, 500);
  background(152, 89, 89);
 }

void draw() {
  if (mousePressed){
  background (152, 89, 89);
  }
  
  stroke(50, 50, 50);
  fill(255, 224, 157, 18);
  ellipse(mouseX, 210, 250, 250);

  fill(160, 210, 230);
  rect(245, mouseY, 10, 240);
  
  fill(252, 168, 168, 63);
  rect(100, mouseY, 10, 240);
  
  fill(0, 0, 0);
  ellipse(mouseY+25, mouseX, 10, 10);
  
  fill(160, 210, 230);
  rect(mouseX/3, 245, 10, 240);

  fill(255, 255, 255, 25);
  ellipse(mouseX, mouseY, 70, 70);
  
  fill(205, 205, 205);
  ellipse(mouseX+15, mouseY, 25, 25);
  
  fill(255, 255, 255);
  ellipse(mouseY, mouseX, 70, 70);
}
