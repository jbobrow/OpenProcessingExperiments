
/* Fractal Drawer 
  Version 1.0, programmed by Jill Jackson
  
  No copyright or whatever, reuse my code!
  
  click and drag to zoom in on a particular location
  Left click somewhere to center the screen there
  Right click to go back to your previous zoom screen
  
  press =/- to zoom in/out (yes that's an equal sign)
  up/down/left/right to move the screen by small amounts
  
  NOTE: I've programmed this in such a way that it'd be easy to replace the Mandelbrot Set with different fractals. Experiment around
        with different things, I even went so far as to make a grapher that can graph things such as x*x - cos(y) = 3 and the like
*/


double xMin, xMax, xCamDif, xIncr;
int xDecPrec;
double yMin, yMax, yCamDif, yIncr;
int yDecPrec;
PFont f;
PImage render;
boolean aboutToRender = false;

float camZoom = 10; //zoom ratio
Stack xMinStack, xMaxStack, yMinStack, yMaxStack;
ImgStack renderStack;

double sizeRatio;
int iter;
double iCam = 2.5; //initial zoom
int xalign = LEFT;
int yalign = TOP;

void setup() {
  size(500, 500);
  sizeRatio = (double)width/height;
  render = createImage(width, height, RGB);
  xMinStack = new Stack();
  xMaxStack = new Stack();
  yMinStack = new Stack();
  yMaxStack = new Stack();
  renderStack = new ImgStack();
  textFont(loadFont("AbadiMT-CondensedExtraBold-20.vlw"));
  textMode(SCREEN);
  resetCam();
}

int colorFor(double a) {
  return color( (float)(196+(Math.cos(6.4*a/25)*128)*(1-128.0/255)), (float)(64+64+(Math.cos(6.4*a/12.5)*64)*(1-196/255)), (float)(64+196*Math.sin(a/100)) );
}

void draw() {
  image(render, 0, 0);
  int rgb = get(mouseX, mouseY);
  int r = (rgb & 0xFF0000) >> 16;
  int g = (rgb & 0x00FF00) >> 8;
  int b = (rgb & 0x0000FF);
  fill(color((255-r)*1.5, (255-g)*1.5, (255-b)*1.5));
  if(dragged) {
    text(round(xIncr*Math.abs(mouseX-xPressed), xDecPrec)+", "+round(yIncr*Math.abs(mouseY-yPressed), yDecPrec)+" ("+(int)(mouseX-xPressed)+", "+(int)(mouseY-yPressed)+")", mouseX, mouseY);
    rectMode(CORNERS);
    noFill();
    stroke(color(175, 200, 75));
    rect((float)xPressed, (float)yPressed, (float)mouseX, (float)mouseY);
  }
  else {
    text(round(xCoord(mouseX), xDecPrec)+", "+round(yCoord(mouseY), yDecPrec), mouseX, mouseY);
  }
}

void resetCam() {
  setCam(-iCam, iCam, -iCam, iCam);
}

void setCam(double xmi, double xma, double ymi, double yma) {
  if(xma-xmi <= 0 | yma-ymi <= 0) return;
  xMinStack.push(xMin);
  xMaxStack.push(xMax);
  yMinStack.push(yMin);
  yMaxStack.push(yMax);
  PImage temp = createImage(width, height, RGB);
  temp.copy(render, 0, 0, width, height, 0, 0, width, height);
  renderStack.push(temp);
  double dif = (xma-xmi)/sizeRatio/2;
  double midY = (yma+ymi)/2;
  setCamBoundaries(xmi, xma, midY - dif, midY + dif);
}

void setCamBoundaries(double xmi, double xma, double ymi, double yma) {
  setCamBoundaries(xmi, xma, ymi, yma, true);
}

void setCamBoundaries(double xmi, double xma, double ymi, double yma, boolean autoRender) {
  xMin = xmi;
  xMax = xma;
  xCamDif = (xMax-xMin);
  xIncr = xCamDif/width;
  xDecPrec = (int)Math.log10(1 / xCamDif ) + 2;

  yMin = ymi;
  yMax = yma;
  yCamDif = (yMax-yMin);
  yIncr = yCamDif/height;
  yDecPrec = (int)Math.log10( 1 / yCamDif ) + 2;

  if(autoRender)
    render();
}


//int renderCount = 0; //trying to optimize, not working though
double x, y;
void render() {
//  int thisCount = ++renderCount;
//  println("("+xMin+", "+xMax+"), ("+yMin+", "+yMax+")");
  image(render, 0, 0);
  if(aboutToRender) {
    fill(color(255));
    textAlign(LEFT, BOTTOM);
    text("Rendering...", 0, 0);
    textAlign(xalign, yalign);
    aboutToRender = false;
    return;
  }
  render.loadPixels();
  for(x = xMin+xIncr/2; x < xMax; x += xIncr) {
    for(y = yMin+yIncr/2; y < yMax; y += yIncr) {
      solveFor(x, y);
//      if(thisCount != renderCount) { println("broke from render "+thisCount); return; }
    }
  }
  render.updatePixels();
//  println("Finished render "+thisCount+" -- renderCount is now on "+renderCount);
}


String save() { //don't know if this will work online, but 
  background(color(204));
  image(render, 0, 0);
  String s = "img";
  GregorianCalendar gc = new GregorianCalendar(Locale.US);
  int m = gc.get(gc.MONTH)+1;
  if(m < 10) s += "0";
  s += String.valueOf(m);

  int d = gc.get(gc.DAY_OF_MONTH);
  if(d < 10) s += "0";
  s += String.valueOf(d)+String.valueOf(gc.get(gc.YEAR))+".jpg";
  save(s);
  return s;
}

void setPixAt(double x, double y, int c) {
  try {
    render.pixels[yNot(y)*width+xNot(x)] = c;
  }
  catch(ArrayIndexOutOfBoundsException e) {
    println("Error: "+x+", "+y+" ("+xNot(x)+", "+yNot(y)+")");
    e.printStackTrace();
  }
}

//void setPixCoordAt(int x, int y, int c) {
//  tempPixelHolder[y*width+x] = c;
//}
//
//int getPixCoordAt(int x, int y) {
//  if(x < 0 | x > width | y < 0 | y > height) return 0;
//  return tempPixelHolder[y*width+x];
//}
//
//int getPixCoordAt(double x, double y) {
//  return getPixCoordAt(round(x, 0), round(y, 0));
//}

double round(double val, int digit) {
  return Math.floor(val * Math.pow(10, digit) + .5)/Math.pow(10, digit);
}

int xNot(double x) {
  return (int)((x-xMin)/xIncr);
}

int yNot(double y) {
  return (int)((y-yMin)/yIncr);
}

double xCoord(double x) {
  return x*xIncr+xMin;
}

double yCoord(double y) {
  return y*yIncr+yMin;
}

