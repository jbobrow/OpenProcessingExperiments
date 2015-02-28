
/**
 * Mirror Positioning Calc (v1.13)
 * by GoToLoop (2014/Mar)
 *
 * forum.processing.org/two/discussion/3439/
 * how-to-do-flip-canvas-horizontal-to-an-image-and-save
 *
 * forum.processing.org/two/discussion/3548/
 * loading-image-from-url-lags-in-js
 *
 * www.openprocessing.org/sketch/139280
 */

static final String URL  = "http://" + "upload.wikimedia.org" + 
"/wikipedia/commons/thumb/5/59/" + "Processing_Logo_Clipped.svg/";
static final String NAME = "256px-Processing_Logo_Clipped.svg.png";

static final int NUM = 4;
final PVector[] sigs = new PVector[NUM];

static final int X = 150, Y = 50;

PImage img;

void setup() {
  size(600, 400, JAVA2D);
  frameRate(.25);
  smooth(4);
  imageMode(CORNER);
  background(0200);

  if (online)  img = requestImage(URL + NAME);
  else         img = loadImage(URL + NAME);

  //img = requestImage(NAME);

  sigs[0] = new PVector(-1, -1);
  sigs[1] = new PVector(1, 1);
  sigs[2] = new PVector(1, -1);
  sigs[3] = new PVector(-1, 1);
}

void draw() {
  if (img.width == 0)  return;

  final int idx  = frameCount % NUM;
  final int sigX = (int) sigs[idx].x, sigY = (int) sigs[idx].y;

  if (!online)  frame.setTitle("sigX = " + sigX + "\tsigY = " + sigY);

  rotate(QUARTER_PI/4);
  scale(sigX, sigY);
  //img.mask(img);

  image(img, X*sigX + img.width*(sigX>>1), Y*sigY + img.height*(sigY>>1));
}
