
/*This is the code for a basic Drawing program and covers basic GUI design as well*/
color buttonCol1 = #007DFF;
color buttonCol2 = #FF00B3;
color buttonCol3 = #EDFF00;
color buttonCol4 = #000000;
color buttonCol5 = #FFFFFF;
color penColor = #000000;
float oldX, oldY;
int thick = 1;

void setup() {
  size(450, 450);
  smooth(); 
  background(255);
}

void draw() {
  //first we will draw all of the buttons, 3 rectangles and two circles for black and white
  noStroke(); //get rid of the outlines
  fill(buttonCol1);
  rect(420, 20, 20, 20); //button 1
  fill(buttonCol2);
  rect(420, 40, 20, 20); //button 2
  fill(buttonCol3);
  rect(420, 60, 20, 20); //button 3
  ellipseMode(CORNER);
  fill(buttonCol4);
  ellipse(420, 80, 20, 20); //black button
  stroke(0);  //we are making a white button on a white backdrop so we need to trun the stroke back on
  strokeWeight(1);  //we make sure the stroke weight is set to the right setting, even if the pen line is thick
  fill(buttonCol5);
  ellipse(420, 100, 20, 20); //white button

  //now we begin to see if the mouse is pressed and where it is.
  if(mousePressed) {
    if(mouseX > 420 && mouseX < 440) { //this will work for all three rect buttons so we save typing by just doing the check once
      if(mouseY > 20 && mouseY < 40) { //check to see if we are over button 1
        penColor = buttonCol1;
        thick = 1;
      } 
      else if(mouseY > 40 && mouseY < 60) {  //check to see if we are over button 2
        penColor = buttonCol2;
        thick = 1;
      } 
      else if(mouseY > 60 && mouseY < 80) {  //check to see if we are over button 3
        penColor = buttonCol3;
        thick = 1;
      }
    } 
    if(dist(mouseX, mouseY, 430, 90) <= 10) {  //this is how we check if we are over a round button
      penColor = buttonCol4;
      thick = 5;
    } 
    if(dist(mouseX, mouseY, 430, 110) <= 10) { //with a round button you see if the mouse is a certain distance from the center of the ellipse
      penColor = buttonCol5;
      thick = 5;
    }

    stroke(penColor);
    strokeWeight(thick);
    line(oldX, oldY, mouseX, mouseY); //the heart of the drawing program, makes a line from the last mouse position to the new position
  }
  oldX = mouseX;  //save the last mouse position for the next frame of animation
  oldY = mouseY;
}


