
/*
 * caneido 
 */

// --- count of parts in the kaleidoscope
// --- each 2 are mirrored
int _selectionParts = 8;
float _selectionAlpha = TWO_PI / _selectionParts;

// --- initial position of selction
int _selectionX;
int _selectionY;

// --- rotation of selection
float _selectionRotation = 0;

// --- radius of selection
int _radius;

// --- window has two modes: 'show selection' and 'show caleidoscope'
// --- mode can be toogled with space bar.
boolean _showSelection = true;

// --- the original source image
PImage _srcImage;

// --- selection source image
PImage _selectionImage;

// --- scale factor in percent
int _sourceScale = 100;

// --- debug flag, will generate some diagnostic messages
public static final boolean DEBUG = false;
public static final boolean IS_APPLET = true;

void setup() {

  int windowDim;
  	 
  // --- load source image
  if (IS_APPLET) {
    _srcImage = loadImage("caneido-in-applet.jpg");
    windowDim = 400;
    _selectionX = 90;
    _selectionY = 290;
  } else {
    _srcImage = loadImage("http://www.svenja-lohse.de/caneido/caneido-in.jpg");
    windowDim = (int)(0.9 * min(screen.width, screen.height));
    _selectionX = 130;
    _selectionY = 380;
  }
  
  if (_srcImage == null) { 
  	println("Fehler beim Laden der Datei 'caneido-in.jpg'");
  	exit();
  } 
  
  // --- window is max possible square
  _radius = windowDim / 2;

  // --- load image centered
  _selectionImage = scaleImage(_sourceScale);  

  size(windowDim, windowDim);
  smooth();
  noLoop();
} 

void draw() { 
  if (_srcImage == null) { 
    println("Fehler beim Anzeigen der Datei 'caneido-in.jpg'");
    exit();
  }

  if (_showSelection) {
    // --- draw image in each loop (TODO: in case selection was moved)
    image(_selectionImage, 0, 0);
    drawSelectionAngle();
  }
} 

