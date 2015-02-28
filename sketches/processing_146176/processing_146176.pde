
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage a;  // Declare variable "a" of type PImage
int numpix;

// odd side square matrices
// the sum of the values ​​= 1

/*float[][] kernel = { {.11, .11, .11},
 {.11, .11, .11},
 {.11, .11, .11} };*/

/*float[][] kernel = { {.0625, .0625, .0625, .0625, .0625},
 {.0625, .0625, .0625, .0625, .0625},
 {.0625, .0625, .0625, .0625, .0625},
 {.0625, .0625, .0625, .0625, .0625},
 {.0625, .0625, .0625, .0625, .0625},};*/


float[][] kernel = { 
  {
    .01, .02, .04, .02, .01
  }
  , 
  {
    .02, .04, .1, .04, .02
  }
  , 
  {
    .04, .1, .10, .1, .04
  }
  , 
  {
    .02, .04, .1, .04, .02
  }
  , 
  {
    .01, .02, .04, .02, .01
  }
  ,
};                   


void setup() {
  size(615, 386, P2D);
  smooth();

  // default colorMode(RGB);
  // try colorMode(HSB, 360, 100, 100);
  numpix = width*(height);

  a = loadImage("dancers.jpg");
  a.loadPixels(); 

  // edges

    for (int i = 0; i< numpix-(width+1); i++) {
    // compare with the neighbors pixels
    float dbh = abs ( -brightness(a.pixels[i]) + brightness(a.pixels[i+1]));
    float dbv = abs ( -brightness(a.pixels[i]) + brightness(a.pixels[i+width]));
    //create the lines
    float col = 3*sqrt(sq(dbh) + sq(dbv));
    col= map(30+col, 0, 255, 0, 360);


    // try color / grayscale
    // a.pixels[i] = color(col, 100, 100);
    // a.pixels[i] = color(col);

    // threshold
    if (col < 255) {
      a.pixels[i] = color(0);
    }
    else {
      a.pixels[i] = color(255);
    }
  }
  a.updatePixels(); 


  // kernel blur
  // try with / without blur

  for (int y = 2; y < a.height - 2; y++) { // Skip top and bottom edges
    for (int x = 2; x < a.width - 2; x++) { // Skip left and right edges
      float sumr = 0; // Kernel sum for this pixel
      float sumg = 0;
      float sumb = 0;
      for (int ky = -2; ky <= 2; ky++) {
        for (int kx = -2; kx <= 2; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky) * width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float valr = red(a.pixels[pos]);
          float valg = green(a.pixels[pos]);
          float valb = blue(a.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sumr += kernel[ky+2][kx+2] * valr;
          sumg += kernel[ky+2][kx+2] * valg;
          sumb += kernel[ky+2][kx+2] * valb;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      a.pixels[y*a.width + x] = color(sumr, sumg, sumb);
    }
  }
  a.updatePixels();

  image(a, 0, 0);
}


