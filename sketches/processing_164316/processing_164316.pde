
//sets up things in sketch that only occur once
void setup() {
  //sets size of sketch
  size(720, 600);
}
//sets up things in sketch that will occur more than once
void draw() {
  //sets up an if statement to make something happen if key q is pressed
  if (key == 'q' || key == 'Q') {
    //tells the program what to do if the if statement is true- run the function named closure
    closure();
    //curly bracket to end if statement
  }
  //sets up an if statement to make something happen if key w is pressed
  if (key == 'w' || key == 'W') {
    //tells the program what to do if the if statement is true- run the function named proximity
    proximity();
    //curly bracket to end if statement
  }
  //sets up an if statement to make something happen if key e is pressed
  if (key == 'e' || key == 'E') {
    //tells the program what to do if the if statement is true- run the function named commonfate
    commonfate();
    //curly bracket to end if statement
  }
  //sets up an if statement to make something happen if key r is pressed
  if (key == 'r' || key == 'R') {
    //tells the program what to do if the if statement is true- run the function named conitnuity
    continuity();
    //curly bracket to end if statement
  }
//curly brackeet that ends draw function 
}





//sets up a custom function named closure
void closure() {
  //sets background color in RGB
  background(25, 178, 146);
  //sets the stroke to none
  noStroke();
  //sets the fill in RGB
  fill(118, 90, 55);

  //draws a rectangle based on upper left corner x, upper left corner y, width, height
  rect(10, 10, 80, 80);
  //draws a rectangle based on upper left corner x, upper left corner y, width, height
  rect(100, 10, 80, 80);
  //draws a rectangle based on upper left corner x, upper left corner y, width, height
  rect(10, 110, 80, 80);
  //draws a rectangle based on upper left corner x, upper left corner y, width, height
  rect(100, 110, 80, 80);

  //sets a new fill color in RGB
  fill(25, 178, 146);

  //draws an ellipse based on center x, center y, width, height
  ellipse(95, 100, 100, 100);
  //curly bracket ends custom function 
}

//sets up a custom function named common fate
void commonfate () {
  //sets background color in RGB
  background(25, 178, 146);
  //sets a fill color in RGB
  fill(118, 90, 55);
  //sets the stroke to none
  noStroke();
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(mouseX, mouseY, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(mouseX +100, mouseY, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(250, 50, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(350, 50, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(250, 150, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(350, 150, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(250, 250, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(350, 250, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(250, 450, 50, 50);
  //creates an ellipse based on center x coordinate, center y coordinate, width, height 
  ellipse(350, 450, 50, 50);
  //curly bracket ends custom function 
}

//sets up a custom function named continuity
void continuity() {
  background(25, 178, 146);
  //sets a stroke color in RGB
  stroke(118, 90, 55);
  //sets a stroke weight
  strokeWeight(10);
  //makes a line from the first set of coordinates to the second
  line(0, 0, 200, 200);
  //makes a line from the first set of coordinates to the second
  line(0, 200, 200, 0);

  //sets a fill color in RGB
  fill(0, 250, 189);
  //sets the stroke to none
  noStroke();
  //makes an ellipse using center point x, center point y, width, height
  ellipse(100, 100, 150, 100);
  //curly bracket ends custom function 
}

//sets up a custom function named proximity
void proximity() {
  //sets background color in RGB
  background(25, 178, 146);
  //sets fill color in RGB
  fill(118, 90, 55);
  //sets stroke to none
  noStroke();
  //makes a for loop starting with i = 30, when i is less than or equal to 210, updating i to add 60 each loop
  for (int i = 30; i <= 210; i = i+60) {
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(30, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(90, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(150, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(210, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(270, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(330, i, 50, 50);
    //ends curly bracket for the for loop
  }
  //makes a for loop starting with i = 330, when i is less than or equal to 210 and less than 540, updating i to add 60 each loop
  for (int i = 330; i >210 & i<540; i = i+60) {
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(390, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(450, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(510, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(570, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(630, i, 50, 50);
    //draws an ellipse at center x, center y, width, height, first in coloumn of loops
    ellipse(690, i, 50, 50);
    //ends curly bracket for the for loop
  }
  //curly bracket ends custom function 
}



