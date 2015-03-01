
//
// This program allows the user to experiment the conscious distortion
// of an image, by clicking and dragging on it. It also includes a
// couple of other features: a help page (keyboard “H”), the Artist’s
// statement page (keyboard “S”), the possibility to reset the image
// after distortion (keyboard “R”), and the possibility to show or hide
// the grid (keyboard “G”) that was used to partition the image in
// rectangular segments (that was done prior to program execution). 
// On start, the image appears gradually, and then, the welcome
// statement disappears
// 


// Define global variables for all image parts
// The original photo has been cut in numPhotoX x numPhotoY rectangular parts
// viewNo keeps track of which view (0=normal, 1= Artist's statement,
// 2=help page) to show on the canvas
//
int numPhotoX = 8;
int numPhotoY = 6;
int numPhoto = numPhotoX*numPhotoY;
PImage[] photo = new PImage[numPhoto];
float[] coordX0 = new float[numPhoto];
float[] coordY0 = new float[numPhoto];
float[] coordX1 = new float[numPhoto];
float[] coordY1 = new float[numPhoto];
boolean showGrid = false;
//
// Text variables
PFont welcomeFont, titleFont, noteFont, statementFont, helpFont;
int viewNo = 0;
int introTint = 255;
String[] artistStatement;
int statementLnNumber;
//

// =====
// Setup block
//
void setup(){
// Define canvas size, background and image mode
  size(816, 612);
  background(0);
  imageMode(CORNERS);
// Load image parts and define baseline coordinates for display
  for (int i = 0; i < numPhoto; i++){
    photo[i] = loadImage("Flower"+str(i)+".jpg") ;
  }
  initCoord();
// Load fonts and Artist's statement
  welcomeFont = loadFont("ArialMT-36.vlw");
  titleFont = loadFont("BookAntiqua-BoldItalic-60.vlw");
  noteFont = loadFont("Arial-BoldItalicMT-24.vlw");
  statementFont = loadFont("Vijaya-Bold-36.vlw");
  helpFont = loadFont("ArialMT-36.vlw");
  artistStatement = loadStrings("Statement.txt");
  statementLnNumber = artistStatement.length;
}

