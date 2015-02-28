
void setup() {
  size(400, 400);
   background(100);
}

void draw() {
  background(random(255));
  stroke(255);
  line(mouseX, mouseY, 200, 10);

  stroke(0, 0, 255);
  fill(0);
  rect(10, 25, 50, 45);

  fill(0, 0, 100, 50);
  ellipse(10, 25, 50, 45);

  triangle(0, 40, 50, 60, 100, 254);
}
           
                
