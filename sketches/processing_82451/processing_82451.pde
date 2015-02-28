

/* @pjs preload="REAS.png"; */

 ////////////////////////////////////////////////////
 //                                                //
 //   10 PRINT - Image Dithering ( Monochrome )    //
 //                                                //
 ////////////////////////////////////////////////////
 
 // (c) Martin Schneider 2012
 
/****************************************************
 *
 *  In this Variant of 10 PRINT the randomness
 *  is taken from the image source.
 *
 * <li>  Move the mouse left for maximum randomness
 * <br>    (sampling the least significant bits)
 *
 * <li>  Move the mouse right for minimum randomness
 * <br>    (sampling the most significant bits)
 *
 * <li>  Press any key to change the resolution
 *
 ****************************************************/
 
 // 10 PRINT CHR$(205.5+RND(1)); : GOTO 10
 // 20 REM Inspired by http://10print.org/
 // 30 REM Image: Casey Reas (c) C.E.B. REAS
 
PImage img, sample;
int res, n, d;

// list of resolutions
int[] rlist = { 25, 50,  100, 10, 20 };

  
void setup() {
  
  size(400, 400);
  img = loadImage("REAS.png");
  nextRes();

}


void nextRes() {
  
  // resample the image
  res = (res + 1) % rlist.length;
  n = rlist[res];
  sample = img.get();
  sample.resize(n, n);
  d = width/n;
  
}


void draw() {
  
  int m = constrain(130 * mouseX / width, 1, 129);

  loadPixels();
 
  // iterate over all blocks
  for(int x = 0; x < n; x++) {
    for(int y = 0; y < n; y++) {
      
      // sample pixel brightness
      float val = 256 - (sample.pixels[y*n+x] & 255);
      
      // iterate over all pixels of a block
      for(int dx = 0; dx < d; dx++) {
        for(int dy = 0; dy < d; dy++) { 
          
          // get diagonal coordinate
          int z = val % (2*m) < m ? (dx+dy+1) * 255 / d : (dx+d-dy) * 255 / d;
                   
          // black and white dithering
          pixels[ (y*d + dy) * width + (x*d + dx) ] = val > 2 * abs(z - 255) + 2 ? #000000 : #ffffff; 
          
        }
      }
      
    }
  }
    
  updatePixels();
  
}


void keyPressed() {
  nextRes();
}