// ==========
// Draw block
//
void draw() {
//
// Show all the parts of image with a tint if not in the "play" mode
//
  
  if (introTint > 0) { tint(255-introTint); }  else { noTint(); }
  if (viewNo > 0) { tint(140); }

  for (int i = 0; i < numPhoto; i++){
    image(photo[i],coordX0[i],coordY0[i],coordX1[i],coordY1[i]);
  }
//
// Display grid if requested
//
  if (showGrid) {
    rectMode(CORNERS);
    noFill();
    for (int i = 0; i < numPhoto; i++){
      rect(coordX0[i],coordY0[i],coordX1[i],coordY1[i]);
    }
  }
 
 // Display Intro Text or Artist Statement if required
 //
  if (viewNo > 0) {
    fill(#FFF393);
    textAlign(CENTER);
    textFont(titleFont);
    text("Distort your perceptions", width/2, 70);
    textFont(statementFont);
    textAlign(LEFT);
    if (viewNo == 1) {  // Artist statement
      for (int i = 0; i < statementLnNumber; i++) {
        text(artistStatement[i], 100, 150+25*i);
      }
    }  
    else if (viewNo == 2)  {  // Help page
      text("This is the help page (accessed by pressing <H>)",100,150);
      text("Click and hold and move the mouse", 100, 200);
      text("to distort the image",100, 225);
      text("Press <S> to view Artist's statement", 100, 275);
      text("Press <R> to reset image", 100, 300);
      text("Press <G> to show/hide grid", 100, 325);
    }
    textFont(noteFont);
    text("Press <ENTER> to run", width/2, height-10);
    introTint = 0;
  }  
  else if (introTint > 0) {
    fill(#FFFF52, min(255,4*introTint));
    textFont(welcomeFont);
    textAlign(CENTER);
    text("Welcome to", width/2, height/3);
    textFont(titleFont);
    text("Distort your perceptions", width/2, height/2);
    textFont(noteFont);
    text("Press <H> for help", width/2, height-5);
    introTint=introTint-2;
    if (introTint <= 0) noTint();
  }
 
}

// ==========
// If mouse is moved while holding a button (mouseDragged)
// Apply deformation to the image
//
void mouseDragged() {
//
// Obtain the new X and Y positions of the grid using function newCorners
//
  float[] listX = new float[numPhotoX];
  float[] listY = new float[numPhotoY];
  listX = newCorners('X');
  listY = newCorners('Y');
//
// Set the coordinates values to new grid
//
  for (int i = 0; i < numPhoto; i++){
    coordX0[i] = listX[i%numPhotoX] ;
    coordY0[i] = listY[floor(i/numPhotoX)] ;
    coordX1[i] = listX[i%numPhotoX+1] ;
    coordY1[i] = listY[floor(i/numPhotoX)+1] ;

  }
}

// ==========
// Keyboard commands
//
void keyPressed() {
  // Display Statement dand Help
  if (key=='s' || key=='S') {viewNo=1;}
  if (key==RETURN || key==ENTER) {viewNo=0;}
  if (key=='h' || key=='H') {viewNo=2;}
  if (key=='r' || key=='R') {initCoord();}
  if (key=='g' || key=='G') {showGrid=!showGrid;}
}

// ==========
// Function initCoord
// Sets (or resets) display coordinates to original un-deformed image
//
void initCoord() {
  for (int i = 0; i < numPhoto; i++){
    coordX0[i] = float((i % numPhotoX)*width/numPhotoX) ;
    coordY0[i] = float(floor(i / numPhotoX)*height/numPhotoY) ;
    coordX1[i] = coordX0[i]+float(width)/numPhotoX ;
    coordY1[i] = coordY0[i]+float(height)/numPhotoY ;

  }
}

// ==========
// Function newCorners
// Input : 'X' or 'Y' depending on which axis the new corner position of individual
//    sub-images are to be displayed
// Output : vector (sequence) with the new positions
//
float[] newCorners(char axis) {
//
// Initialize variables depending on the avis (X or Y) on which the calculation is done
// Constraining mouse values to avoid problems
//  
  int vectDimension;
  float actualMsPos, previousMsPos, maxDim;
  if (axis == 'X') {
    vectDimension = numPhotoX+1;
    actualMsPos = constrain(mouseX, numPhotoX, width-numPhotoX);
    previousMsPos = constrain(pmouseX, numPhotoX, width-numPhotoX);
    maxDim = width;
  } else {
    vectDimension = numPhotoY+1;
    actualMsPos = constrain(mouseY, numPhotoY, height-numPhotoY);
    previousMsPos = constrain(pmouseY, numPhotoY, height-numPhotoY);
    maxDim = height;
  }
  float msMvt = actualMsPos-previousMsPos;
  float correctVal = 4;  // empirical factor to correct for jamming sections
//
// define output vector (sequence) and populate with initial values
//
  float[] sequence = new float[vectDimension];
  sequence[0] = 0.;  
  if (axis == 'X') {
    for (int i=1 ; i<vectDimension-1 ; i++)  {
      sequence[i] = coordX0[i];
    }
  } else {
    for (int i=1 ; i<vectDimension-1 ; i++)  {
      sequence[i] = coordY0[i*numPhotoX];
    }
  }
  sequence[vectDimension-1] = maxDim;  

//
// compute initial relative displacements based on position of corner between border and mouse
//
  float[] displace = new float[vectDimension];
  displace[0] = 0.0;
  displace[vectDimension-1] = 0.0;
  for (int i=1 ; i<vectDimension-1 ; i++)  {
    if (sequence[i] <= previousMsPos) {
      displace[i] = sequence[i]/previousMsPos;
    } else {
      displace[i] = (maxDim-sequence[i])/(maxDim-previousMsPos);
    }
  }  
//
// Calculate proposed displacements introducing some non-linearity (sin)
// and increasing the relative spacing of tightly collapsed image parts
// Then, apply the displacement
//

  for (int i=1 ; i<vectDimension-1 ; i++)  {    
    if (msMvt*(sequence[i]-i*maxDim/(vectDimension-1)) < 0) {
      displace[i] = displace[i]+(sequence[i]/maxDim-i/(vectDimension-1))*correctVal;
    }
    displace[i] = msMvt * displace[i];
    sequence[i] = sequence[i] + displace[i];
  }

//
// Rectify any remaining ordering problem and maintain minimum size of sub-images
//
  sequence[0] = 0.;  // always start at the edge of canvas
  sequence[vectDimension-1] = maxDim;   // always stop at the edge of canvas
  for (int i=0 ; i<vectDimension-1 ; i++)  {
    sequence[i] = max(sequence[i],2*i) ;  // maintain a minimum edge
    sequence[i] = min(sequence[i],maxDim-2*(vectDimension-(i+1)));
  }
  for (int i=0 ; i<vectDimension-2 ; i++)  {    
    if (sequence[i+1]-2 < sequence[i] ) {     // Forward
      sequence[i+1] = sequence[i]+2;
    }
    if ((sequence[vectDimension-(i+1)]-2) < sequence[vectDimension-(i+2)] ) {  // Backward
      sequence[vectDimension-(i+2)] = sequence[vectDimension-(i+1)]-2;
    }
  }  
 
  return sequence;
}

