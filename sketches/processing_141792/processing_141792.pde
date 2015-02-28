


import processing.video.*;
//Number of pixels taken from video size
int numPixels;
//1D array of pixels of previous frame
int[] previousFrame;
//Values for number of times pixel has been marked as different
int[] pixelCount;
//millis();
Capture video;

void setup() {
  colorMode(HSB,225);
  size(800, 600);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);

  // Start capturing the images from the camera
  video.start(); 
  //Get number of pixels
  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame, pixelcounts
  previousFrame = new int[numPixels];
  pixelCount = new int[numPixels];
  //Load screen output to pixels[]
  loadPixels();
}

void draw() {

//println(minutes);
  //  if ((millis() % (300000)) < 10 && (millis() % (300000)) > 0) {
    
    if (frameCount % 10000 == 0){ // 2000 = 1:30 minute
print("snap");
       saveFrame("DocumentingMovementTest4-########.png");
}
  
  //Draw all pixels black to start
  for (int i = 0; i < numPixels; i++) {
   // pixels[i] = color(0,0,0); // was 0,0,0 *************HASHED
  }


  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available


    //Loop through all pixels
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...

      //Get color of pixel we are currently looking at in loop for current and prev frames
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];

      // Extract brightness components from current pixel
      
      float currB = brightness(currColor);
      // Extract brightness components from previous pixel

      float prevB = brightness(prevColor);


      //Call difference() (bottom of file) to check for a difference in pixel
      //Final number is range for difference
      if (difference( currB, prevB, 30)) {// when 20 you capture framed images / when raised there is more black space
        //Add 10 to pixelCount for the pixel we are looking at, 
        //because it changed since the last frame
        pixelCount[i] = pixelCount[i] + 5; // Lower pixle count adition to make transition slower
        //Set corresponding pixel in pixels[] (representing pixels to be drawn on screen) to a value
        //pixels[i] = color(12, 80,200);// color of activity
      }
      else {
        //If it didn't change at all, color it just based on its pixelCount value
        pixels[i] = color(pixelCount[i]/ 15, 50, 150); //(1=color, brightness  pixelCount[i]/3 100, 50 -- raise denominator to make transition more gradual 
      }
      //Save the current frame to prevFrame now that we're done with the for loop through the image
      previousFrame[i] = currColor;
    }
    //Updatepixels() takes whatever is in the array pixels[] and draws it to the screen
    updatePixels();

  }
}

boolean difference(float b1, float b2, int range) {
  if (b1 < b2 -range || b1 > b2 + range) {
    return true;

  }
  else {
    return false;

  }


  

}




//make grid

//for (i=0 
//ellipse (x,y,d,d)


