
/*
  A program to draw sin and cosine waves at various wavelengths,
  amplitudes..
  
  User interaction is by clicking mouse buttons.
*/

float repeat;
float amplitude; 
int bgcol = 0;

void plot(float x1, float y1, float x2, float y2) {
  line(x1,y1,x2,y2);
}

void setup() {
  size(800, 600);
  amplitude  = (height/4)*random(0.0, 1.0);
  repeat = random(0,2);
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    repeat = repeat + 1;
    redraw();
  }
  
  if (mouseButton == CENTER) {
    amplitude  = (height/4)*(random(0.0, 1.0)*2);
  }

  if (mouseButton == RIGHT) {
    bgcol = int(random(0,255));
    repeat = random(0,2);
    redraw();
  }
}

void draw() {
  background(bgcol);
  
  float Tx = 0.0;
  float Ty = 0.0;
  float inc = TWO_PI/width*repeat;

  float sinOrigin = height/4.0;
  float cosOrigin = (3/4.0)*height;

  for(int i=0; i < width; i=i+1) {
    // Lets plot the sine curve
    Ty = -1*(sin(Tx)*amplitude);
    
    stroke(0,255,0);
    plot(i, sinOrigin, i, sinOrigin+Ty);
    // Lets now plot the compliment of above curve
    stroke(255,255,0);
    plot(i, sinOrigin, i, sinOrigin-Ty);
    
    // Lets plot the cosine curve
    Ty = -1*(cos(Tx)*amplitude);
    
    stroke(255,0,0);
    plot(i, cosOrigin, i, cosOrigin+Ty);
    // Lets now plot the compliment of above curve
    stroke(255,0,255);
    plot(i, cosOrigin, i, cosOrigin-Ty);
   
    Tx = Tx + inc;
  }
}




