
PImage corb; //sets up the connection to Corbusier's "red violin"

void setup() {
  size(616, 380); //the canvas is the height of the image, but twice the width 
  corb = loadImage("redviolin.jpg");
}
 
  void draw() {
  loadPixels(); 
  set(0, 0, corb); //places "redviolin" in the canvas
 
  //sets up the pixel selector 
  int x = mouseX;
  int y = mouseY;
  color original = pixels[(y * width) + x];//selects the color

  fill(original); // fills the rectangle at the top left with the color that the mouse is hovering over
  noStroke();
  rect(308, 0, 308,95 );//this rectangle is larger than the ones below it because it is the original color
  
  //fills the rectangle with the original color + 25
  //this continues to add 25 with each rectangle 
  fill(original + 25);
  rect(308, 95, 308, 47.5);
  
  fill(original + 50);
  rect(308, 142.5, 308, 47.5);
  
  fill(original + 75);
  rect(308, 190, 308, 47.5);
  
  fill(original + 100);
  rect(308, 237.5, 308, 47.5);
  
  fill(original + 125);
  rect(308, 285, 308, 47.5);
  
  fill(original + 150);
  rect(308, 332.5, 308, 47.5);
  
  
}


