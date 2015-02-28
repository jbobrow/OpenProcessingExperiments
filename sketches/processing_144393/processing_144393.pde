
float angle = 0.0;

void setup() {
  background(#FFFFFF);
  size(600, 600);
  smooth();
}

void draw() {
  for (int i = 0; i < 600; i++) {
  float r = random(50);
  stroke(r*10);
  line(50, i, 50+r, i);
}
  translate(mouseY, mouseX);
  rotate(angle);
  line(-15, -30, 400, 400);
  fill(#FFFFFF);  
  translate(mouseY, mouseX);
  line(-15, 10, 400, 400);
  fill(#FFFFFF);  
  line(-15, -30, 200, 400);
  fill(#FFFFFF);  
  translate(mouseX, mouseY);
  line(-15, 10, 100, 400);
  fill(#FFFFFF);  
  translate(mouseY, mouseX);
  rotate(angle);

  angle += 0.1;
}



