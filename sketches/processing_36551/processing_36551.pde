
void setup() {
  size(600, 600);
  background(0);
}

void draw() {

  stroke(255);
  line(mouseX, mouseY, 300, 300);

  stroke(0, 0, 255);
  fill(255, 0, 0);
  rect(50, 50, 100, 100);

  fill(0, 20, 200, 150);
  ellipse(100, 50, 150, 150);
  triangle(100, 20, 0, 100, 15, 200);
}

                
                
