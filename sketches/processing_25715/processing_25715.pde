
//import processing.opengl.*;
import peasy.*;
PeasyCam cam;

//Declare variables
float[]  dim = {240, 240, 137.5};
String[] lines;
int[]    streamline, pt;
int      nSL, maxPt;
float[]  x, y, z;
float[]  FA, meanFA, FA_SD;
float    FAmin = 0.1;
float    FAmax = 0.85;
color[]  lut;
PFont    font;
int      zmark = 1;
int      plotType   = 1;
int      showInfo   = -1;
int      plotSlices = 1;
String   info;
PImage   coronal, sagittal;

////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(640, 480, P3D);
  textMode(SCREEN);

  // Load resampled streamline data
  lines = loadStrings("CST_L.txt");
  streamline = new int[lines.length];
  pt         = new int[lines.length];
  x          = new float[lines.length];
  y          = new float[lines.length];
  z          = new float[lines.length];
  FA         = new float[lines.length];
  for (int i=1; i < lines.length; i++) {
    String[] pieces = split(lines[i], '\t');
    streamline[i] = int(pieces[0]);
    pt[i]         = int(pieces[1]);
    x[i]          = float(pieces[2]);
    y[i]          = float(pieces[3]);
    z[i]          = float(pieces[4]);
    FA[i]         = float(pieces[5]);
    if (FA[i] > FAmax) {
      FA[i] = FAmax;
    } else if (FA[i] < FAmin) {
      FA[i] = FAmin;
    }
  }
  maxPt = max(pt);
  nSL   = max(streamline);

  // Load along-tract data
  lines = loadStrings("trk_data.txt");
  meanFA = new float[lines.length];
  FA_SD  = new float[lines.length];
  for (int i=1; i < lines.length; i++) {
    String[] pieces = split(lines[i], '\t');
    meanFA[i] = float(pieces[4]);
    FA_SD[i]  = float(pieces[5]);
  }

  // Load MATLAB color look-up table
  lines = loadStrings("lut.txt");
  float[] lutR = new float[lines.length];
  float[] lutG = new float[lines.length];
  float[] lutB = new float[lines.length];
  for (int i=0; i < lines.length; i++) {
    String[] pieces = split(lines[i], ' ');
    lutR[i] = float(pieces[3]);
    lutG[i] = float(pieces[6]);
    lutB[i] = float(pieces[9]);
  }

  // Resample color table
  float i_lerp;
  int   i1;
  int   i2;
  float amt;
  lut = new color[maxPt];
  for (int i=0; i < maxPt; i++) {
    i_lerp = map(i, 0, maxPt-1, 0, lines.length-1);
    i1     = floor(i_lerp);
    i2     = ceil(i_lerp);
    amt    = i_lerp % i1;
    if (Float.isNaN(amt)) {
      amt = 0;
    }
    colorMode(RGB, 1, 1, 1);
    lut[i] = lerpColor(color(lutR[i1], lutG[i1], lutB[i1]),
    color(lutR[i2], lutG[i2], lutB[i2]), amt);
  }
  
  // Load slice images
  coronal  = loadImage("coronal.jpg");
  sagittal = loadImage("sagittal.jpg");

  // Load font
  font = loadFont("SansSerif-10.vlw");
  textFont(font);
  
  // Info text
  info = 
    "Mouse: Control view (click-drag to rotate, scrollwheel or right-click-drag to zoom, double click to reset)\n" + 
    "Up/Down: Change selected collection of vertices along tract\n" + 
    "Space: Toggle view between FA and correspondence mode\n" + 
    "b: Toggle brain slices\n" +
    "i: Toggle instructions";

  // Setup camera
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

