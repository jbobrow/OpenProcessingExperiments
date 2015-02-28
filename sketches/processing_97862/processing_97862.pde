
////////////////////////////////////////////////////////////////////////////////////
// Common declarations
// declare fullscreen variable
import fullscreen.*; // fullscreen second monitor
FullScreen fs; 

int switchNum = 0;


////////////////////////////////////////////////////////////////////////////////////
// interactive points

// import libraries
import processing.opengl.*; // opengl
import SimpleOpenNI.*; // kinect
import blobDetection.*; // blobs
// this is a regular java import so we can use and extend the polygon class (see PolygonBlob)
import java.awt.Polygon;

// declare SimpleOpenNI object
SimpleOpenNI context;
// declare BlobDetection object
BlobDetection theBlobDetection;
// declare custom PolygonBlob object (see class for more info)
PolygonBlob poly = new PolygonBlob();

// PImage to hold incoming imagery and smaller one for blob detection
PImage cam, blobs;
// the kinect's dimensions to be used later on for calculations
int kinectWidth = 640;
int kinectHeight = 480;
// to center and rescale from 640x480 to higher custom resolutions
float reScale;

// TO HAVE A VARIABLE SCALE WE CAN ADJUST WITH A KEYBOARD AND MATCH IT TO A PROJECTION
float scaleMultiplier = 1;

// background color
color bgColor;
// three color palettes (artifact from me storing many interesting color palettes as strings in an external data file ;-)
/*String[] palettes = {
  "-1117720,-13683658,-8410437,-9998215,-1849945,-5517090,-4250587,-14178341,-5804972,-3498634", 
  "-67879,-9633503,-8858441,-144382,-4996094,-16604779,-588031", 
  "-16711663,-13888933,-9029017,-5213092,-1787063,-11375744,-2167516,-15713402,-5389468,-2064585"
};*/

// an array called flow of 2250 Particle objects (see Particle class)
Particle[] flow = new Particle[2250];
// global variables to influence the movement of all particles
float globalX, globalY;

////////////////////////////////////////////////////////////////////////////////////
// chain on average libraries
import org.openkinect.*;
import org.openkinect.processing.*;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;
// Kinect Library object
Kinect kinect;

//Spring2D s1, s2;

Spring2D[] springs = new Spring2D[10];

float gravity = 6.0;
float mass = 3.2;

float deg = -15;

int iPS_hasrun=0;
int cOA_hasrun=0;

////////////////////////////////////////////////////////////////////////////////////
// I need an empty setup and the switcher in Draw

void setup() {
  size(1920, 1200, OPENGL);
}

void draw() {
  int num = switchNum;

switch(num) {
  case 0: // InteractivePoints sketch
  if (iPS_hasrun == 0) {
    iPS();
  }
  else {
  }
    iPSdraw();
    break;
  case 1: // ChainOnAverage sketch
   if (cOA_hasrun == 0) {
      cOA();
    }
    else {
    }    
    cOAdraw();
    break;
}
}

////////////////////////////////////////////////////////////////////////////////////
// Global Voids

void keyPressed() {
     
  if (key == CODED) {
    if (keyCode == LEFT) {
     
      switchNum -=1;
      resetcOA();
          } 
    else if (keyCode == RIGHT) {

    switchNum +=1;
    }
  }
}

void resetcOA() {
     
      KinectTracker tracker = new KinectTracker();
      cOA_hasrun = 0; // reset the setup when a key is pressed
      
      
}

////////////////////////////////////////////////////////////////////////////////////
// Interactivepoint's Voids

