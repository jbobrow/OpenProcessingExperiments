
//Declare Variables
PImage noise; //Image containing my repeating pattern.
PImage depth; //A depth map for the 3D object, rendered with blender.
float shiftrange = 0.3; // Proportion of the pattern width to use for shifting to create depth.

// array for depth-map images
PImage[] depth_map = new PImage[10];

// size of repeated panel
int panelSz = 125;

// window size variables
int wind_width = 900;
int wind_height = 450;

// array to store colors
color[] pixCopy = new color[wind_width*wind_height];

void setup() {
  size(900, 450);
  
  // assign images to array
     for(int i = 0; i < 10; i++){
   depth_map[i] = loadImage("depth_shape_00"+i+".png");
   }
   
   // use panel size to assign colors
  for (int i = 0; i < panelSz; i++) {
    for (int j = 0; j < wind_height; j++) {

      // gets location in pixels[]
      int loc = (int)(i+(j*width));
      
      // get random color
      color c = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));

      // assign color to pixCopy array item
      pixCopy[loc] = c;
    }
  }
  
  // draw initial panel
  drawBGSh("rect", 2);
  
  // copy initial panel across window
  for (int step = 0; step < width; step+=panelSz) {
    copySquare(0, 0, panelSz, height, step, 0);
  }
}



void draw() {

}

void keyPressed(){

    // check key is a number between 0-9
    if (key >=48 && key <= 57) {
    
      // load image file using key input
      depthMap(key-48);
    }
}

// displaces pixels using values from a depth map image
// adapted from: http://bensimonds.com/tag/random-dot-stereogram
void depthMap(int num) {

  // use num to choose image in array
    depth = depth_map[num];
    
  //Work through the image row by row, column by column.
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      int loc = x + (y*width); // Gives the pixels index based on it's x and y coordinates.
      float zdepth = (green(depth.pixels[loc])) / 255.00; // Gives the zdepth of the pixel as a value between 0.0 and 1.0
      int shift = int(128 - (zdepth*(128 * shiftrange))); // Calculates the amount of shift for the pixel.
      
      // If in first col, ignore shift (nothing to repeat yet):
      int locshifted = loc;
      if (x > 128) {
        locshifted = (x-shift) + (y * width); // Gives the index of the pixel to repeat.
      }
      
      // Now set the new pixel colour to that of the pixel to repeat.
      pixels[loc] = pixels[locshifted];
    }
  }
  
  updatePixels(); //Update the final image.
}

// draws shapes of random color within a specified area of the window
void drawBGSh(String sh, int rectSz) {

  // set colors for panel to be copied (from array in setup)
  for (int i = 0; i < panelSz; i+=rectSz) {
    for (int j = 0; j < height; j+=rectSz) {

      int loc = (int)(i+(j*width));

      if (sh == "rect") {
        
        noStroke();   
        fill(pixCopy[loc]);
        rect(i, j, rectSz, rectSz);
        
      } else if (sh == "point") {
 
        stroke(pixCopy[loc]);
        strokeWeight(rectSz);
        point(i, j);
      }
    }
  }
}

// copies an area of the window and redraws in given location
void copySquare(float x, float y, int wd, int ht, float fX, float fY) {

  PImage img = createImage(width, height, RGB);
  
loadPixels();
  // use for loops to get pixel location
  for (int i = 0; i < wd; i++) {
    for (int j = 0; j < ht; j++) {
      int loc = (int)((x+i)+((y+j)*width));
      img.pixels[loc] = pixels[loc];
    }
  }
updatePixels();

  image(img, fX, fY);
}



