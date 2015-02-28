
import processing.video.*;

Capture video;
PImage prevFrame;

float threshold = 30; // HIGHER THRESHOLD, GRID DISSAPEARS WITH NO MOVEMENT. 

int transparency = 150;
int colour = #FF33CC;
 
int maxDistance = 400;

void setup() {

  size(600, 600, P3D);


  // Using the default capture device
  video = new Capture(this, width, height, 15);
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width, video.height, RGB);
}

void draw() {

  background(255);
  noStroke();
  smooth();
  fill(colour, transparency);
  // strokeWeight(1);

  //image(video, 0, 0); // VIDEO IMAGE DOES NOT NEED TO BE DISPLAYED

  // Capture video
  if (video.available()) {
    // Save previous frame for motion detection!!
    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    prevFrame.updatePixels();
    video.read();
  }


  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  // These are the variables we'll need to find the average X and Y
  float sumX = 0;
  float sumY = 0;
  int motionCount = 0; 

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      // What is the current color
      color current = video.pixels[x+y*video.width];

      // What is the previous color
      color previous = prevFrame.pixels[x+y*video.width];

      // Step 4, compare colors (previous vs. current)
      float r1 = red(current); 
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous);
      float b2 = blue(previous);

      // Motion for an individual pixel is the difference between the previous color and current color.
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // If it's a motion pixel add up the x's and the y's
      if (diff > threshold) {
        sumX += x;
        sumY += y;
        motionCount++;
      }
    }
  }

  // average location is total location divided by the number of motion pixels.
  float avgX = sumX / motionCount; 
  float avgY = sumY / motionCount; 

  // Draw a circle based on average motion
  //smooth();
  //noStroke();
  //fill(#101010);
  ellipse(avgX, avgY, 5, 5);


  PVector motionPos, shapePos;
  for (int gridX=0; gridX<width; gridX=gridX+25) {
    for (int gridY=0; gridY<height; gridY=gridY+25) {
      motionPos = new PVector (avgX, avgY );
      shapePos = new PVector (gridX, gridY);

      float diameter = dist(motionPos.x, motionPos.y, shapePos.x, shapePos.y);
      diameter = diameter*50/maxDistance;

      pushMatrix();
      translate(gridX, gridY, diameter*2);
      ellipse( 0, 0, diameter, diameter);
      popMatrix();
    }
  }
}


