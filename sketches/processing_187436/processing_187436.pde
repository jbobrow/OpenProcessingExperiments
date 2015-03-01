
void setup() {
  
  size(500,500);
  background(255);
  
}

void draw() {
 fill(255,random(256),random(256),random(256));
  ellipse(mouseX, mouseY, width % (mouseX +1), height % (mouseY + 1));
  ellipse(width - mouseX, height - mouseY, width % (mouseX +1), height % (mouseY + 1));
}