void mouseDragged() {
  if (_showSelection) {
    if (mouseButton == LEFT) {
      moveSelection(pmouseX, pmouseY, mouseX, mouseY);
    } 
    else if (mouseButton == RIGHT) {
      rotateSelection(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

// --- create scaled image from source
PImage scaleImage(int scalePercent) {

  int windowDim = 2 * _radius;

  int scaledSrcWidth = min(_srcImage.width * scalePercent / 100, windowDim);
  float xFactor = (float)scaledSrcWidth / (float)_srcImage.width;
  int scaledSrcHeight = min(_srcImage.height * scalePercent / 100, windowDim);
  float yFactor = (float)scaledSrcHeight / (float)_srcImage.height;
  float factor = min(xFactor, yFactor);

  scaledSrcWidth = (int)(factor * _srcImage.width);
  scaledSrcHeight = (int)(factor * _srcImage.height);     
    
  int offsetX = (windowDim - scaledSrcWidth) / 2;
  int offsetY = (windowDim - scaledSrcHeight) / 2;
  
  PImage img = createImage(windowDim, windowDim, RGB);
  
  img.copy(
    _srcImage, 
    0, 0, 
    _srcImage.width, 
    _srcImage.height, 
    offsetX, offsetY, 
    scaledSrcWidth, 
    scaledSrcHeight);
    
  return img;
}

void drawSelectionAngle() {
  pushMatrix();
  translate(_selectionX, _selectionY);
  drawAxis(_selectionRotation, _radius);
  drawAxis(_selectionRotation + _selectionAlpha, _radius);
  popMatrix();
}

void drawAxis(float rad, int length) {
  int xDim = (int)(length * cos(rad));
  int yDim = (int)(length * sin(rad));
  stroke(255);
  line(0, 0, xDim, -yDim);
}

void moveSelection(int xFrom, int yFrom, int xTo, int yTo) {
  _selectionX -= xFrom - xTo;
  _selectionY -= yFrom - yTo;
  redraw();
}

void rotateSelection(int xFrom, int yFrom, int xTo, int yTo) {
  // --- rotate selection
  float palpha = atan2(yFrom - _selectionY, xFrom - _selectionX);
  float alpha = atan2(yTo - _selectionY, xTo - _selectionX);
  _selectionRotation += palpha - alpha;
  redraw();
}

void keyReleased() {
  if (' ' == key) {
    toggleMode();
  } 
  else if ('s' == key) {
  	save(buildFileName());
  }
  if (_showSelection) {
	  if ('+' == key) {
        incSelectionAlpha();
	  } 
	  else if ('-' == key) {
	  	decSelectionAlpha();
	  }
	  else if ('>' == key) {
	  	scaleUp();
	  }
	  else if ('<' == key) {
	  	scaleDown();
	  }
	  else {
	    if (DEBUG) println("key: >" + key + "<");
	  }
  }
}

void decSelectionAlpha() {
  // --- increment parts --> decrement angle 
  if (_selectionParts < 16) {
    _selectionParts += 2;
    if (DEBUG) println("decrement angle, " + _selectionParts + " parts");
    _selectionAlpha = TWO_PI / _selectionParts;
    redraw();
  } 
  else {
    if (DEBUG) println("decrement angle, reached limit of " + _selectionParts);
  }
}

void incSelectionAlpha() {
  // --- decrement parts --> increment angle 
  if (_selectionParts > 2) {
    _selectionParts -= 2;
    if (DEBUG) println("increment angle, " + _selectionParts + " parts");
    _selectionAlpha = TWO_PI / _selectionParts;
    redraw();
  } 
  else {
    if (DEBUG) println("increment angle, reached limit of " + _selectionParts);
  }
}

void scaleUp() {
  _sourceScale += 10;
  _selectionImage = scaleImage(_sourceScale);  
  redraw();
}

void scaleDown() {
  _sourceScale -= 10;
  _selectionImage = scaleImage(_sourceScale); 
  redraw();
}

void toggleMode() {
  if (DEBUG) println("toggle");
  // --- toggle between selection and kaleidoscope
  _showSelection = !_showSelection;
  if (!_showSelection) {
    setupKaleidoskope();
  } 
  redraw();
}

// --- it is very usefull to see the phases of processing while debugging.
// --- use _showImage to select the phase to be displayed.
static int IMG_ARC = 1;
static int IMG_SELARC = 2;
static int IMG_CENTERED = 3;
static int IMG_MIRRORED = 4;
static int IMG_KAL = 5;
int _showImage = IMG_KAL;

// --- PGraphics.arc has a bug: it rotates the arc -0.5 degrees.
float _arcCorrection = 0; //radians(0.5);
float _arcMargin = radians(0.5);

void setupKaleidoskope() {
  background(0);	

  // --- draw selection area as white arc to use it as mask
  PGraphics selectedMask = createGraphics(_selectionImage.width, _selectionImage.height, P2D);
  selectedMask.beginDraw();
  //selectedMask.smooth();
  if (DEBUG) println(
    "x:" + _selectionX 
    + ", y:" + _selectionY  
    + ", start:" + degrees(-_selectionAlpha - _selectionRotation)
    + ", stop:" + degrees(- _selectionRotation)
  );
  selectedMask.arc(
    _selectionX, _selectionY,
    2 * _radius, 2 * _radius, 
    -_selectionAlpha - _selectionRotation + _arcCorrection - _arcMargin, 
    - _selectionRotation + _arcCorrection + _arcMargin
  ); 
  selectedMask.endDraw();
  if (_showImage == IMG_ARC) image(selectedMask, 0, 0);

  // --- create copy of selection image and use mask
  PGraphics selectionImage = createGraphics(_selectionImage.width, _selectionImage.height, P2D);
  selectionImage.beginDraw();
  selectionImage.copy(
    _selectionImage, 
    0, 0, 
    _selectionImage.width, 
    _selectionImage.height, 
    0, 0,           
    _selectionImage.width, 
    _selectionImage.height);
  selectionImage.mask(selectedMask);
  selectionImage.endDraw();
  if (_showImage == IMG_SELARC) image(selectionImage, 0, 0);

  // --- create another copy and move image arc to position that can be rotated 
  if (DEBUG) println("parts: " + _selectionParts + ", radius: " + _radius + ", alpha: " + degrees(_selectionAlpha) );
  if (DEBUG) println("selX: " + _selectionX + ", " + _selectionY + ", selRotation: " + degrees(_selectionRotation) );
  int left = max(0, _selectionX - _radius);
  int right = min(_selectionImage.width, _selectionX + _radius);
  int top = max(0, _selectionY - _radius);
  int bottom = min(_selectionImage.height, _selectionY + _radius);
  if (DEBUG) println("left: " + left + ", right: " + right + ", top: " + top + ", bottom: " + bottom ); 
  
  PGraphics kalImage = createGraphics(_selectionImage.width, _selectionImage.height, P2D);
  kalImage.beginDraw(); 
  kalImage.copy(
    selectionImage, 
    left, top, 
    right - left, bottom - top,
    max(0, _radius - _selectionX), max(0, _radius - _selectionY), 
    right - left, bottom - top);
  kalImage.endDraw();
  if (_showImage == IMG_CENTERED) image(kalImage, 0, 0);
  
  // --- create mirror of selection image
  PGraphics mirrorImage = createGraphics(_selectionImage.width, _selectionImage.height, P2D);
  mirrorImage.beginDraw();
  mirrorImage.loadPixels();
  for (int y = 0; y < mirrorImage.height; y++) {
    for (int x = 0; x < mirrorImage.width; x++) {
      int sourceLocation = x + y * kalImage.width;
      int mirrorLocation = x + (kalImage.width - y - 1) * kalImage.width;
      mirrorImage.pixels[mirrorLocation] = kalImage.pixels[sourceLocation];
    }
  }
  mirrorImage.updatePixels();
  mirrorImage.endDraw();
  if (_showImage == IMG_MIRRORED) image(mirrorImage, 0, 0);

  // --- draw normal arc with positive rotation
  pushMatrix();
  translate(_radius, _radius);
  rotate(_selectionRotation);
  for (int i = 0; i < _selectionParts / 2; i++) {
    if (_showImage == IMG_KAL) image(kalImage, -_radius, -_radius);
    rotate(2 * _selectionAlpha);
  }
  popMatrix();

  // --- draw mirrored arc with negativ rotation
  pushMatrix();
  translate(_radius, _radius);
  rotate(-_selectionRotation);
  for (int i = 0; i < _selectionParts / 2; i++) {
    if (_showImage == IMG_KAL) image(mirrorImage, -_radius, -_radius);
    rotate(-2 * _selectionAlpha);
  }
  popMatrix();
}

String buildFileName() {
	String suffix;
	if (_showSelection) {
	  suffix ="-selection.jpg";
	} else {
	  suffix ="-kaleidoscope.jpg";
	}
	String fileName = "caneido-" + buildTimestamp() + suffix;
	if (DEBUG) println("saving " + fileName);
	return fileName;
}

// --- build a timestamp string with format YYYYMMDD-HHMMSS
String buildTimestamp() {
  int[] numbers = { month(), day(), hour(), minute(), second() };
  String s = str(year());
  for (int n = 0; n < numbers.length; n++) {
    if (n == 2) {
        s += "-";
    }
    int number = numbers[n];
    if (number < 10) {
      s += "0"; 
    }
    s += str(number);
  }     
  return s;
}

