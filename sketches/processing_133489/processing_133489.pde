
void setup() {
  size(500, 500);
  background(0)
}

void draw() {
  if (mousePressed) {
    fill(random(980), mouseY, mouseX, 9);
    stroke(0);
  } else {
    fill(mouseX,mouseY,random(255),random(50));
    stroke(mouseX, random(mouseY), random(980), random(25));
    strokeWeight(1);
      }
  ellipse(mouseX, mouseY, 80, 80);
  
}
