
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  if (mousePressed) {
 
  }
  fill(245, 220, 30);
  ellipse (mouseX, mouseY, 80, 80);
  fill(0, 0, 250);
  noStroke() ;
  ellipse(mouseX, mouseY-40, 70, 30);
  ellipse(mouseX, mouseY-60, 60, 30);
  ellipse(mouseX, mouseY-80, 50, 30);
  ellipse(mouseX, mouseY-100, 45, 30);
  stroke(10, 10, 10);
fill (255, 255, 255);
  ellipse (mouseX-14, mouseY-5, 20, 20);
  ellipse (mouseX+14, mouseY-5, 20, 20);
  line(mouseX-20, mouseY-13, mouseX-25, mouseY-20);
  line(mouseX-13, mouseY-15, mouseX-13, mouseY-23);
  line(mouseX-7, mouseY-13, mouseX-5, mouseY-20);
  line(mouseX+20, mouseY-13, mouseX+25, mouseY-20);
  line(mouseX+13, mouseY-15, mouseX+13, mouseY-23);
  line(mouseX+7, mouseY-13, mouseX+5, mouseY-20);
   fill(10, 10, 10);
  ellipse (mouseX-14, mouseY-5, 5, 5);
  ellipse (mouseX+14, mouseY-5, 5, 5);
    fill(255, 255, 255);
  ellipse (mouseX, mouseY+5, 5, 5);
  fill(247, 20, 20);
  ellipse (mouseX, mouseY+20, 30, 5);
  fill (250, 250, 250);
  
 
}

