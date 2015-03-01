
// This sketch depicts Gestalt's Principle of Symmetry.
// runs code one time, and one time only.
void setup (){
  //sets frame rate to 24.
  frameRate (24);
// sets the display size to 200x200 pixels.
size (380,380);

}
// loops code continuously.
void draw (){
// sets the background color.
background( 255, 200, 200);
// creates an ellipse shape.
fill (random (255));
ellipse(190, 190, 300, 300);
// creates a fill for the ellipse.
fill (255, 200, 200);
//creates an ellipse shape.
ellipse (190, 190, 240, 240);
//creates a fill for the ellipse.
fill (random (255));
// creates an ellipse shape.
ellipse (190, 190, 180, 180);
// creates a fill for the ellipse.
fill (255, 200, 200);
// creates am ellipse shape.
ellipse (190, 190, 120, 120);
// creates a fill for the ellipse.
fill (random (255));
// creates an ellipse shape.
ellipse (190, 190, 60, 60);

}



