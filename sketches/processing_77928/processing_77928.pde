




void setup() {
  
    size(640, 400);

  // Create the font
   textFont(createFont("Helvetica", 16));
  
  
}
  
void draw() {
  background(102);
  fill(0);
  textAlign(CENTER);
  text("left", mouseX - 40, mouseY);
  text("right", mouseX + 40, mouseY);
  text("up", mouseX, mouseY - 40);
  text("down", mouseX, mouseY + 40);
  
}




