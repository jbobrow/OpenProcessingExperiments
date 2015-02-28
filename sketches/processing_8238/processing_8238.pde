
// Julia Explorer
// Claudio Gonzales, March 2010
  // Originally created with C++ in April, 2008
// Albuquerque, New Mexico

int bailout = 75;

float xMin = -2;
float xMax = 2;
float yMin = -2;
float yMax = 2;

float zR, zI, cR, cI;
float jR = -0.74814820;
float jI = 0.09629631;

PFont metaBold; 

boolean julia = true;

void setup(){

  size( 540, 540, P2D );
  background(0);
  colorMode(RGB,1);
  smooth();
  noFill();
  frameRate(10);

  metaBold = loadFont("ArialMT-20.vlw"); 
  textFont(metaBold, 17); 
  
}

void draw() {
  
  if( sq(pmouseX) + sq(pmouseY) > 0 && julia ) {
    jR = float(mouseX)/width * (xMax-xMin) + xMin;
    jI = (1-float(mouseY)/height) * (yMax-yMin) + yMin;
    render();
    fill(1); 
    text("Current Seed: "+jR+" + "+jI+"i", 5, 20); 
  }
  if( !julia ) {
    noLoop();
    render();
    fill(1); 
    text("Current Seed: "+jR+" + "+jI+"i", 5, 20); 
  }

  
}

void render() {

  float x, y, r;
  int i=0;

  for( int ix=0; ix<width; ix++ ) {
    for( int iy=0; iy<height; iy++ ) {      

      cR = float(ix)/width * (xMax-xMin) + xMin;
      cI = (1-float(iy)/height) * (yMax-yMin) + yMin;
      zR = cR;
      zI = cI;
      i=0;

      for (int n=0; n<bailout; n++) {

        x = sq(zR) - sq(zI) + jR;
        y = 2*zR*zI + jI;
        //x = sq(zR) - sq(zI) + cR;
        //y = 2*zR*zI + cI;

        zR = x;
        zI = y;
                
        i++;
        if( sq(zR) + sq(zI) > 4 ) {
          n = bailout;
        }
        
      } 
      
      r = float(i)/bailout;

      // Blur
      // stroke( sin(PI*r), sin(2*PI*r), sin(3*PI*r), 0.5 ); 
      stroke( sin(PI*r), sin(2*PI*r), sin(3*PI*r) ); 

      point(ix,iy);
      
    }
  }
    
}

void keyPressed() {
  julia = !julia;
  
  if( julia ) {
    xMin = -2;
    xMax = 2;
    yMin = -2;
    yMax = 2;
    render();
    loop();
  }
  
}

void mousePressed() { 
  
  if( !julia ) {
  
    float x = float(mouseX)/width * (xMax-xMin) + xMin;
    float y = (1-float(mouseY)/height) * (yMax-yMin) + yMin;
    float newRad = 0;
    
    // x4 zoom in or out
    
    if( mouseButton == LEFT ) {
      newRad = (xMax-xMin)/8;
    }
    if( mouseButton == RIGHT ) {
      newRad = (xMax-xMin)*2;
    }
    
    xMin = x - newRad;
    xMax = x + newRad;
    yMin = y - newRad;
    yMax = y + newRad;
    
    loop();
    
  }
  
}




