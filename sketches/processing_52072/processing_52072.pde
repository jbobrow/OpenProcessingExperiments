
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Lissajou Oscillation
//---------------------------------------

void setup() {
       size(500, 500);
       //noLoop();
       background(0);
       smooth();
       stroke (200); 
       strokeWeight(1);
       frameRate(120);
}
// setting global variable
float t = 0;
float ampx = 200;
float ampy = 150;
float omegax = 8;
float omegay = 3;
float phix = 0.0;
float phiy = 0.5;

float velocity = 0.005;

void draw() {
    	float x = ampx*cos(omegax*t+phix)+width/2;
    	float y = ampy*sin(omegay*t+phiy)+height/2;   
    	t += velocity;
        point(x,y);
}


