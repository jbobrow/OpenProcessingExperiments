
/***********************************
 * growify by qgi                  *
 * A dynamic image effect          *
 * and my first processing sketch  *
 ***********************************/
import processing.video.*;


/* Parameters */
final int FRAGMENT_SIZE =40;
final int LOOPS_PER_FRAME = 1000;

/* Class variables */
boolean cameraMode = false;
boolean cameraModeAvailable;
PImage img;
int frameCounter = 1;
int imgStartX;
int imgStartY;
int imgWidth;
int imgHeight;
float scaleFactor;

/* CAM specific parameters */
final int CAM_WIDTH = 320;
final int CAM_HEIGHT = 240;
Capture capture;

/* URL specific parameters */
final int FRAMES_PER_IMG = 100;
final int NUM_IMAGES = 6;
int currentImage = 0;
PImage[] images = new PImage[NUM_IMAGES];

void setup()
{
  /* Camera mode is only available when there are capturing devices available */
  cameraModeAvailable = (Capture.list().length)>0;
  
  size(screen.width, screen.height);
  smooth();  
  noStroke();

  background(0);  
  initMode();
}

void initMode()
{
  /* Initialize capture object */
  if (cameraMode)
  {
    capture = new Capture(this,CAM_WIDTH,CAM_HEIGHT,10);
  }
  else
  /* Initialize image array */
  {
    /* Load random images from the internet into an array */
    for (int i=0; i<NUM_IMAGES;i++)
      images[i] = loadImage("http://lorempixum.com/800/600/","jpg");
  }
  initImage();
}

void draw()
{ 
  if (!cameraMode && (frameCounter%FRAMES_PER_IMG==0))
  {
    currentImage++;
    if (currentImage>=NUM_IMAGES)
      currentImage = 0;
    initImage();
  }
  
  for (int i=0;i<LOOPS_PER_FRAME;i++)
  {
    /* Get a random fragment somewhere in the image */
    int x = (int) random(0, imgWidth+1) + imgStartX;
    int y = (int) random(0, imgHeight+1) + imgStartY;

    /* Draw it in the average color of the underlying picture*/
    fill(getAverageColor(x,y,FRAGMENT_SIZE, FRAGMENT_SIZE));  
    drawShape(x,y,FRAGMENT_SIZE,FRAGMENT_SIZE);
  }
  
  frameCounter++;
}

/* Calculates offsets and scaling so the image is stretched to the window while preserving the aspect ratio */
void initImage()
{ 
  if (cameraMode)
  {
    capture.read();
    img = capture;
  }
  else
  {
    img = images[currentImage];
  }

  /* These calculations are done once per image to support changing image sizes */
  float scaleFactorX = (float) img.width / (float) width;
  float scaleFactorY = (float) img.height / (float) height;
  
  /* Calculate scale factor (strech the image, but keep the aspect ratio) */
  if (scaleFactorX<scaleFactorY)
    scaleFactor = scaleFactorY;
  else
    scaleFactor = scaleFactorX;

  imgWidth = (int) (img.width / scaleFactor);
  imgHeight = (int) (img.height / scaleFactor);
  
  /* Calculate the image offset (center the image) */
  imgStartX = (int) ((width-imgWidth)/2.0f);
  imgStartY = (int) ((height-imgHeight)/2.0f);
  
  img.loadPixels();
}

/* When a new frame becomes available, load it */
void captureEvent(Capture capture)
{
  initImage();
}

void keyPressed()
{
  /* If camera mode is available and were not in it, switch it on */
  if (cameraModeAvailable && !cameraMode)
  {
    cameraMode = true;
    initMode();
  }
}

/* Retrieves the average color of the pixels in range x0,y0,x0+w,y0+h */
color getAverageColor(int x0, int y0, int w, int h)
{
  int r=0;
  int g=0;
  int b=0;
  
  /* Scale the coordinates back to image coordinates */
  x0 = (int) ( (x0-imgStartX) * scaleFactor);
  y0 = (int) ( (y0-imgStartY) * scaleFactor);
  w = (int) (w * scaleFactor);
  h = (int) (h * scaleFactor);
  
  /* Calculate the actual bottom right point of the image section */ 
  int x1 = x0 + w;
  if (x1>img.width)  /* Prevent access to pixels outside the image */
    x1 = img.width;

  int y1 = y0 + h;
  if (y1>img.height) /* Prevent access to pixels outside the image */
    y1 = img.height;
  
  int numPix = w*h;
  /* Avoid a division by zero later on, plus save unnecessary loops */
  if (numPix<1)
    return color(0);
  
  /* Sum R/G/B for all pixels in the given segment */ 
  for (int x=x0; x<x1; x++)
  {
    for (int y=y0; y<y1; y++)
    {
      int pos = x+y*img.width;
      r += (int) red(img.pixels[pos]);
      g += (int) green(img.pixels[pos]);
      b += (int) blue(img.pixels[pos]);
    }
  }
  /* Calculate the average */
  return color((r/numPix), (g/numPix), (b/numPix));  
}

/* draws a random bezier shape in the segment (x0,y0,w,h) */
void drawShape(int x0, int y0, int w, int h)
{
  beginShape();
  int x = x0+ (int) random(w+1);
  int y = y0 + (int) random(h+1);
  
  vertex(x,y);
  int cpx1 = x0 + (int) random(w+1);
  int cpy1 = y0 + (int) random(h+1);
  int cpx2 = x0 + (int) random(w+1);
  int cpy2 = y0 + (int) random(h+1);
  x = x0+ (int) random(w+1);
  y = y0 + (int) random(h+1);
  bezierVertex(cpx1,cpy1,cpx2,cpy2,x,y);
  
  endShape();
}

