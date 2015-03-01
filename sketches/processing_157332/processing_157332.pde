
/**
 * Frame Differencing 
 * by Golan Levin. 
 *
 * Quantify the amount of movement in the video frame using frame-differencing.
 */


import processing.video.*;

int numPixels;
int[] previousFrame;
Capture video;

ArrayList<Flame> fire;

void setup() {
  size(1280, 720);
  background(0);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);

  // Start capturing the images from the camera
  video.start(); 

  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  loadPixels();

  fire = new ArrayList<Flame>();
}

void draw() {
  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available

    int movementSum = 0; // Amount of movement in the frame
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
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

      //I COMMENTED THIS OUT
      //      pixels[i] = color(diffR, diffG, diffB);

      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
    }

    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.
    //if (movementSum > 0) {
    updatePixels();

    println(movementSum); // Print the total amount of movement to the console
    //} 


    for (int i = 0; i < fire.size (); i++) {
      Flame f = fire.get(i);
      f.update();
      f.display();

      if (f.y <0) {
        fire.remove(i);
      }
    }

    if (movementSum>12500000) {
      float sparkNum = map(movementSum, 12500000, 110000000, 1, 25);
      float minSpeed = map(movementSum, 12500000, 90000000, -2, -40);
      float maxSpeed = map(movementSum, 12500000, 90000000, -5, -70);

      for (int i = 0; i < sparkNum; i++) {
        fire.add(new Flame(width/2, height, random(minSpeed, maxSpeed), map(movementSum, 12500000, 90000000, 0, 100), 3, 10));
      }

      //map(movementSum, 14000000, 100000000, 1, 40), 
      //        map(movementSum, 14000000, 100000000, 3, 70)
      //      fill(255, map(movementSum, 14000000, 100000000, 0, 255));
      //      float cSize = map(movementSum, 14000000, 100000000, 50, width/2);
      //      ellipse(width/2, height/2, cSize, cSize);
      //      }
    }
  }
}

class Flame {
  
  float x, y;
  float xSpeed, ySpeed;
  float flameW, flameH;
  float distO;
  int fH, fHStart, fS, fA;

  

  Flame(float xStart, float yStart, float YSpeed, float FA, float fSizeMin, float fSizeMax) {
    colorMode(HSB,360,100,100,100);
    x = xStart + random(-10,10);
    y = yStart + cos(xStart) * random (8,15);
    flameW = random(fSizeMin,fSizeMax);
    ySpeed=YSpeed;
    distO = dist(x,y,xStart,yStart);
    fHStart = int(random(60,70));
    fH =fHStart;
    fS = 100;
    fA = int(FA);
  }

  void update() {
    xSpeed= sin(frameCount*random(.01,.1))*random(8,12);
    x+=xSpeed;
    y+=ySpeed;
    flameW=flameW+random(0.7);
    fH-=1;
    fA=fA-int(random(-10,20));
  }

  void display() {
    noStroke();
    fill(fH,fS,100,fA);
    ellipse(x, y, flameW, flameW);
  }


}