void iPS(){
 // initialize SimpleOpenNI object
  context = new SimpleOpenNI(this);
  if (!context.enableScene()) { 
    // if context.enableScene() returns false
    // then the Kinect is not working correctly
    // make sure the green light is blinking
    println("Kinect not connected!"); 
    exit();
  } else {
    // mirror the image to be more intuitive
    context.setMirror(false);
    // calculate the reScale value
    // currently it's rescaled to fill the complete width (cuts of top-bottom)
    // it's also possible to fill the complete height (leaves empty sides)
    reScale = (float) width / kinectWidth;
    // create a smaller blob image for speed and efficiency
    blobs = createImage(kinectWidth/3, kinectHeight/3, RGB);
    // initialize blob detection object to the blob image dimensions
    theBlobDetection = new BlobDetection(blobs.width, blobs.height);
    theBlobDetection.setThreshold(0.3);
    setupFlowfield();
  }
  iPS_hasrun=1;
}

void iPSdraw() {
  // fading background
  noStroke();
  fill(0, 65);
  rect(0, 0, width, height);
  // update the SimpleOpenNI object
  context.update();
  // put the image into a PImage
  cam = context.sceneImage().get();
  // copy the image into the smaller blob image
  blobs.copy(cam, 0, 0, cam.width, cam.height, 0, 0, blobs.width, blobs.height);
  // blur the blob image
  blobs.filter(BLUR);
  // detect the blobs
  theBlobDetection.computeBlobs(blobs.pixels);
  // clear the polygon (original functionality)
  poly.reset();
  // create the polygon from the blobs (custom functionality, see class)
  poly.createPolygon();
  drawFlowfield();
}


void setupFlowfield() {
  // set stroke weight (for particle display) to 2.5
  strokeWeight(2.5);
  // initialize all particles in the flow
  for(int i=0; i<flow.length; i++) {
    flow[i] = new Particle(i/10000.0);
  }
  // set all colors randomly now
 // setRandomColors(1);
}

void drawFlowfield() {
  // center and reScale from Kinect to custom dimensions
  translate(0, (height-kinectHeight*reScale)/2);
  // Modify value to rescale and match to projection
  scale(reScale*scaleMultiplier);
  // set global variables that influence the particle flow's movement
  globalX = noise(frameCount * 0.01) * width/2 + width/4;
  globalY = noise(frameCount * 0.005 + 5) * height;
  // update and display all particles in the flow
  for (Particle p : flow) {
    p.updateAndDisplay();
  }
  // set the colors randomly every 240th frame
  // setRandomColors(100);
}

// a basic noise-based moving particle
class Particle {
  // unique id, (previous) position, speed
  float id, x, y, xp, yp, s, d;
  color col; // color
  
  Particle(float id) {
    this.id = id;
    s = random(2, 6); // speed
  }
  
  void updateAndDisplay() {
    // let it flow, end with a new x and y position
    id += 0.01;
    d = (noise(id, x/globalY, y/globalY)-0.5)*globalX;
    x += cos(radians(d))*s;
    y += sin(radians(d))*s;

    // constrain to boundaries
    if (x<-10) x=xp=kinectWidth+10;
    if (x>kinectWidth+10) x=xp=-10;
    if (y<-10) y=yp=kinectHeight+10;
    if (y>kinectHeight+10) y=yp=-10;

    // if there is a polygon (more than 0 points)
    if (poly.npoints > 0) {
      // if this particle is outside the polygon
      if (!poly.contains(x, y)) {
        // while it is outside the polygon
        while(!poly.contains(x, y)) {
          // randomize x and y
          x = random(kinectWidth);
          y = random(kinectHeight);
        }
        // set previous x and y, to this x and y
        xp=x;
        yp=y;
      }
    }
    
    // individual particle color
    stroke(255,255,255);
    // line from previous to current position
    line(xp, yp, x, y);
    
    // set previous to current position
    xp=x;
    yp=y;
  }
}

// an extended polygon class with my own customized createPolygon() method (feel free to improve!)
class PolygonBlob extends Polygon {

