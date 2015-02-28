
/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 */
 
PImage a;
int SCRIBBLE = 0;
int HATCHING = 1;
float[][] kernel = { { -1, -1, -1 },
                     { -1,  9, -1 },
                     { -1, -1, -1 } };


void setup(){
  
  a = loadImage("halfbanana.png");
  size(640,480);
  noStroke();
  background(255);

  float[]x = {310,299,296,265,238,240,230,182,143, 145, 167,178,211,265, 407,472,573,592, 561,507,486, 456,371,354,324,307,317,308,332,328,329,368,306,292,291,263,262,294,261,250,241,238,256,220,177,171,206,192,245,277,309,333,355,371,367,372,};
  float[]y = {359, 334,340,334,313,298,306,289,247, 183, 148, 115, 79, 58,23,1,3,29, 61,84,91, 109,125,91,82,95,108,114,120,138,153, 143,170,190,225,224,165,118,129,206,153,196,225,255,221,165,206,254,292,284,316,330,333,349,356,368,};

  float[][]xy = {x, y};
  

  noStroke();
  
 makeColor();
  //EdgeDetect();
  makeRect(xy);
  filter(INVERT);
  //background(255);
}

void EdgeDetect(PImage a){
a.loadPixels();
// Create an opaque image of the same size as the original
PImage edgeImg = createImage(a.width, a.height, RGB);
// Loop through every pixel in the image.
for (int y = 1; y < a.height-1; y++) { // Skip top and bottom edges
  for (int x = 1; x < a.width-1; x++) { // Skip left and right edges
    float sum = 0; // Kernel sum for this pixel
    for (int ky = -1; ky <= 1; ky++) {
      for (int kx = -1; kx <= 1; kx++) {
        // Calculate the adjacent pixel for this kernel point
        int pos = (y + ky)*a.width + (x + kx);
        // Image is grayscale, red/green/blue are identical
        float val = red(a.pixels[pos]);
        // Multiply adjacent pixels based on the kernel values
        sum += kernel[ky+1][kx+1] * val;
      }
    }
    // For this pixel in the new image, set the gray value
    // based on the sum from the kernel
    edgeImg.pixels[y*a.width + x] = color(sum);
  }
}
// State that there are changes to edgeImg.pixels[]
edgeImg.updatePixels();
image(edgeImg, 0, 0); // Draw the new image
//makeColor(edgeImg);


}

void makeColor()
{ 
 // float pointillize = map(mouseX, 0, width, 2, 18);
  for(int in = 0; in < 40000; in++){
    int x = int(random(a.width));
    int y = int(random(a.height));
    color pix = a.get(x, y);
    fill(pix, 126);
    ellipse(x, y, 13,13);
  }
  
}

void makeRect(float[][]pts){
  stroke(0);
  smooth();
  
  // Scribble variables, that get passed as arguments to the scribble function
  int steps = 50;
  float scribVal = 2.0;
  for (int i = 0; i < pts[0].length; i++){
    // Plots vertices
    //strokeWeight(16);
   // point(pts[0][i], pts[1][i]);

    // Call scribble function
    strokeWeight(1.5);
    if (i > 0){ 
      scribble(pts[0][i], pts[1][i], pts[0][i-1], pts[1][i-1], steps, scribVal, SCRIBBLE);
    } 
    if (i == pts[0].length-1){
    // Show some hatching between last 2 points
      scribble(pts[0][i], pts[1][i], pts[0][0], pts[1][0], steps, scribVal*2, HATCHING);
    }
  }
}

/* 
  Scribble function plots lines between end points, 
  determined by steps and scribVal arguments.
  two styles are available: SCRIBBLE and HATCHING, which
  are interestingly only dependent on parentheses
  placement in the line() function calls.
*/

void scribble(float x1, float y1, float x2, float y2, int steps, float scribVal, int style){

  float xStep = (x2-x1)/steps;
  float yStep = (y2-y1)/steps;
  for (int i = 0; i < steps; i++){
    if(style == SCRIBBLE){
      if (i < steps-1){
        line(x1, y1, x1+=xStep+random(-scribVal, scribVal), y1+=yStep+random(-scribVal, scribVal));
      } 
      else {
        // extra line needed to attach line back to point- not necessary in HATCHING style
        line(x1, y1, x2, y2);
      }
    }
  //  else if (style == HATCHING){
    //   line(x1, y1, (x1+=xStep)+random(-scribVal, scribVal), (y1+=yStep)+random(-scribVal, scribVal));
    //}
  }
}


