
import org.openkinect.*;
import org.openkinect.processing.*;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;
// Kinect Library object
Kinect kinect;

void setup() {
  size(640,520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(0);

  // Run the tracking analysis
  tracker.track();

  // Let's draw the location
  PVector v1 = tracker.getPos();
  fill(255,0,0);
  noStroke();
  ellipse(v1.x,v1.y,100,100);
  
}





class KinectTracker {



  // Size of kinect image
  int kw = 640;
  int kh = 480;
  int threshold = 745;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;


  PImage display;

  KinectTracker() {
    kinect.start();
    kinect.enableDepth(true);

    // We could skip processing the grayscale image for efficiency
    // but this example is just demonstrating everything
   // kinect.processDepthImage(true);

  //  display = createImage(kw,kh,PConstants.RGB);

    loc = new PVector(0,0);
    lerpedLoc = new PVector(0,0);
  }

  void track() {

    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for(int x = 0; x < kw; x++) {
      for(int y = 0; y < kh; y++) {
        // Mirroring the image
        int offset = kw-x-1+y*kw;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count,sumY/count);
    }

    // Interpolating the location, 
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

   

  }
}



