
//Warped Ellipses, Random Colors
//By AKAdelta

void setup() {
  size(1000,500);
  //random background color on load
  background( random(255), random(255), random(255), random(255));
}
void draw() {
{
  if (mousePressed == true) {
    noCursor();
  } else {
    cursor(HAND);
  }
}
  //I need to figure out how to get the ellipses to appear without
  //this function, but that has not yet been covered in my book.
  //If the mouse is not pressed, then draw. If it is, then don't.
  if (mousePressed) {
    noStroke();
    noFill();
    noCursor();
  } else {
    //Hide new ellipses if the mouse is pressed.
    noStroke();
    fill(random(255), random(255), random(255), random(255));
  }
  //Antialias by 8x.
  smooth(8);
  strokeWeight(.5);
  //Follow the mouse, and warp the ellipses to grow in proportion
  //to how far they are from the upper-left corner.
  ellipse(mouseX,mouseY, mouseX, mouseY);
}

