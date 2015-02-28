
float x = 0;
float y = 0;
float ediameter = 100;
float speed = 3; // x,y, position
int state = 0;  // to determine the state of the square.
// colors
float r = 0;
float g = 0;
float b = 0;
int rdir = 1;
int gdir = 1;
int bdir = 1;

PFont font;
String words = "";


void setup() {
  size(500, 500);
  smooth();
  font = loadFont("ACaslonPro-Bold-25.vlw");
}

void draw() {
  background(b, g, r);

  // conditionals
  if (state ==0) {
    x = x+speed;
    words = " Up Left-Corner";
    if (x > width-ediameter-3) {
      state = 1;
    }
  } 
  else if (state == 1) {
    y = y+speed;
    words = "Up Right-Corner";
    if (y > height-ediameter-3) {
      state = 2;
    }
  } 
  else if (state == 2) {
    x = x-speed;
    words = "Down Right-Corner";
    if ( x<0+3) {
      state = 3;
    }
  } 
  else if (state == 3) {
    y = y-speed;
    words = "Down Left-Corner";
    if ( y < 0+3) {
      state = 0;
    }
  }

  //changing color variables(r,g,b)
  r = r + speed/2 *rdir;
  g = g + speed/3 *gdir;
  b = b + speed/4 *bdir;

  if (r < 0 || r > 255) {
    rdir = rdir *-1;
  } 
  else if (g < 0 || g > 255) {
    gdir = gdir *-1;
  } 
  else if (b < 0 || b > 255) {
    bdir = bdir * -1;
  }


  //drawing rect
  fill(r, g, b);
  stroke(0);
  strokeWeight(3);
  rect(x, y, ediameter, ediameter);

  //text
  textFont(font, 10);
  fill(0);
  text(words, x-(ediameter/(ediameter/2)-6), y+ediameter/2+3);
}

