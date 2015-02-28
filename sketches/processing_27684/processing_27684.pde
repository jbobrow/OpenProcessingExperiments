
void setup() {
  size(255,255); /*This particular canvas size was chosen because color(255); is white*/
  background(0);
  println("Click and hold for invisible mouse.");
}

void draw() {
  /*First off I made it so that the mouse disappears when it is clicked and held*/
  if(mousePressed == true) {
    noCursor();
  }
  else {
    cursor(ARROW); //learned this cursor code from the processing website
  }

  /*smoothed everything and told the program that any future shapes will get darker depending on how far right the mouse is*/
  smooth();
  fill(mouseX);

  /*If the mouse is left of the center, the ellipse will have a white outline*/
  if (mouseX<128) {
    stroke(255); //white outline
  }
  else {
    stroke(0); //black outline
  }



  /*The last thing to draw here is the ellipse itself. The ellipse is centered, but height and width are determined by where the mouse is.*/
  ellipse(width/2,height/2,mouseX,mouseY);
}
                                
