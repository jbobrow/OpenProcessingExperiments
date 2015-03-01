
PImage img;
//sets constants 
int smallPoint, largePoint;
//sets constants 

void setup() {
  //// runs the code only once
  size(500, 400);
  //sets the size of the sketch to 500 px in width and 400 px in height
  img = loadImage("Beautiful-Flower-Wallpapers-2.jpg");
  //linked image from other folder 
  smallPoint = 4;
  //set size of the smallest dots
  largePoint = 40;
  //set size of the largest dots
  imageMode(CENTER);
  //centered the image on screen
  noStroke();
  //sets it so that there is no stoke on anything
  background(255);
  //sets background color to white
}

void draw() { 
    // runs the code as a loop at the default frame rate
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  //set the points to change size depending on the x axis of the mouse, left - small, right - large
  int x = int(random(img.width));
  //width form linked image
  int y = int(random(img.height));
  //height from linked image
  color pix = img.get(x, y);
  //take the colors from the linked image
  fill(pix,150);
  //opacity of the fill of the pixels
  ellipse(x, y, pointillize, pointillize);
  //set circle size to change with the x axis of the mouse
}


