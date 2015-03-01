
import JMyron.*;

JMyron theMov;
int[][][] globArray;



void setup() {
  size(640, 480);

  theMov = new JMyron();
  theMov.start(width, height);
  theMov.findGlobs(1);
  theMov.minDensity(100);
  theMov.trackColor(65, 124, 50, 95);

}

void draw() {
  theMov.update();
  int[] currFrame = theMov.image();

  // draw each pixel to the screen
  loadPixels();
  for (int i = 1000; i < width*height; i++) {
    float r = random (50);
    strokeWeight(random(10, 10));
  stroke(random(255), random (255), random (255)); // HSB Hue Saturation Brightness
  float rainbow_size = random(200, 270);
 
  }
  updatePixels();

  // draw the glob contours
  globArray = theMov.globEdgePoints(10);
  for (int i=0; i < globArray.length; i++) {
    int[][] contourArray = globArray[i];
    if (contourArray != null) {
      beginShape();
      for(int j=0; j < contourArray.length; j++) {    
        vertex(contourArray[j][0], contourArray[j][1]);
      }
      endShape(CLOSE);
    }
  }
}

public void stop() {
  theMov.stop();
  super.stop();
}

boolean sketchFullScreen() {
  return true;
}


