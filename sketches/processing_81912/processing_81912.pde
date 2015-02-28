

/* 
 * Scan viewer (JGC, version 3).
 *
 * Description: Reads and draws scans obtained with the Kinect 3D scanner.
 *   http://www.openprocessing.org/sketch/78606
 * 
 * Controls:
 *   - Use the mouse to rotate the scan
 *   - Use "Up" and "Down" arrows to zoom
 *   - Use "Left" and "Right" arrows to decrease/increase the scan resolution
 *   - 'p' switchs between the mesh view and the pixels view
 *   - 'l' switchs between the mesh view and the lines view
 *   - "+" and "-" increase/decrease the pixel size (only in pixel view)
 *   - 'Space' creates some psychedelic effects (only in mesh view) 
 */

import controlP5.*;

String[] files = {"diego-6.points","diego-8.points","rocco-3.points","rocco-6.points"};
ScanContainer[] scans = new ScanContainer[files.length];
ScanContainer scan, backSide;
ScanMask sMask;
ScanModifier sModifier;
String maskType = "cursor";
int currentScan = 0;
int resolution = 1;
int pixelSize = 1;
float offsetDist = 0.1; 
boolean asPixels = false;
boolean asLines = false;
boolean psychedelic = false;

ControlP5 cp5;
PImage fakeFloor;

float zoom = 1;
float rotX = PI;
float rotY = 0;

void setup(){
  size(700,550,P3D);
  
  // Read the scans
  for(int i = 0; i < scans.length; i++){
    ScanContainer s = new ScanContainer(files[i]);
    s = s.reduceResolution(resolution);
    s.fillHoles();
    s = s.gaussianSmooth(3);
    scans[i] = s;
  }
 
  // Start with the first scan as default 
  currentScan = 0;
  scan = new ScanContainer(scans[currentScan]);
  //scan.constrainPoints(-1500,100,-1000,1500,-1000,1500);
  backSide = scan.offsetScan(offsetDist);
  //sMask = createMask(scan,maskType);
  //sModifier = new ConvolveModifier(scan,20);
  
  // Create an image to represent the floor
  fakeFloor = createFloor(color(200));

  // Initialize ControlP5
  controlPanel();
}

void draw(){
  background(200);
  
  // Draw the floor image in an inclined plane
  noStroke();
  beginShape();
    texture(fakeFloor);
    vertex(-width,0.75*height,-300,0,0);
    vertex(2*width,0.75*height,-300,width,0);
    vertex(width,height,0,width,height);
    vertex(0,height,0,0,height);
  endShape();

  // Draw the control panel
  cp5.draw();

  // Position the scene
  translate(width/2,height/2,0);
  rotateX(rotX);
  rotateY(rotY);
  scale(zoom);
  
  //sMask.update(frameCount);
  //sModifier.update();
  //scan = sModifier.returnModifiedScan();
  
  // Draw the scan
  if(asPixels){
    scan.drawAsPixels(pixelSize);
  }
  else if(asLines){
    scan.drawAsLines();
  }
  else if(psychedelic){
    scan.drawAsPsyTriangles();
    lights();
    backSide.drawAsTriangles();
  }
  else{
    //scan.drawAsTriangles(sMask.getMask());
    //directionalLight(255,255,255, 0, -1, 1);
    //ambientLight(102, 102, 102);
    scan.drawAsTriangles();
    noLights();
    lights();
    //backSide.drawAsTriangles(sMask.getMask());
    backSide.drawAsTriangles();
  }
}


