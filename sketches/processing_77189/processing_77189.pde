
PFont f;
float xstart, ystart, squaresize;

void setup () {
  size (800, 600);
  background (75);
  f = createFont ("Verdana Bold", 16, true);
  xstart = random (10);
  ystart = random (10);
  squaresize = height/8;
  
}

void draw () {
  fill (75, 75, 75, 15);
  noStroke ();
  rect(0,0, width, height);
  
  textFont (f, 32);
  fill (100);
  text ("Kenny Rose Design", 440, 575);
  
  textFont (f, 16);
  fill (100);
  text ("Created using Processing and Processing.js", 20, 20);
  
  textFont (f, 16);
  fill (100);
  text ("sketch based on original code by Matt Pearson", 20, 40);
  
  stroke (255, 50);
  fill (255, 128, 128, 200);
  
  xstart += 0.02;
  ystart += 0.01;
  
  translate (width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y +=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x +=3) {
      xnoise += 0.02;
      drawPoint (x,y, noise (xnoise, ynoise));
    }
  }
}


void drawPoint (float x, float y, float noiseFactor) {
  pushMatrix ();
  translate ( x * noiseFactor * 4, y * noiseFactor * 4); 
    float edgeSize = noiseFactor * 20;
    ellipse (0, 0, edgeSize, edgeSize);
    popMatrix ();
    
 
}


