
///there are things that happen once
void setup(){
  ///sets of the size of the canvas
  size(800, 700);
}
///these things continue to happen
void draw() {
  ///this has the amount of red in the background change with the y loction of mouse
  background(mouseY, 82, 155);
  ///a stroke of white
  stroke(255);
  ///a fill of white
  fill(255);
  ///this has the y location of the ellipse move along with the mouse, also creates an ellipse
  ellipse(400, mouseY, 150, 150);
  ///no stroke (probbaly don't need this)
  stroke(0);
  ///create a fill color the rectangle below
  fill( 50, 70, 99);
  ///creates a rectangle
  rect(0, 400, 800, 300);
  ///creates a white stroke
  stroke(255);
  ///creates a white fill for ellipse
  fill(255);
  ///creates an ellipse that y location changes with x location of mouse
  ellipse(400, mouseX, 200, 120);
  ///encases what i've written in void draw
}


