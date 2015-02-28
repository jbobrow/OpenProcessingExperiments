
void setup() {
  size(600, 600);
  
}
  
void draw () {
  fill(255, 255, 255, 10);
  stroke(0);
  ellipse(300, 300, mouseX, mouseY);
  ellipse(50, 50, mouseX, mouseY);
  ellipse(50, 550, mouseX, mouseY);
  ellipse(550, 50, mouseX, mouseY);
  ellipse(550, 550, mouseX, mouseY);
 
  ellipse(300, 300, mouseY, mouseX);
  ellipse(50, 50, mouseY, mouseX);
  ellipse(50, 550, mouseY, mouseX);
  ellipse(550, 50, mouseY, mouseX);
  ellipse(550, 550, mouseY, mouseX);
  
}

