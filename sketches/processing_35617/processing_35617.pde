
//this is a crosshair that changes color and style when clicked and dragged//



void setup() {
  size(300, 300);
}
void draw() {
  background(91, 237, 175);

  fill(255, 170, 33, 200);
  rect(0, 0, mouseX-15, mouseY-15);
  rect(mouseX+15, 0, width, mouseY-15);
  //two rectangles on the top//

  fill(91, 237, 175);
  noStroke();
  ellipse(mouseX, mouseY, mouseY, mouseY);
  //this ellipse is the same color as the background, it covers the corners of the rectangles//

  fill(64, 150, 252);
  stroke(1);
  ellipse(mouseX, mouseY, 30, 30);
  line(mouseX+15, mouseY, width, mouseY);
  line(mouseX-15, mouseY, 0, mouseY);
  line(mouseX, mouseY+15, mouseX, height);
  line(mouseX, mouseY-15, mouseX, 0);
  //directional crosshair lines and center circle//

  fill(227, 53, 117, 150);
  ellipse(0, height, mouseX, height-mouseY);
  ellipse(width, height, width-mouseX, height-mouseY);
  //these two ellipses sit in the bottom corners and grow when the center circle increases in height, when approached they will never touch it//
}

void mouseDragged() {
  noFill();
  //this second crosshair set adds two more corner cut rectangles and removes the center circle//
  fill(255, 170, 33, 200);
  rect(0, mouseY+15, mouseX-15, height);
  rect(mouseX+15, mouseY+15, width, height);
  //rectangles//

  fill(91, 237, 175);
  noStroke();
  ellipse(mouseX, mouseY, mouseY, mouseY);
  //secondary cover circle//
}