  // took me some time to make this method fully self-sufficient
  // now it works quite well in creating a correct polygon from a person's blob
  // of course many thanks to v3ga, because the library already does a lot of the work
  void createPolygon() {
    // an arrayList... of arrayLists... of PVectors
    // the arrayLists of PVectors are basically the person's contours (almost but not completely in a polygon-correct order)
    ArrayList<ArrayList<PVector>> contours = new ArrayList<ArrayList<PVector>>();
    // helpful variables to keep track of the selected contour and point (start/end point)
    int selectedContour = 0;
    int selectedPoint = 0;

    // create contours from blobs
    // go over all the detected blobs
    for (int n=0 ; n<theBlobDetection.getBlobNb(); n++) {
      Blob b = theBlobDetection.getBlob(n);
      // for each substantial blob...
      if (b != null && b.getEdgeNb() > 100) {
        // create a new contour arrayList of PVectors
        ArrayList<PVector> contour = new ArrayList<PVector>();
        // go over all the edges in the blob
        for (int m=0; m<b.getEdgeNb(); m++) {
          // get the edgeVertices of the edge
          EdgeVertex eA = b.getEdgeVertexA(m);
          EdgeVertex eB = b.getEdgeVertexB(m);
          // if both ain't null...
          if (eA != null && eB != null) {
            // get next and previous edgeVertexA
            EdgeVertex fn = b.getEdgeVertexA((m+1) % b.getEdgeNb());
            EdgeVertex fp = b.getEdgeVertexA((max(0, m-1)));
            // calculate distance between vertexA and next and previous edgeVertexA respectively
            // positions are multiplied by kinect dimensions because the blob library returns normalized values
            float dn = dist(eA.x*kinectWidth, eA.y*kinectHeight, fn.x*kinectWidth, fn.y*kinectHeight);
            float dp = dist(eA.x*kinectWidth, eA.y*kinectHeight, fp.x*kinectWidth, fp.y*kinectHeight);
            // if either distance is bigger than 15
            if (dn > 15 || dp > 15) {
              // if the current contour size is bigger than zero
              if (contour.size() > 0) {
                // add final point
                contour.add(new PVector(eB.x*kinectWidth, eB.y*kinectHeight));
                // add current contour to the arrayList
                contours.add(contour);
                // start a new contour arrayList
                contour = new ArrayList<PVector>();
              // if the current contour size is 0 (aka it's a new list)
              } else {
                // add the point to the list
                contour.add(new PVector(eA.x*kinectWidth, eA.y*kinectHeight));
              }
            // if both distance are smaller than 15 (aka the points are close)  
            } else {
              // add the point to the list
              contour.add(new PVector(eA.x*kinectWidth, eA.y*kinectHeight));
            }
          }
        }
      }
    }
    
    // at this point in the code we have a list of contours (aka an arrayList of arrayLists of PVectors)
    // now we need to sort those contours into a correct polygon. To do this we need two things:
    // 1. The correct order of contours
    // 2. The correct direction of each contour

    // as long as there are contours left...    
    while (contours.size() > 0) {
      
      // find next contour
      float distance = 999999999;
      // if there are already points in the polygon
      if (npoints > 0) {
        // use the polygon's last point as a starting point
        PVector lastPoint = new PVector(xpoints[npoints-1], ypoints[npoints-1]);
        // go over all contours
        for (int i=0; i<contours.size(); i++) {
          ArrayList<PVector> c = contours.get(i);
          // get the contour's first point
          PVector fp = c.get(0);
          // get the contour's last point
          PVector lp = c.get(c.size()-1);
          // if the distance between the current contour's first point and the polygon's last point is smaller than distance
          if (fp.dist(lastPoint) < distance) {
            // set distance to this distance
            distance = fp.dist(lastPoint);
            // set this as the selected contour
            selectedContour = i;
            // set selectedPoint to 0 (which signals first point)
            selectedPoint = 0;
          }
          // if the distance between the current contour's last point and the polygon's last point is smaller than distance
          if (lp.dist(lastPoint) < distance) {
            // set distance to this distance
            distance = lp.dist(lastPoint);
            // set this as the selected contour
            selectedContour = i;
            // set selectedPoint to 1 (which signals last point)
            selectedPoint = 1;
          }
        }
      // if the polygon is still empty
      } else {
        // use a starting point in the lower-right
        PVector closestPoint = new PVector(width, height);
        // go over all contours
        for (int i=0; i<contours.size(); i++) {
          ArrayList<PVector> c = contours.get(i);
          // get the contour's first point
          PVector fp = c.get(0);
          // get the contour's last point
          PVector lp = c.get(c.size()-1);
          // if the first point is in the lowest 5 pixels of the (kinect) screen and more to the left than the current closestPoint
          if (fp.y > kinectHeight-5 && fp.x < closestPoint.x) {
            // set closestPoint to first point
            closestPoint = fp;
            // set this as the selected contour
            selectedContour = i;
            // set selectedPoint to 0 (which signals first point)
            selectedPoint = 0;
          }
          // if the last point is in the lowest 5 pixels of the (kinect) screen and more to the left than the current closestPoint
          if (lp.y > kinectHeight-5 && lp.x < closestPoint.y) {
            // set closestPoint to last point
            closestPoint = lp;
            // set this as the selected contour
            selectedContour = i;
            // set selectedPoint to 1 (which signals last point)
            selectedPoint = 1;
          }
        }
      }

      // add contour to polygon
      ArrayList<PVector> contour = contours.get(selectedContour);
      // if selectedPoint is bigger than zero (aka last point) then reverse the arrayList of points
      if (selectedPoint > 0) { Collections.reverse(contour); }
      // add all the points in the contour to the polygon
      for (PVector p : contour) {
        addPoint(int(p.x), int(p.y));
      }
      // remove this contour from the list of contours
      contours.remove(selectedContour);
      // the while loop above makes all of this code loop until the number of contours is zero
      // at that time all the points in all the contours have been added to the polygon... in the correct order (hopefully)
    }
  }
}



