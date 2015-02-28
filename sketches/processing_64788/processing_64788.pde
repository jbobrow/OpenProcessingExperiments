
/**
 * Color Detector
 * by Jorge Nuno Coutinho
 *
 * A color detector with a very unoriginal name made in Processing.
 * It detects blobs of a specified color in a video feed and sends them over OSC.
 *
 * Built as part of an interactive instalation: RoRoD (in the future, there will be an URL)
 *  
 *
 * In a nutshell:
 *
 * - First we get the image from the camera
 * - Then we compare each pixel of the feed to a provided reference color.
 *   We binarize the image: white where it matches, black where it doesn't
 * - We then submit that image to the blob detector
 * - Then we transform the blob's position according to a transformation matrix (keystoning)
 *   Blob coordinates will be normalized to this transformation matrix
 * - Finally, we send the transformed location information over TUIO compatible OSC
 */



// Processing's own video library
import processing.video.*;
// Java's Color class. Used to convert between RGB and HSB colorspaces
import java.awt.Color;

// André Sier's blob detection library
import s373.flob.*; // "http://s373.net/code/flob/flob.html"

// Andreas Schlegel's OSC library
import oscP5.*; // "http://www.sojamo.de/libraries/oscP5/"
import netP5.*;

// David Bouchard's keystone correction library
import deadpixel.keystone.*; // "http://keystonep5.sourceforge.net/"


// Constants for changing parameters. See "void keyPressed" for usage
final int UP = 0;
final int DOWN = 1;
final int UPP = 2;
final int DOWNN = 3;

// State managing booleans
boolean TEXT = true;
boolean DRAW = true;
boolean BLOBS = true;


// The capture device/movie clip we'll use
//Capture feed;
Movie feed;


// The camera's capture resolution
int resH; 
int resV;

// The blob detector
Detector detector;

// An ArrayList to store the blobs to be sent by OSC
ArrayList<ABlob> blobs; 

// A transformation matrix for transforming camera positions into projected positions
// (in case the projection is not perfectly aligned with the camera feed)
Matrix matrix;


// OSC comunication variables
Comm comm;

// Delta time
long time;



void setup() {
  
  // Low resolutions to speed up processing time
  // Tweak to balance precision/time
  resH = 160;
  resV = 120;
  
  // P3D or OPENGL are required to use the keystone library
  size(480, 240, P3D);
  ellipseMode(CENTER);
  
  // Tweak for the camera's framerate
  frameRate(30);
  
  noStroke();

  // The input feed to be analyzed
  // Uncomment the capture and comment theto use the webcam
  //feed = new Capture(this, feedX, feedY);
  feed = new Movie(this, "movie.mov");
  feed.loop();
  
  // The blob detector
  detector = new Detector(this, resH, resV);
  // TUIO communication
  comm = new Comm(this);
  // The adjustment matrix
  matrix = new Matrix(this);
  
}



void draw() {
  
  // Measure processing time
  time = millis();

  // Load a new frame from the camera
  if (feed.available() == true) {
    feed.read();
  }
  
  // Display the camera's feed
  if (DRAW) {
    background(50);
    image(feed, 0, 0, 320, 240);
  }
  
  // Prepare the feed for processing
  detector.prepare(feed);
  
  // Draw the processed image
  if(DRAW) {
    image(feed, 320, 0, 160, 120);
  }
  
  // And analyze the feed for blobs
  detector.analyze(feed);
  
  
  // Get the detected blobs
  blobs = detector.getBlobs();


  // Desenhar a matriz de transformação, caso estejamos em modo de calibração
  matrix.update();


  // Iterate detected blobs
  for (ABlob b : blobs) {

    // Transform positions using the transformation matrix
    PVector pos = matrix.surface.getTransformedCursor(round(b.cx), round(b.cy));

    // Normalize position
    // (i.e. make it vary between 0 and 1)
    float nX = pos.x/resH;
    float nY = pos.y/resV;
    

    // Draw Blobs
    if (BLOBS) {
      fill(0, 0, 255, 100);
      // On the camera feed
      ellipse(b.cx, b.cy, b.dimx, b.dimy);
      // On the processed feed preview
      ellipse(320 + (nX*80), nY*60, b.dimx*0.5f, b.dimy*0.5f);

      // After the matrix transformation
      fill(255, 0, 0, 100);
      ellipse(pos.x, pos.y, b.dimx, b.dimy);
    }
    
    // If the blobs are within the transformation matrix, then they can be sent over TUIO
    if(nX >= 0 && nX <= 1 && nY >= 0 && nY <= 1) {
      comm.send(nX, nY);
    }
    
  }


  // Info text
  if (TEXT) {
    fill(255);
    textAlign(LEFT);

    text(frameRate, 320+5, 120+15);
    text((millis() - time) + "ms", 320+5, 120+25);
    
    text("Tolerance: " + detector.getTolerance(), 320+5, height - 30);
    text("MinBlob: " + detector.getMinBlob(), 320+5, height - 20);
    text("OSC: " + ((comm.enabled) ? "enabled" : "disabled"), 320+5, height - 10);
    
  } else {
    println("FrameRate: " + frameRate);
    println((millis() - time) + "ms");
  }
}


void mousePressed() {
  
  // Track the right-clicked color
  if(mouseButton == RIGHT) {
    color c = get(mouseX, mouseY);
    detector.setColor(c);
  }
  
}


void keyPressed() {
  
  // Change color tolerance
  if (key == 'q') {
    detector.incrementTolerance(UP);
  } 
  else if (key == 'a') {
    detector.incrementTolerance(DOWN);
  } 
  else if (key == 'Q') {
    detector.incrementTolerance(UPP);
  } 
  else if (key == 'A') {
    detector.incrementTolerance(DOWNN);
  }
  
  
  // Change minimum blob size
  if (key == 'w') {
    detector.incrementMinBlob(UP);
  } 
  else if (key == 's') {
    detector.incrementMinBlob(DOWN);
  } 
  else if (key == 'W') {
    detector.incrementMinBlob(UPP);
  } 
  else if (key == 'S') {
    detector.incrementMinBlob(DOWNN);
  }


  // Show/Hide debug text
  if (key == ' ') {
    TEXT = !TEXT;
    BLOBS = TEXT;
    DRAW = TEXT;
  } // Draw/Don't draw blobs
  else if (key == 'z') {
    BLOBS = !BLOBS;
  } // Update/Don't update camera display
  else if (key == 'x') {
    DRAW = !DRAW;
  } // Activate/Deactivate matrix calibration
  else if (key == 'c') {
    matrix.calibrate();
  } // Activate/Deactivate TUIO communication
  else if (key == 'v') {
    comm.enable(!comm.enabled);
  }
  
}

