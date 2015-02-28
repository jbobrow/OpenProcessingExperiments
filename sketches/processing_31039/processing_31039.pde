
PImage brotherhood;
PImage cursorimage;

void setup() 
{
  size(620, 350);
  smooth();
  noStroke();

  // The background image must be the same size as the parameters
  // into the size() method.
  brotherhood = loadImage("brotherhood.jpg");
  cursorimage = loadImage("symbol-inkscape.png");
}

void draw() 
{
  background(brotherhood);
  image(cursorimage,mouseX,mouseY,63,59);
  
  
}


