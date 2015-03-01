
//sets up things in sketch that only occur once
void setup() {
  //sets size of sketch
  size(600, 600);
  //closes curly bracket of void setup
}
//sets up things in sketch that continually draw themselves 
void draw() {
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
  //ends curly bracket for void draw
}



