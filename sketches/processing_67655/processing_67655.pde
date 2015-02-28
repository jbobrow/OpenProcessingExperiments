
/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen. 
 */


PFont fontA;

//we need a height that lets us create a big enough pattern for scrolling
int stripe = 120;
int w = 800;
int h = 500;

int bg = 0;
float angle = 30;
int stepx = 394;
int s = 0;  
void setup() 
{
  //set height to visible area of stripe
  size(w, stripe);
  //size(w, h); //uncomment this to see what realy is drawn

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  fontA = loadFont("DINSchablonierschrift-48Lat.vlw");
  
  // Set the font and its size (in units of pixels)
  textFont(fontA, 48);

  // loop ith 30fps for better performance (see int c for speed of animation)
  frameRate(30);

  noStroke();
}

void draw() {
  
  //background colro animation set to 2 times the cycle of one text scroll
  if (s % (stepx/2) <= (stepx/4)) bg = 0;
  else {
    //if (bg == 0) angle = cos(angval++); //rotationtest
    bg = 255;
  }
  background(bg);
  
  //translate ROI to top of window
  translate(0, -(h-stripe)/2);
  
  // textcolor
  fill(255,229,0);
  
  /* thought of multiple lines, but yet no solution for cliping
  for (int l = - 1; l < 2; l++) {
  translate(0, l*150);*/
  
  //rotation around center
  int a = w/2, b = h/2;
  translate(a,b);
  rotate(radians(-angle));
  translate(-a,-b);
  
  //draw multiple lines of text
  for (int x = 0; x <= w; x += stepx) {
    for (int y = 0; y <= h; y += 48) {
      text("SONNEMONDSTERNE", x-s, y+48);
    }
  }
  
  //reset rotation
  translate(a,b);
  rotate(radians(angle));
  translate(-a,-b);
  
  /* //leftover from centerd stripe in 16/10 window
  int stripe = 120;
  fill(bg);
  rect(0, 0, w, (h-stripe)/2);
  rect(0, (h-stripe)/2+stripe, w, (h-stripe)/2);
  */
  
  // transition of the letters in writing direction
  s += 6;
  if (s >= stepx) {
    s = 0;
  }
}

