
float angle = 0.0;

void setup() {
  size(400, 400);
  smooth();
  background(255)
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  rect(-40, -40, 50, 50);
  fill(#7018ED);
  angle += 0.1;    
  if (mousePressed){
  angle += -0.2;
  fill(#4FBC48);
}

}
