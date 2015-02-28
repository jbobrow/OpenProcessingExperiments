
int mida = 35;

void setup() {
  size(600, 400);
}
void draw() {
  background(242, mouseX, mouseY);
  strokeWeight(3);
  stroke(95,mouseX,mouseY);
  ellipse(mida+mouseX,mida+mouseY,mouseX,mouseY);
  
  fill(159, mouseX, mouseY);
  stroke(89, mouseX, mouseY);

  line(15+mouseX, 23+mouseY, mouseX, mouseY);
  strokeWeight(2);
}




