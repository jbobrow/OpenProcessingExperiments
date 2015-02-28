
/**
 * Brightness Tracking 
 * by Golan Levin. 
 * 
 * Tracks the brightest pixel in a live video signal. 
 */

Ripple ripple;
import processing.video.*;

int numPixels;
int[] previousFrame;
Capture video;
int count=1;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 24);
  noStroke();
  smooth();
   numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  ripple = new Ripple();
   frameRate(24);
}

void draw() {
  
  if (video.available()) {
    video.read();
    //image(video, 0, 0, width, height); // Draw the webcam video onto the screen
    int brightestX = 0; // X-coordinate of the brightest video pixel
    int brightestY = 0; // Y-coordinate of the brightest video pixel
    float bestGreen = 50;
    float bestRed =0;
    float bestBlue =0;
    float brightestValue = 0; // Brightness of the brightest video pixel
    // Search for the brightest pixel: For each row of pixels in the video image and
    // for each pixel in the yth row, compute each pixel's index in the video
    video.loadPixels();
    int index = 0;
    for (int y = 0; y < video.height; y++) {
      for (int x = 0; x < video.width; x++) {
        // Get the color stored in the pixel
        int pixelValue = video.pixels[index];
        // Determine the brightness of the pixel
        float pixelBrightness = brightness(pixelValue);
        float colourRed = red(pixelValue);
        float colourGreen = green(pixelValue);
        float colourBlue = blue(pixelValue);
        // If that value is brighter than any previous, then store the
        // brightness of that pixel, as well as its (x,y) location
        if (/*pixelBrightness > brightestValue &&*/ colourGreen >= bestGreen /*&& colourGreen<250*/ && colourRed<50 && colourBlue<150) {
          brightestValue = pixelBrightness;
          brightestY = y;
          brightestX = x;
        bestRed = colourRed;
        bestGreen = colourGreen;
        bestBlue = colourBlue;
        }
        index++;
      }
   }
    
   
    // Draw a large, yellow circle at the brightest pixel
    stroke(0);
    line(200,0,200,height);
    noStroke();
    fill(255, 204, 0, 100);
    ellipse(brightestX, brightestY, 20, 20);
    
    if (brightestX >200){
    count = 0;
    }
    if (brightestX <=200 && count <= 1){
      //rect(100,50,20,20);
      //rect(brightestX,brightestY,20,20);
        for (int j = brightestY - ripple.riprad; j < brightestY + ripple.riprad; j++) {
    for (int k = brightestX - ripple.riprad; k < brightestX + ripple.riprad; k++) {
      if (j >= 0 && j < height && k>= 0 && k < width) {
        ripple.ripplemap[ripple.oldind + (j * width) + k] += 300;
      }}
    }
    count+=5;
    }
    
    
    
      int q = int(random(video.width));
  int w = int(random(video.height));
  //if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    loadPixels();
    video.loadPixels(); // Make its pixels[] array available
    
    int movementSum = 0; // Amount of movement in the frame
   // for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      for (int i = 0; i < width * height; i++) {
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      // Add these differences to the running tally
      movementSum += diffR + diffG + diffB;
      // Render the difference image to the screen
   pixels[i] = ripple.col[i] ;

    //  pixels[i] = ripple.col[i] + (RGB);
      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
    }
    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.
    if (movementSum > 0) {
      updatePixels();
       ripple.newframe();
 
      println(movementSum); // Print the total amount of movement to the console
        
  }
  //}
  
  }
}

class Ripple {
  int i, a, b;
  int oldind, newind, mapind;
  short ripplemap[]; // the height map
  int col[]; // the actual pixels
  int riprad;
  int rwidth, rheight;
  int ttexture[];
  int ssize;

  Ripple() {
    // constructor
    riprad = 3;
    rwidth = width >> 1;
    rheight = height >> 1;
    ssize = width * (height + 2) * 2;
    ripplemap = new short[ssize];
    col = new int[width * height];
    ttexture = new int[width * height];
    oldind = width;
    newind = width * (height + 3);
  }



  void newframe() {
    // update the height map and the image
    i = oldind;
    oldind = newind;
    newind = i;

    i = 0;
    mapind = oldind;
    for (int w = 0; w < height; w++) {
      for (int q = 0; q < width; q++) {
        short data = (short)((ripplemap[mapind - width] + ripplemap[mapind + width] + 
          ripplemap[mapind - 1] + ripplemap[mapind + 1]) >> 1);
        data -= ripplemap[newind + i];
        data -= data >> 5;
        if (q == 0 || w == 0) // avoid the wraparound effect
          ripplemap[newind + i] = 0;
        else
          ripplemap[newind + i] = data;

        // where data = 0 then still, where data > 0 then wave
        data = (short)(1024 - data);

        // offsets
        a = ((q - rwidth) * data / 1024) + rwidth;
        b = ((w - rheight) * data / 1024) + rheight;

        //bounds check
        if (a >= width) 
          a = width - 1;
        if (a < 0) 
          a = 0;
        if (b >= height) 
          b = height-1;
        if (b < 0) 
          b=0;

        col[i] = video.pixels[a + (b * width)];
       // col[i] = color(diffR,diffG,diffB);
        mapind++;
        i++;
  
   

    }
    }
  }
}

  


/*void mouseDragged() {
  for (int j = mouseY - ripple.riprad; j < mouseY + ripple.riprad; j++) {
    for (int k = mouseX - ripple.riprad; k < mouseX + ripple.riprad; k++) {
      if (j >= 0 && j < height && k>= 0 && k < width) {
        ripple.ripplemap[ripple.oldind + (j * width) + k] += 300;


    }
    }
  }
}*/

