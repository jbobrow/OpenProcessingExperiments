
//Sarah Keeling
//Assignment 11, Jim Roberts Computing for the Arts with Processing
//Working with Parallel Arrays
//March 12, 2012


int MAX = 50;
float maxSpeed = 10;
float maxSize = 100;

float [] x;
float [] y;
float [] wd;
float [] ht;
float [] boxDx;
float [] boxDy;
color [] col;

float window = 600;
//-----------------------------------
void setup () {
  size (600, 600);
  //size (screen.width, screen.height);
  noStroke ();
  smooth ();

  x = new float [MAX];
  y = new float [MAX];
  wd = new float [MAX];
  ht = new float [MAX];
  boxDx = new float [MAX];
  boxDy = new float [MAX];
  col = new color [MAX];

  initColor ();

  initFloatArray (x, 0, width);
  initFloatArray (y, 0, height);
  initFloatArray (wd, 20, maxSize);
  initFloatArray (ht, 20, maxSize);
  initFloatArray (boxDx, 1, maxSpeed);
  initFloatArray (boxDy, 1, maxSpeed);
}

//-----------------------------------
void draw () {
  prepScreen ();
  drawBoxes ();
  moveBoxes ();

}
//-----------------------------------

void prepScreen () {
 // fill (255, 80);
 fill (255);
  rect (0, 0, width, height);
}
//-----------------------------------

void initColor () {
  for (int i = 0; i< col.length; i++) {
    col[i] = color ( (int)random(255), (int)random (255), (int)random(255) );
  }
}
//-----------------------------------

void initFloatArray (float [] anyArray, float lowValue, float highValue) {
  for (int i = 0; i < anyArray.length; i++ ) {
    anyArray[i] = random (lowValue, highValue);
  }
}

//-----------------------------------

void drawBoxes () {
  for (int i=0; i< x.length; i++) {
    fill (col[i]);
    rect (x[i], y[i], wd[i], ht[i]);

  }
}
//-----------------------------------

void moveBoxes () {
  for (int i= 0; i< boxDx.length; i++) {

    x[i] = x[i] + boxDx[i];
    y[i] = y[i] + boxDy [i];


    if (x[i] > width) {
      boxDx[i] = -boxDx[i];
    }
    else if (x[i] < 0) {
      boxDx[i] = -boxDx[i];
    }
    if (y[i] > height) {
      boxDy[i] = -boxDy[i];
    }
    else  if (y[i] < 0) {
      boxDy[i] = -boxDy[i];
    }

  }
}




