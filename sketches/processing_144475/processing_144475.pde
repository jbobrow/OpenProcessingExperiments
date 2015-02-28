
void setup() {
size(800, 600);
strokeWeight (3);
}

void draw() {
  background(0, 26, 51);
  stroke(20);
  int d = 50;
  fill(50);
  ellipse(200, 150, mouseX, mouseY);//left
  float mx = map(mouseX, 200, width, 200, 100);
  fill(90);
  ellipse(400, 300, mouseX, mouseY); 
  float mx = map(mouseX, 400, width, 500, 200);
  fill(150);
  ellipse(600, 450, mx, mouseX, mouseY); 
}