////////////////////////////////////////////////////////////////////////////////
void draw() {
  // Setup background
  colorMode(RGB, 1);
  background(1);
  rotateX(PI/2);
  
  // Plot slices
  // (QUAD_STRIP needed to get correct perspective with P3D)
  if (plotSlices == 1) {
    // Coronal
    noStroke();
    pushMatrix();
    translate(-dim[0]/2, 1.25*(78-192/2-0.5), -dim[2]/2);
    beginShape(QUAD_STRIP);
    texture(coronal);
    for (int i=0; i<=192; i++) {
      vertex(1.25*i, 0, 0, i, 55);
      vertex(1.25*i, 0, 2.5*55, i, 0);
    }
    endShape();
    popMatrix();
    //Sagittal
    pushMatrix();
    translate(1.25*(95-192/2-0.5), -dim[1]/2, -dim[2]/2);
    beginShape(QUAD_STRIP);
    texture(sagittal);
    for (int i=0; i<=192; i++) {
      vertex(0, 1.25*i, 0, i, 55);
      vertex(0, 1.25*i, 2.5*55, i, 0);
    }
    endShape();
    popMatrix();
  }

  // Draw box
  noFill();
  stroke(0); 
  box(dim[0], dim[1], dim[2]);
  translate(-dim[0]/2, -dim[1]/2, -dim[2]/2);

  // Draw streamlines
  if (plotType == -1) { // FA mode
    colorMode(HSB, 1);
    beginShape();
    for (int i=1; i < x.length; i++) {
      if (streamline[i] == streamline[i-1]) {
        stroke((2/3.0)*(1 - (FA[i]-FAmin)/(FAmax-FAmin)), 1, 1);
        vertex(x[i], y[i], z[i]);
      } 
      else { // Start a new streamline
        endShape();
        beginShape();
        stroke((2/3.0)*(1 - (FA[i]-FAmin)/(FAmax-FAmin)), 1, 1);
        vertex(x[i], y[i], z[i]);
      }
    }
    endShape();
    colorMode(RGB, 1);
  } else if (plotType == 1) { // Correspondence mode
    beginShape();
    for (int i=1; i < x.length; i++) {
      if (streamline[i] == streamline[i-1]) {
        stroke(lut[pt[i]-1]);
        vertex(x[i], y[i], z[i]);
      } 
      else { // Start a new streamline
        endShape();
        beginShape();
        stroke(lut[pt[i]-1]);
        vertex(x[i], y[i], z[i]);
      }
    }
    endShape();
  }

  // Highlight selected cross-section
  stroke(0);
  for (int i=1; i < x.length; i++) {
    if (pt[i] == zmark) {
      pushMatrix();
      translate(x[i], y[i], z[i]);
      fill(0); 
      box(1); 
      noFill();
      popMatrix();
    }
  }

  // Get 2D equivalents of 3D axis label locations
  float[] labR = {screenX(0, dim[1]/2, dim[2]/2), screenY(0, dim[1]/2, dim[2]/2)};
  float[] labL = {screenX(dim[0], dim[1]/2, dim[2]/2), screenY(dim[0], dim[1]/2, dim[2]/2)};
  float[] labP = {screenX(dim[0]/2, 0, dim[2]/2), screenY(dim[0]/2, 0, dim[2]/2)};
  float[] labA = {screenX(dim[0]/2, dim[1], dim[2]/2), screenY(dim[0]/2, dim[1], dim[2]/2)}; 
  float[] labI = {screenX(dim[0]/2, dim[1]/2, 0), screenY(dim[0]/2, dim[1]/2, 0)};
  float[] labS = {screenX(dim[0]/2, dim[1]/2, dim[2]), screenY(dim[0]/2, dim[1]/2, dim[2])};

  // HUD
  cam.beginHUD();
    //Fake in axis labels
    fill(0);
    text("R", labR[0], labR[1]);
    text("L", labL[0], labL[1]);
    text("P", labP[0], labP[1]);
    text("A", labA[0], labA[1]);
    text("I", labI[0], labI[1]);
    text("S", labS[0], labS[1]);
    noFill();
  
    // Dataset info in topleft
    fill(0);
    String datainfo = 
      "Streamlines: " + nSL + "\n" +
      "Vertices: " + maxPt;
    text(datainfo, 1, 10);
    
    // Instructions in bottomright
    textAlign(RIGHT, BOTTOM);
    if (showInfo == 1) {
      text(info, width, height);
    } else if(showInfo == -1) {
      text("Press i for instructions", width, height);
    }
    textAlign(LEFT, BASELINE);
  
    // Setup bottomleft
    int originx = 10;
    int originy = 10;
    pushMatrix();
    translate(originx, height-originy);
  
    // Setup scale and draw box
    int boxwidth  = 200;
    int boxheight = 150;
    float ymin    = 0.1;
    float ymax    = 0.9;
    float scaleX  = boxwidth/(maxPt-1);
    float scaleY  = boxheight/abs(ymax-ymin);
    scale(scaleX, scaleY);
    fill(0.75, 0.4); stroke(0.5,1);
    rect(0, 0, maxPt-1, -(ymax-ymin)); 
    noFill(); noStroke();
  
    // Draw mean FA
    stroke(0); 
    noFill();
    beginShape();
    for (int i=1; i<=maxPt; i++) {
      vertex(i-1, -(meanFA[i]-ymin));
    }
    endShape();
  
    // Add in confidence band
    noStroke(); 
    fill(0.5, 0.3);
    beginShape();
    for (int i=1; i<=maxPt; i++) {
      vertex(i-1, -(meanFA[i]+FA_SD[i]-ymin));
    }
    for (int i=1; i<=maxPt; i++) {
      vertex(maxPt-i, -(meanFA[maxPt+1-i]-FA_SD[maxPt+1-i]-ymin));
    }
    endShape(CLOSE);
  
    // Vertical line to mark vertex #
    stroke(0); 
    line((zmark-1), 0, (zmark-1), -(ymax-ymin));
    popMatrix();
    
    // Display vertex #
    fill(0.25);
    text("Vertex: " + zmark, originx+1, height-originy-1);
    
  cam.endHUD();
  
    // Look for keypress
  if (keyPressed == true) {
    if ((zmark < maxPt) && (keyCode == UP)) {
      zmark++;
    } 
    else if ((zmark > 1) && (keyCode == DOWN)) {
      zmark--;
    }
  }
}

void keyReleased() {
  if (key == ' ') {
    plotType = -plotType;
  }
  if (key == 'i') {
    showInfo = -showInfo;
  }
  if (key == 'b') {
    plotSlices = -plotSlices;
  }
}

