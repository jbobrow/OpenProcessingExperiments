
void setup (){
  size (380, 380);
}

void draw () {
  
  if (key == 'q' || key =='q'){
  group () ;}
  if (key == 'w' || key == 'w'){
  group2 () ;}
  if (key == 'e' || key == 'e'){
    group3 ();}
 
} 

  
void group () {
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

void group2 () {
  
// This sketch follows Gestalt's principle of Repetition.
// sets the size of the display to 200x200 pixels.
size (380, 380);
// sets the background color. 
background(75, 246, 200);
// creates a fill for the triangle.
fill (183, 75, 246);
//creates a triangle shape.
triangle(150, 170, 178, 120, 206, 170);
//creates a fill for the triangle.
  fill (246, 75, 218);
//creates a triangle shape.
triangle (150, 195, 178, 140, 206, 195);
// creates a fill for the triangle.
  fill (246, 178, 75);
  //creates a triangle shape.
triangle (150, 220, 178, 160, 206, 220);
// creates a fill for the triangle.
  fill (229, 246, 75);
  //creates a triangle shape.
triangle (150, 245, 178, 180, 206, 245);
}

void group3() {
//This sketch follows Gestalt's Principle of Figure/Ground.

// sets the display size to 200 px
size (380,380);
//sets the background color.




background(192, 64, 0);
// sets the stroke color.
     stroke(255);
     // creates a rectangular shape.
rect(25, 22, 330, 330);
//sets the color of stroke of the rectangle.
     stroke (0);
     // sets the color of the fill of the rectangle.
     fill (0);
     // creates an ellipse shape.
ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10);
// sets the color of the stroke of the ellipse. 
    fill (53);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}
 


