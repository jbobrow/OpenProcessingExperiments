
PImage img;
int squares = 10; //determines the size of the rectangles

void setup() {
  size(300, 300);
  img = loadImage("window.jpg");
  background(140, 170, 120);
}

void draw() {
  pushMatrix();
  //moves the origin of the composition over 50 spaces
  translate(50, 50); 

  smooth();

  //determines the placement of the rectangles
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;

  /*determines the color of the square by picking on 
   pixel and selecting that color for the entire rectangle*/
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();

  fill(r, g, b, 100);
  rect(x, y, squares, squares);

  //creates the bounding box aroun the composition
  noFill();
  stroke(80, 50, 30);
  rect(0, 0, 210, 210);

  //resets the origin back to the original 0, 0 point
  popMatrix();
}


