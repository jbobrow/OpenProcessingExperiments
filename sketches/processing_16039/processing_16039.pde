
void setup() {
   size(800, 800);
   smooth();
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255, 255, 255);
  }
  ellipse(width/2+mouseY, height/2, mouseX, mouseY);
  ellipse(width/2-mouseY, height/2, mouseX, mouseY);
  ellipse(width/2, height/2+mouseX, mouseX, mouseY);
  ellipse(width/2, height/2-mouseX, mouseX, mouseY);
  ellipse(mouseX, mouseY, 80, 80);
  fill(255); 
  }
  void mousePressed() {
       background(255, 255, 255);
     }



