
void setup() {
  size (400, 400);
  stroke (255);
  strokeWeight(3);
}
void draw() {
  background(#6C865A);
  
  line (200, 25, mouseX, mouseY);
  line (200, 375, mouseX, mouseY);
  line (25, 200, mouseX, mouseY);
  line (375, 200, mouseX, mouseY);
  
  line (25, 25, mouseX, mouseY);
  line (375, 375, mouseX, mouseY);
  line (375, 25, mouseX, mouseY);
  line (25, 375, mouseX, mouseY);
  
  line (25, 25, 25, 375);
  line (15, 25, 25, 375);
  line (25, 25, 375, 25);
  line (25, 25, 375, 15);
  line (375, 375, 25, 375);
  line (385, 375, 25, 385);
  line (375, 375, 375, 25);
  line (385, 375, 375, 25);
  
  ellipse (mouseX, mouseY, 25, 25);
  
  fill (#6c865a);
  ellipse (mouseX, mouseY, 50, 50);
  
  ellipse (25, 25, 25, 25);
  ellipse (375, 375, 25, 25);
  ellipse (25, 375, 25, 25);
  ellipse (375, 25, 25, 25);
  
}