////////////////////////////////////////////////////////////////////////////////////
// ChainOnAverage's Voids

void cOA() {
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  // Inputs: x, y, mass, gravity
  for (int i = 0; i < springs.length; i++) {
    springs[i] = new Spring2D(0.0, width/2, mass, gravity);
  }
  cOA_hasrun=1;

}

void cOAdraw() {
    background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + (int)frameRate + "    " + "UP increase threshold, DOWN decrease threshold", 10, 500); 

  // let's bring in the chains sketch;
  for (int i = 0; i < springs.length; i++) {
    if (i == 0) {
      springs[i].update(v1.x, v1.y);
      if ( mousePressed == false ) {
        springs[i].display(v1.x, v1.y);
      }
    } 
    else {
      springs[i].update(springs[i-1].x, springs[i-1].y);
      if ( mousePressed == false ) {
        springs[i].display(springs[i-1].x, springs[i-1].y);
      }
    }
  }
}

class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.2;
  float damping = 0.8;

  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }

  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }

  void display(float nx, float ny) {
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
  }
}

void stop() {
  tracker.quit();
  super.stop();
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
    kinect.processDepthImage(true);

    display = createImage(kw,kh,PConstants.RGB);

    loc = new PVector(0,0);
    lerpedLoc = new PVector(0,0);
  }

  void track() {

    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
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

    // Interpolating the location, doing it arbitrarily for now
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

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for(int x = 0; x < kw; x++) {
      for(int y = 0; y < kh; y++) {
        // mirroring image
        int offset = kw-x-1+y*kw;
        // Raw depth
        int rawDepth = depth[offset];

        int pix = x+y*display.width;
        if (rawDepth < threshold) {
          // A red color instead
          display.pixels[pix] = color(150,50,50);
        } 
        else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display,0,0);
  }

  void quit() {
    kinect.quit();
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}
