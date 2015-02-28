
import ddf.minim.*;

Minim minim;
AudioPlayer additionalSound;

// Julia Art  Julia set sketch
//
// I wanted to make the art that could realize the beauty of the Julia set.
// 
// Point1
//  User can find out various Julia sets by simple operation.
//  1) Julia's two initial values are mapped x, y location
//  2) By mouse drag operation, user can find out convergence point and change of shape.
//  3) Guide for convergence point
// Point2
//  User can make art with Julia set by simple operation.
//  1) Because a color(hue) changes automatically, you should release a button at the time of favorite color.
//  2) select 3 Saturation (low, middle, max) by key
//  3) select 4 size (large midium, small, extra small) by key
//  4) select afterImage when mouse dragged (clear, half brightness, remain)
//
//
//Operations
// Julia's initial value (real, imaginary) are mapped x, y
// When mouse(left button) is pushed, julia set is draw at this point using this initial value
//
// Mouse: push left button and drag : draw julia and change color (slowly)
// mouse button release when your favorite shape and color
// Key 1-4 size  1:large   2:middle  3:small  4:extra small
// key 5-7 saturation  5:low  6: middle  7: max
// key 8-0 afterImage (when mouse drag)  8: remain  9:harf brightness  0:clear
// key c or C or delete or backspace  : clear screen
// key s or S : save screen
// key g-G: Guide of convergence  G: Guide off G: Guide on  (clear screen)
//
// calculation for julia set spends cpu power.
// It is necessary to perform the mouse operation slowly.
// There are many points which do not converge, then julia set can not draw at these points.
// Please drag or push another location

// Variables
// julia initial value

float juliaReal= -0.30;
float juliaImaginary= -0.65;
float oldReal= -0.30;
float oldImaginary = -0.65;
boolean afterImageFlag = false;
float osx = -2.3;
float osy = -1.2;
float osdx = 4.0;
float osdy = 2.4;
float sx = osx;
float sy = osy;
float sdx = osdx;
float sdy = osdy;
float oldX;
float oldY;
int myHue = 0;
float offsetX;
float offsetY;
int plotTh = 40;
int colTim = 5;
int addHue = 8;
int sat = 255;
float afterImage = 0.0;
int juliaSizeDiv = 1;

int mandelDrawMode = 1;

PImage mandel;

// setup function
void setup() {
/* @pjs preload="mandel.png"; */
  minim = new Minim(this);
  additionalSound = minim.loadFile("Additional.mp3");
  additionalSound.loop();

//  additionalPushSound = minim.loadSample("bell01.wav");
  
  
  size(1280, 720);
  colorMode(HSB, 360, 255, 255);
  background(0, 0, 0);
  mandel = loadImage("mandel.png");  
  offsetX = width * 2.3 / 4 / juliaSizeDiv;
  offsetY = height / 2 / juliaSizeDiv;
}

// draw function
void draw() {
  if (mandelDrawMode == 1) {
    image(mandel, 0, 0, 1280, 720);
    mandelDrawMode = 2;
  }
  if (mousePressed) {
    juliaReal = sx + sdx * mouseX / width;
    juliaImaginary = sy + sdy * mouseY / height;
	
//	if (afterImageFlag == false) {
//	   additionalPushSound.trigger();
//	}
    if (afterImageFlag == true && afterImage != 1.0
        && (oldReal != juliaReal || oldImaginary != juliaImaginary)) {        
       julia(oldX, oldY, sx, sy, sdx, sdy, width/juliaSizeDiv, height/juliaSizeDiv, oldReal, oldImaginary, afterImage);
    }
    oldX = mouseX;
    oldY = mouseY;
    afterImageFlag = true;
    oldReal = juliaReal;
    oldImaginary = juliaImaginary;
    julia(mouseX, mouseY, sx, sy, sdx, sdy, width/juliaSizeDiv, height/juliaSizeDiv, juliaReal, juliaImaginary, 1.0);
    myHue += addHue;
    if (myHue > 360)
      myHue -= 360;
  }

  if (keyPressed) {
    if (key == 'c' || key == 'C' || key == DELETE || key == BACKSPACE) {
      background(0);
      if (mandelDrawMode == 2)
         mandelDrawMode = 1;
    }
    if (key == 's' || key == 'S') saveFrame("screenshot.png");
    if (key == '1') {
      setSizeDiv(1);
      plotTh = 40;
      colTim = 5;
      addHue = 8;
    }
    if (key == '2') {
      setSizeDiv(2);
      plotTh = 30;
      colTim = 5;
      addHue = 6;
    }
    if (key == '3') {
      setSizeDiv(4);
      plotTh = 20;
      colTim = 6;
      addHue = 4;
    }
    if (key == '4') {
      setSizeDiv(8);
      plotTh = 7;
      colTim = 12;
      addHue = 1;
    }
    if (key == '5') sat = 40;
    if (key == '6') sat = 128;
    if (key == '7') sat = 255;
    if (key == '8') afterImage = 1.0;
    if (key == '9') afterImage = 0.5;
    if (key == '0') afterImage = 0.0;
    if (key == 'g') {
      background(0);
      mandelDrawMode = 0;
    }
    if (key == 'G') {
      background(0);
      mandelDrawMode = 1;
    }
  }
}

// Size Setting function
void setSizeDiv(int d) {
  juliaSizeDiv = d;
  offsetX = width * 2.3 / 4 / juliaSizeDiv;
  offsetY = height / 2 / juliaSizeDiv;
}

// after image off
void mouseReleased() {
  afterImageFlag = false;
}

// calculate Julia set 
void julia(float mx, float my, float rl, float im, float rw, float ih, int dx, int dy, float jrl, float jim, float kbri) {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int c = juliaCore(rl+ rw*float(x)/float(dx), im + ih*float(y)/float(dy), 64, jrl, jim);

      if (c > plotTh) {
        c *= colTim;
        if (c > 255) c = 255;
        stroke(myHue, sat, c*kbri);
        point(x+mx-offsetX,y+my-offsetY);
      }
    }
  }
}

// calculate convergency
int juliaCore(float rl, float im, int ct, float jrl, float jim) {
  float rr;
    
  for (int i = 0; i < ct; i++) {
    rr = rl * rl - im * im + jrl;
    im = 2 * rl * im + jim;
    rl = rr;
    if (rl*rl+im*im > 4)
      return(i);
  }
  return(0);
}



