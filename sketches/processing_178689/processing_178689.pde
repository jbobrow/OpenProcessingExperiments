
void setup() {
  size(1000, 1000);
}
  
void draw() {
  if (mousePressed) {
    fill(mouseX-mouseY/6,mouseX+7-mouseY,random(255));
  } else {
    fill(mouseX,mouseY,random(255));
  }
  ellipse(mouseX, mouseY, 20,20,20);
  ellipse(mouseY,mouseX,20,20,20);
  ellipse(mouseX, mouseX-mouseY, 20,20,20);
  ellipse(mouseX-mouseY,mouseX,20,20,20);
}
