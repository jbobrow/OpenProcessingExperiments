


// Laplacian Edge Detection
float[][] edgemat = { {  0.,  1.,  0. },
                      {  1., -6.,  1. },
                      {  0.,  1.,  0. }};


// Apply a convolution matrix to an image
PImage convolution( PImage img, float[][] mat )
{
  // image size
  int irs = img.height;
  int ics = img.width;
  
  // matrix size
  int mrs = mat.length;
  int mcs = mat[0].length;
  
  // Create a new image into which filtered pixels are stored
  PImage img2 = createImage(img.width, img.height, ARGB);
  
  // Load all pixels for both images
  img.loadPixels();
  img2.loadPixels();
  
  // Loop over all image pixels
  for (int ir=0; ir < irs; ir++) {
    for (int ic=0; ic < ics; ic++) {
      
      float rsum = 0.0;
      float gsum = 0.0;
      float bsum = 0.0;
      
      // Loop over all matrix locations
      for (int mr=0; mr < mrs; mr++) {
        for (int mc=0; mc < mcs; mc++) {
          
          // Compute pixel to access
          int tr = ir - mr - 1;
          int tc = ic - mc - 1;
          
          // Wrap pixel locations
          tc = (tc + img.width) % img.width;
          tr = (tr + img.height) % img.height;
          
          // Compute location in image pixel array
          int ip = tc + img.width*tr;
          
          // Get pixel color and apply matrix
          color c = img.pixels[ip];
          rsum += mat[mr][mc] * red(c);
          gsum += mat[mr][mc] * green(c);
          bsum += mat[mr][mc] * blue(c);
        }
      }
      
      // Create new pixel color save in filtered image
      int fp = ic + img.width*ir;
      img2.pixels[fp] = color(rsum, gsum, bsum);
    }
  }
  
  // Update pixels in filtered image
  img2.updatePixels();
  
  // Return filtered image
  return img2;
}


