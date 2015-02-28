



PImage img;  // Declare variable "a" of type PImage
int numpix;

float[][] kernel = { 
  {
    -1, 0, 1
  }
  , 
  {
    -2, 0, 2
  }
  , 
  {
    -1, 0, 1
  }
};

void setup() {
  size(615, 386, P2D);
  smooth();
  numpix = width*(height+100);
  img = loadImage("dancers.jpg"); // Load the original image
  img.loadPixels();
  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);
  // Loop through every pixel in the image.
  for (int y = 1; y < img.height - 1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width - 1; x++) { // Skip left and right edges
      float sumr = 0; // Kernel sum for this pixel
      float sumg = 0;
      float sumb = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky) * width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float valr = red(img.pixels[pos]);
          float valg = green(img.pixels[pos]);
          float valb = blue(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sumr += kernel[ky+1][kx+1] * valr;
          sumg += kernel[ky+1][kx+1] * valg;
          sumb += kernel[ky+1][kx+1] * valb;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sumr, sumg, sumb);
    }
  }
  // State that there are changes to edgeImg.pixels[]
  edgeImg.updatePixels();
  image(edgeImg, 0, 0); // Draw the new image
}


