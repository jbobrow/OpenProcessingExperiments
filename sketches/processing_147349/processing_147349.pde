
import SimpleOpenNI.*;

SimpleOpenNI kinect;

int closestVal;
int closestX;
int closestY;

int previousX;
int previousY;
float lastX, lastY;

void setup() {
  
  size(640, 480);
  background(255);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
    kinect.setMirror(true);

}

void draw() {
  closestVal = 8000;
  kinect.update();
  
  int[] depthValues = kinect.depthMap();
  
  for(int y = 0; y < 480; y++) {
    for(int x = 0; x < 640; x++) {
      int i = x + y*640;
      int currentDepthValue = depthValues[i];
      
      if(currentDepthValue > 610 && currentDepthValue < 800 && currentDepthValue < closestVal) {
        closestVal = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  float interpolX = lerp(lastX, closestX, 0.6f);
   float interpolY = lerp(lastY, closestY, 0.6f); 
 // image(kinect.depthImage(), 0, 0);
  stroke(255,0,0);
  strokeWeight(3);
  if(dist(lastX, lastY, interpolX, interpolY) < 100) {
  line(lastX, lastY, interpolX, interpolY);
  lastX = interpolX;
  lastY = interpolY;
  }
}

void mousePressed() {
  background(0);
}



