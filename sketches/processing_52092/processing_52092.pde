
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Lissajou Oscillation
//---------------------------------------

void setup() {
       size(500, 500);
       //noLoop();
       background(255);
       smooth();
       stroke (0); 
       strokeWeight(1);
       frameRate(120);
}
// variabili globali
float t = 0;
float ampx1 = 200;
float ampy1 = 150;
float omegax1 = 1;
float omegay1 = 6;
float phix1 = 0.0;
float phiy1 = 0.5;
float ampx2 = 180;
float ampy2 = 200;
float omegax2 = 6;
float omegay2 = 1;
float phix2 = 0.0;
float phiy2 = 0.5;
float velocity = 0.01;
int iterations = 1000;

void draw() {
  if (frameCount < iterations) {
    	    float x1 = random(ampx1)*cos(omegax1*t+phix1)+width/2;
    	    float y1 = random(ampy1)*sin(omegay1*t+phiy1)+height/2;
    	    float x2 = random(ampx2)*cos(omegax2*t+phix2)+width/2;
    	    float y2 = random(ampy2)*sin(omegay2*t+phiy2)+height/2;
    	    t += velocity;
            line(x1,y1,x2,y2);
  }
}


