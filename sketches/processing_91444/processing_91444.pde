
// Rhys Martindale

// This sketch is entirely my own creation, and was attempted to prove to myself i could do it
// None of the code is drawn from an outside source (other than the basic processing referece library)
// The inkblot image is a legally downloaded and licenced stock image

// click the mouse to save a .tif file


PImage inkblot; // define image variable

int x = 0;
int y = 0;
int imageCount = 1;

void setup() {
  size(500, 800); // set screen size
  stroke(255); // set stroke to white
  background(45, 0, 20); // set backgroud to dark colour
  inkblot = loadImage("inkblot-test.png"); // load the image into the inkblot variable
  fill(0, 0, 35, 2); // set the fill to transparent dark blue
  strokeWeight(1.5); // set stroke weight to 1.5
  smooth(); // smooth the edges
  frameRate(30); // set the framerate
}

void draw() {
    if (x < width) { // if x is less that the width of the page do this...
    y = 0; // set y to zero
    stroke(map(x, 0, width, 0, 360), 100, 100); // change the stroke colour by remaping x to a value between 0 and 360 - move through the spectrum

    // draw lines from one edge of the screen to the corresponding spot on the perpendicular edge
    // use a map function to spread the lines evenly regardless of screen dimensions
    line(0, map(x, 0, width-1, 0, height-1), 0+x, height-1);  //counter clockwise bottom left
    line(width-1-x, height-1, 0, map(width-1-x, 0, width-1, 0, height-1));  //clockwise bottom left
    line(width-1-x, 0, 0, map(x, 0, width-1, 0, height-1));  //counter clockwise top left
    line(0, map(width-x-1, 0, width-1, 0, height-1), x, 0);  //clockwise top left
    line(width-1, map(width-1-x, 0, width-1, 0, height-1), width-1-x, 0);  //counter clockwise top right
    line(x, 0, width-1, map(x, 0, width-1, 0, height-1));  //clockwise top right
    line(0+x, height-1, width-1, map(width-1-x, 0, width-1, 0, height-1));  //counter clockwise bottom right
    line(width-1, map(x, 0, width-1, 0, height-1), width-x-1, height-1);  //clockwise bottom right
    filter(BLUR, 3); // blur the screen
    x+=width/25; // divide the width of the screen by 25 and add the figure to x
    noStroke(); // turn off the stroke
    colorMode(HSB, 360, 100, 100); // change the colour mode to HSB
    image (inkblot, width/2-250, height/2-250); // draw the inkblot image in the centre of the screen
    fill(map(x, 0, width, 0, 360), 100, 35, 25); // change the fill colour by remaping x to a value between 0 and 360 - move through the spectrum
    rect(0, 0, width, height); // cover the screen in a semi transparent rectangle
  } 
  else { // when x is greater than width, then repeat the above process substituing y
    if (y < width) {
      stroke(map(y, 0, width, 0, 360), 100, 100);
      line(0, map(y, 0, width-1, 0, height-1), 0+y, height-1);  //counter clockwise bottom left
      line(width-1-y, height-1, 0, map(width-1-y, 0, width-1, 0, height-1));  //clockwise bottom left
      line(width-1-y, 0, 0, map(y, 0, width-1, 0, height-1));  //counter clockwise top left
      line(0, map(width-y-1, 0, width-1, 0, height-1), y, 0);  //clockwise top left
      line(width-1, map(width-1-y, 0, width-1, 0, height-1), width-1-y, 0);  //counter clockwise top right
      line(y, 0, width-1, map(y, 0, width-1, 0, height-1));  //clockwise top right
      line(0+y, height-1, width-1, map(width-1-y, 0, width-1, 0, height-1));  //counter clockwise bottom right
      line(width-1, map(y, 0, width-1, 0, height-1), width-y-1, height-1);  //clockwise bottom right
      filter(BLUR, 3);
      y+=width/25;
      noStroke();

      colorMode(HSB, 360, 100, 100);
      image (inkblot, width/2-250, height/2-250);
      fill(map(y, 0, width, 0, 360), 100, 35, 25);
      rect(0, 0, width, height);
    } 
    else { // when y is greater than width, reset x to zero and start over from the top
      x = 0;
    }
  }
}

void mouseClicked(){
    save("line_horizons"+imageCount+".tif");
    imageCount += 1;
}


