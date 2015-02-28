
// Very Customizable Mosaik _by Peter Hofmann
// feel free to use this if desired

// Need to solve issue with border not applied left and top -> any ideas?


// import processing.pdf.*; <- save as PDF

void setup() {
  size(400, 400);
//  size(400, 400, PDF, "mosaik.pdf");
  noStroke();
  background(0);
  colorMode(HSB, 255);
  frameRate(6);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  mosaik(7, 7, 10, color(255, 60), color(random(0, 255), 255, 255), true, false);
//  exit();
}

// Very Customizable Mosaik function
void mosaik(float col, float row, float borderSize, 
color baseColor, color randomColor, boolean setRandomColor, boolean transparent) {

  float x = 0;

  while (x < width) { // create rows
    float y = 0;
    while (y < height) { // create columns
      if (setRandomColor == true) { // if you want rects to change colors randomly
        if (random(100) > 50) { // change the number to possibility value
          fill(randomColor); // your random color is applied
        }
        else {
          if (transparent == true) { // if transparent is true, other pieces are transparent
            fill(0, 0);
          }
          else { // or else they get the base color
            fill(baseColor);
          }
        }
      }
      else if (transparent == true) { // if no random colors, either transparent or base color
        fill(0, 0);
      }
      else {
        fill(baseColor);
      }
      rect(x, y, width/col-borderSize, height/row-borderSize); // draws the rectangle
      y = y + height/row; // add rows divided by the number of rectangles
    }
    x = x + width/col; // add columns divided by the number of rectangles
  }
  
}

// have fun!
