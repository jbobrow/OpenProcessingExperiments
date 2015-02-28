
// variables
// int
// posX=(int) random(width);
void setup(){
  size(400,400);
    background(0);
  smooth();
}
void draw(){
if (mousePressed == true) {
    fill(255);
  } else {
    fill(5);
     noStroke();
fill(random (2, 255),random (2, 255),random (2, 255));
ellipse(random (0, 400),random (0, 400),7,7);
fill(0,random (0,345),5);
ellipse(mouseX,mouseY,7,7);
  }
}
