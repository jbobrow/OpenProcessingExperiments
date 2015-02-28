
// copyright eunkic 
// hw #4 -- updated according to assignment guidline

// a. press 1 key to make a star appear
// b. the star follows mouse cursor movement. 
//    it also twinkles according to the movement
// c. keep press 1 to increase the size of star and 2 to decrease
// d. press mouse button to see color changes
// e. scroll mouse wheel to creat star shpaes at the background

// variables declarations
float x, y, d;
float xDist, yDist;
float easing;
PFont f;
String s1, s2, s3, s4;

// functions
void setup () 
{  
  size (400, 400);
  background (25, 160, 227);
  smooth ();
  frameRate (50);
  easing = .035;
  
  f = createFont("Arial",16,true);
  s1 = "press 1 key to make a star appear";
  s2 = "keep press 1 to increase the size, 2 to decrease";
  s3 = "press mouse button to see color changes";
  s4 = "scroll mouse wheel to creat star shpaes at the background";
}

void draw () 
{
  // interactions
  // noCursor ();
  xDist = mouseX - x;
  yDist = mouseY - y;
  x = x + easing*xDist;
  y = y + easing*yDist;
  
  // instructions
  textFont(f,14);
  fill (255, 15);
  text (s1, 23, 160);
  text (s2, 23, 180);
  text (s3, 23, 200);
  text (s4, 23, 220);

  // opacity
  fill(25, 160, 227, 20);
  rect(0, 0, width, height); 
  
  // default shape
  fill (255, 210, 0, 100);
  noStroke ();
  beginShape();
  vertex(x, y-10*d);
  vertex(x+3*d, y-4*d);
  vertex(x+9*d, y-3*d);
  vertex(x+4*d, y+d);
  vertex(x+6*d, y+8*d);
  vertex(x, y+5*d);
  vertex(x-6*d, y+8*d);
  vertex(x-5*d, y+d);
  vertex(x-10*d, y-3*d);
  vertex(x-3*d, y-4*d);
  endShape(CLOSE);

}

// press 1 key to apear the star and increase the size and 2 key to decrease the size
void keyPressed () {
  
  if(key=='1'){
    d += 2;
  }
  else if(key=='2'){
    d -= 2;
  }
  endShape(CLOSE);
}

// creat background star shapes according to mouseWheel value (e)
void mouseWheel (MouseEvent event) {
  float e = event.getAmount();
  if (e>0) {
    e += 1;
  }
  else if (e<0) {
    e -= 1;
  }
  stroke (255, 210, 0);
  noFill ();
  beginShape();
  vertex(200, 200-20*e);
  vertex(200+6*e, 200-8*e);
  vertex(200+18*e, 200-6*e);
  vertex(200+8*e, 200+2*e);
  vertex(200+12*e, 200+16*e);
  vertex(200, 200+10*e);
  vertex(200-12*e, 200+16*e);
  vertex(200-10*e, 200+2*e);
  vertex(200-20*e, 200-6*e);
  vertex(200-6*e, 200-8*e);
  endShape(CLOSE);
}

// make star twinkling according to the movement
void mouseMoved() {
  
  fill (255, random(180,240), 0);
  noStroke ();
  beginShape();
  vertex(x, y-10*d);
  vertex(x+3*d, y-4*d);
  vertex(x+9*d, y-3*d);
  vertex(x+4*d, y+d);
  vertex(x+6*d, y+8*d);
  vertex(x, y+5*d);
  vertex(x-6*d, y+8*d);
  vertex(x-5*d, y+d);
  vertex(x-10*d, y-3*d);
  vertex(x-3*d, y-4*d);
  endShape(CLOSE);
}

// change the colors of star and background when mouse pressed
void mousePressed () {
  fill(58, 44, 191, 100);
  rect(0, 0, width, height);
  
  fill (255, random(0,80), 185);
  noStroke ();
  beginShape();
  vertex(x, y-10*d);
  vertex(x+3*d, y-4*d);
  vertex(x+9*d, y-3*d);
  vertex(x+4*d, y+d);
  vertex(x+6*d, y+8*d);
  vertex(x, y+5*d);
  vertex(x-6*d, y+8*d);
  vertex(x-5*d, y+d);
  vertex(x-10*d, y-3*d);
  vertex(x-3*d, y-4*d);
  endShape(CLOSE);
}





