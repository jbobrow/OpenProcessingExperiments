
/*
Horizon Line Drawer
Dan Olson, 2012

*/

float c,c1,c2;
void setup() {
  size(400,200);
  
}
void draw() {
  if (mousePressed == true) {
    c=random(200,255);
  c1=random(100,150);
  c2=random(91,178);
    fill(c,c1,c2);
    stroke(c2,c1,c);
  rect(0, mouseY, width, mouseX);
  //rect(mouseY, 0, mouseX, 1440);
  strokeWeight(1);  
}
}
