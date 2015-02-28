
void setup() {
  size (500, 500);
}
void draw () {
  background (255, 0, 0);
  noStroke();
  fill(0);
  ellipse(height/2, width/2, mouseX - mouseY, mouseY);
  fill(0);
  ellipse(height/2, width/2, mouseX, mouseY - mouseX);
  
  

  
}
