
void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  //hoofd
  fill(255, 200, 255);
  ellipse(mouseX, mouseY, 100, 100);
//linker iris
  fill(255, 255, 255);
  ellipse(mouseX-20, mouseY-20, 30, 30);
  //rechter iris
  fill(255, 255, 255);
  ellipse(mouseX+15,mouseY-20, 30, 30);
  //linker pupil
  fill (0);
  ellipse (mouseX+12, mouseY-20,10,10);
  //rechter pupil
  fill (0);
  ellipse (mouseX-20, mouseY-20,10,10);
  fill(255, 200, 255);
  ellipse(mouseX +20, mouseY+60, 35, 40);
  fill(255, 200, 255);
  ellipse(mouseX-15, mouseY+60, 35, 40);
  fill(0);
  ellipse(mouseX, mouseY+25, 40, 10);

} 

