
void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
noStroke();
  fill(0,0,100,10);
  quad(0, mouseY-150, mouseX+75, 400 , mouseX, 0, 50, mouseY);
}





