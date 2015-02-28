
void setup() {
  size(900, 900);
  background(#FFFFFF);
  smooth();
}
void draw() {
 noFill();
   stroke(#000000);
  line(mouseX, mouseY, mouseX+31, mouseY+11);
  line(mouseX, mouseY, mouseX+12, mouseY+32);
  line(mouseX+50, mouseY, mouseX+31, mouseY+11);
  line(mouseX, mouseY+50, mouseX+12, mouseY+32);
  //background(#FFFFFF);
  float r = random(40,300);
  stroke(#ffffff);
  ellipse(mouseX,mouseY,r,r);

}



