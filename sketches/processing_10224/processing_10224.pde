
// Buddhabrot
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico

// Based on Code by J. Tarbell and algorithms by Alex Boswell

int dim = 540;       // screen dimensions (square window)
int bailout = 500;  // number of iterations before bail ...... 4000, 200, 10 for Nebula
int plots = 2500;   // number of plots per frame
long iterations = 0;
float ratio;
float magnification = 1;
float zoomrate = 5.0;
int time = 0;
int maximumExposures;
int maximumSources;

float hueStart = random(1);
float hueRange = random(0.5);
float power = 1.5 + random(2.5);
  // 2.1221764

int gxMin = dim, gyMin = dim;
int gxMax = dim, gyMax = dim;


float x = random(-2.0,1.0);
float y = random(-1.5,1.5);

int gX = 0, gY = 0;  //Global real and imaginary counters

float xMin = -2;
float xMax = 2;
float yMin = -2;
float yMax = 2;

boolean escape, allow = true, first = true, hotspots = false, cycle = false, saved = false;
int[][] exposures = new int[dim][dim];
int[][] points = new int[dim][dim];
int[][] sources = new int[dim][dim];
PFont metaBold;
PImage temp;
color c;

//  MAIN ----------------------------------------------------------------

void setup() { 
  
  //size(600,600,P3D);     //Required for upload
  size(dim,dim,P3D);   //Normal code
  background(0);
  frameRate(15);
  smooth();

  flushImage();
  flushEstimates();
  Analyze();

  metaBold = loadFont("ArialMT-20.vlw");
  textFont(metaBold, 16);
}

void draw() {
  
  plotOrbits();
  time++;  
  
  if( time%15==1 && hotspots ) {
    // show progress...
    if( cycle ) {
      trimGrid();
    }
    drawSources(false);
    allow = true;
    first = true;
  }
  else if( time%15== 1 ) {
    if( cycle ) {
      trimGrid();
    }
    maximumSources = maxExposure( sources );  
    drawBuddha(false);
    allow = true;
  }  
  
  if( saved == true ) {
    fill(255);
    stroke(255);
    text("Saved!", width-50, 20);
    saved = false;
  }
  
}

void drawBuddha( boolean saveIt ) {
  maximumExposures = maxExposure( exposures );
  renderImage();
  
  if( saveIt ) {
    save("Buddhabrot.png");
  }
  
  fill( 255 );
  text("Power:  " + power, 5, 20);
  text("Bailout:  " + bailout, 5, 40);
  text("Iterations:  " + iterations, 5, 60);
  text("Image Center: " + (xMax+xMin)/2 + " + " + (yMax+yMin)/2 + "i", 5, 80);
  text("Image Width:  " + (xMax-xMin), 5, 100);
  text("Image Zoom:  " + magnification, 5, 120);
  text("Click left to zoom in.", 5, height-70);
  text("Click right to zoom out.", 5, height-50);  
  text("Click left and hold <shift> to save with data.", 5, height-30);
  text("Click right and hold <shift> to save raw image.", 5, height-10);
}

void drawSources( boolean saveIt ) {
  float R;
  maximumSources = maxExposure( sources );
  for( int ix = 0; ix <= width-1; ix++ ) {
    for( int iy = 0; iy <= height-1; iy++ ) {
      R = float(sources[ix][iy]) / float(maximumSources);
      c = color( 255*R );
      set(ix,iy,c);
    }
  }
  
  stroke(255);
  line(gxMin,0,gxMin,height);
  line(gxMax,0,gxMax,height);
  line(0,gyMin,width,gyMin);
  line(0,gyMax,width,gyMax);
  
  if( saveIt ) {
    save("Sources.png");
  }
  
  fill( 0 );
  text("Power:  " + power, 6, 23);
  text("Bailout:  " + bailout, 8, 43);
  text("Iterations:  " + iterations, 8, 63);
  text("Image Center: " + (xMax+xMin)/2 + " + " + (yMax+yMin)/2 + "i", 8, 83);
  text("Image Width:  " + (xMax-xMin), 8, 103);
  text("Image Zoom:  " + magnification, 8, 123);
  text("Press enter to return to your buddhabrot.", 8, height-47);
  text("Click left and hold <shift> to save with data.", 8, height-27);
  text("Click right and hold <shift> to save raw image.", 8, height-7);
  fill( 255 );
  text("Power:  " + power, 5, 20);
  text("Bailout:  " + bailout, 5, 40);
  text("Iterations:  " + iterations, 5, 60);
  text("Image Center: " + (xMax+xMin)/2 + " + " + (yMax+yMin)/2 + "i", 5, 80);
  text("Image Width:  " + (xMax-xMin), 5, 100);
  text("Image Zoom:  " + magnification, 5, 120);
  text("Press enter to return to your buddhabrot.", 5, height-50);
  text("Click left and hold <shift> to save with data.", 5, height-30);
  text("Click right and hold <shift> to save raw image.", 5, height-10);
}

void keyPressed() {  
  if( key == ENTER || key == RETURN ) {
    if( hotspots ) { hotspots = false; drawBuddha(false); }
    else { hotspots = true; }
  }

  if ( hotspots ) {
    drawSources(false);
  }
  else {
    drawBuddha(false);
  }

}

void mousePressed() {
  
  if( hotspots ) {
    fill(255);
    if ( mouseButton == LEFT ) {
      save("Sources.png");
      saved = true;
    }
    else {
      drawSources(true);
      saved = true;
    }
  }
  else { 
    if ( mouseButton == LEFT && allow && keyPressed == true && keyCode == SHIFT ) {
      save("Fractal.png");
      cycle = false;
      stroke(255);
      saved = true;
    }
    else if ( mouseButton == RIGHT && allow && keyPressed == true && keyCode == SHIFT ) {
      drawBuddha(true);
      cycle = false;
      stroke(255);
      saved = true;
    } 
    else if ( mouseButton == LEFT ) {
      float NEWspan = (xMax-xMin) / zoomrate;
      x = mouseX * (xMax-xMin) / width + xMin;
      y = ( height - mouseY ) * (yMax-yMin) / height + yMin;
      xMax = x + NEWspan/2;
      xMin = x - NEWspan/2;
      yMax = y + NEWspan/2;
      yMin = y - NEWspan/2;
      iterations = 0;
      flushImage();
      flushEstimates();
      flushSources();
      renderImage();
      Analyze();
      allow = false;
      magnification *= zoomrate;
    }
    else {
      float NEWspan = (xMax-xMin) * zoomrate;
      x = mouseX * (xMax-xMin) / width + xMin;
      y = ( height - mouseY ) * (yMax-yMin) / height + yMin;
      xMax = x + NEWspan/2;
      xMin = x - NEWspan/2;
      yMax = y + NEWspan/2;
      yMin = y - NEWspan/2;
      iterations = 0;
      flushImage();
      flushEstimates();
      flushSources();
      renderImage();
      Analyze();
      allow = false;
      magnification /= zoomrate;
    }

  }

  if ( hotspots ) {
    drawSources(false);
  }
  else {
    drawBuddha(false);
  }
  
}




