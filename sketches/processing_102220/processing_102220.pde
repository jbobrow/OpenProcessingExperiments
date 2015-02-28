
void setup() {
  size(400, 400);
}
//noStroke();
//fill(255, 40);
//background(0);


void draw() {
  if(mousePressed == true) {
    fill(0, 26);
  } else {
    fill(255, 26);
  }
  for (int i = -14; i <=14; i += 2) {
    point(mouseX + i, mouseY);
  }
}
