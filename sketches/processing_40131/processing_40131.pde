
// Description: uses get() to pick colors from an image randomly and then fill ellipses

PImage picture;

void setup() {
  size(300, 300);
  picture = loadImage("flowers.jpg");
  background(0);
  frameRate(5);                                  //slows the frame rate
  smooth();
  ellipseMode(CENTER);
}

int cellSize = 30;

void draw() {
  if (mousePressed) {                             //allows the user to decide when the drawing is complete
    for (int y=0; y <= width; y+=cellSize) {
      for (int x=0; x <= height; x+=cellSize) {

        int a = int(random(0, picture.width));    // take a random x coordinate from the image
        int b = int(random(0, picture.height));   // take a random y coordinate from the image

        color myColor = picture.get(a, b);        // grab the color from picture at (a,b)
        fill(myColor, 30);                         // set fill to use this new color
        ellipse(x, y, cellSize++, cellSize++);    // enlarges ellipses creating overlap of color
      }
    }
  }
}


