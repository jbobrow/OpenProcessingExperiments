
//@pjs preload="elijah.jpeg;"
PImage imge;
void setup() {
  size(800, 800);
  imge = loadImage("elijah.jpeg");
  image(imge, 100, 0);
}
void draw() {
  fill(random(0, 256), random(0, 256), random(0, 256));
  noStroke();
  rect(0, 0, 100, 800);
  rect(700, 0, 100, 800);
  rect(100, 700, 800, 100);
  int eyeLeftX = 320;
  int eyeY = 270;
  int eyeRightX = 505;
  int leftXShift = 0;
  int leftYShift = 0;
  int rightXShift = 0;
  int rightYShift = 0;
  fill(255);
  ellipse(eyeLeftX, eyeY, 35, 35);
  ellipse(eyeRightX, eyeY, 35, 35);
  fill(0, 0, 0);
  if(mouseX < eyeLeftX){
    leftXShift = -5;
  }
  else if(mouseX > eyeLeftX){
    leftXShift = 5;
  }
  if(mouseX < eyeRightX){
    rightXShift = -5;
  }
  else if(mouseX > eyeRightX){
    rightXShift = 5;
  }

  if(mouseY > eyeY){
    leftYShift = 5;
    rightYShift = 5;
  }
  else if(mouseY < eyeY){
    rightYShift = -5;
    leftYShift = -5;
  }
  ellipse(eyeLeftX + leftXShift, eyeY + leftYShift, 30, 30);
  ellipse(eyeRightX + rightXShift, eyeY + rightYShift, 30, 30);

}



