
/******************************************************************************
 This Processing sketch has been auto-generated by the MoinMoin MathVision
 plugin or standalone HTML sand box.
 (http://ten.homelinux.net/productivity/MathVision).


 It combines user-crafted specific code, the formula (see the comment
 /// Start of user formula
 below), as well as rendering code (the MathVision application).

 Credits:
 - Processing, see http://processingjs.org/
 - MathVision (C) by Pascal Bauermeister.
 - User formula (C) by its author.

 MathVision is inspired by and dedicated to the Amiga MathVISION
 software, see http://home.olympus.net/~7seas/ 
 *****************************************************************************/

/////////////////// Defaults
color rgb(x, y) {
  int r = ((x*255*3)/X_SPAN) % 256;
  int g = ((y*255*3)/Y_SPAN) % 256;
  int b = 256*(y*X_SPAN+x)/(X_SPAN*Y_SPAN);
  return color(r, g, b);
}

int AUTO = -1; // constant

int WIDTH = 640;
float RATIO = 4/3;
int HEIGHT = 0;
int FRAMES = 0;

float X_MIN = 0;
float X_MAX = 1;

float Y_MIN = 0;
float Y_MAX = 1/RATIO;


bool preDraw(t) { return true; }
void postDraw(t) { }
void preSetup() { }

float TIME_INCREMENT = 0;
float FIRST_FRAME_TIME = 0;
bool CLICK_PAUSE = false;
bool OUT_PAUSE = true;
bool MOUSE_MOVE = false;

/////////////////// These markers will be needed for formula
/////////////////// replacement. Do not alter them:
/////////////////// Start of user formula @@@
  WIDTH = 250;
  RATIO = 1;
  X_MIN = 0; X_MAX = 5*PI;
  Y_MIN = 0; Y_MAX = 5*PI;
  TIME_INCREMENT = 0.05;
  OUT_PAUSE = false;

  color rgb(x, y, t) {
    float xx = x + t + cos(x) + (int)(y/8);
    float yy = y;

    int value = (((int)xx % 4) * 4 + ((int)yy % 4));

    switch(value) {
    case 0:
    case 1:
    case 3:
    case 5:
    case 9:
    case 10:
    case 11:
    case 15:
      value = 40;
      break;
    default:
      value = 255;
      break;
    }

    float shade = (1+sin(x)) / 2 *.9 + .1;

    float luma = value * shade;
    return color(luma);
  }
/////////////////// @@@ End of user formula

int u;
int v;
float t = 0;
int i = 0;
int t_on = true;
int X_SPAN;
int Y_SPAN;
var FN;

int argsOf(fn) {
  try {
    return eval(fn).length;
  }
  catch(err) {
    return 0;
  }
}

void setup() {
  try {
    js_mathvision_init_table_84a994069c80bfbf23bb687bf8dbfc81252fa5f9(FRAMES);
  }
  catch(err) {}

  X_SPAN = X_MAX - X_MIN;
  Y_SPAN = Y_MAX - Y_MIN;
  if(RATIO==AUTO) {
    RATIO = X_SPAN / Y_SPAN;
  }
  if(HEIGHT==0) {
    HEIGHT = (int)(WIDTH/RATIO + 0.5);
  }

  v = 0;

  size((int)WIDTH, (int)HEIGHT);
  noStroke();
  background(255);

  // for first frame, simulate centered mouse
  mouseX = WIDTH/2;
  mouseY = HEIGHT/2;

  // determine mode: rgb(x,y) or rgb(x,y,t) or hsb(x,y) or hsb(x,y,t)
  var nArgs;
  if((nArgs=argsOf("hsb"))>0) {
    colorMode(HSB, 255);
    FN = hsb;
  }
  else {
    nArgs=argsOf("rgb");
    colorMode(RGB, 255);
    FN = rgb;
  }
  switch(nArgs) {
  case 2:
    TIME_INCREMENT = 0;
    break;
  case 3:
    TIME_INCREMENT = TIME_INCREMENT==0 ? 1 : TIME_INCREMENT;
    break;
  default:
    println("*** ERROR: you need to define " +
            "rgb(x,y) or rgb(x,y,t) or hsb(x,y) or hsb(x,y,t)");
    noLoop();
    return;
  }

  // user init
  preSetup();

  // draw first frame
  drawFrame(FIRST_FRAME_TIME, FN);

  if(OUT_PAUSE)
    noLoop();

  if("" != "") {
    // save thumbnail
    try {
      js_mathvision_done_84a994069c80bfbf23bb687bf8dbfc81252fa5f9("", 48);
    }
    catch(err) {}
  }
}

void drawFrame(t, func)
{
  if(preDraw(t)) {
    loadPixels();
    for(v=0; v<HEIGHT; v++) {
      int y = map(v, 0, HEIGHT, Y_MAX, Y_MIN);
      for(u=0; u<WIDTH; u++) {
        int x = map(u, 0, WIDTH, X_MIN, X_MAX);
        pixels[u+v*width] = func(x, y, t);
      }
    }
    updatePixels();

    postDraw(t);
  }
}

void draw()
{
  if(TIME_INCREMENT==0) {
    noLoop();
  }
  else {
    t += TIME_INCREMENT;
    drawFrame(t, FN);
  }
}

void makeFrames_84a994069c80bfbf23bb687bf8dbfc81252fa5f9(adder) {
  var tt = t;
  t = 0;
  for(var i=0; i<FRAMES; ++i) {
    drawFrame(t, FN);
    adder(i+1, FRAMES);
    t += TIME_INCREMENT;
  }
  t = tt;
}

void mouseClicked() {
  if(TIME_INCREMENT!=0 && CLICK_PAUSE) {
    t_on = !t_on;
    if(t_on)
      loop();
    else
      noLoop();
  }
}

void mouseOver() {
  if(OUT_PAUSE && TIME_INCREMENT!=0)
    loop();
}

void mouseOut() {
  if(OUT_PAUSE)
    noLoop();
}

void mouseMoved() {
  if(TIME_INCREMENT==0 && MOUSE_MOVE)
    drawFrame(0, FN);
}
