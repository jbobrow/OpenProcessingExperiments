
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
       stroke (200,50); 
       strokeWeight(2);
       frameRate(120);
       noFill();
}
// setting global variable
float t = 0;
float ampx = 80;
float ampy = 120;
float omegax = 1;
float omegay = 1;
float phix = 0.0;
float phiy = 0.0;

float velocity = 0.005;
int iterations = 1000;
float angle = 0.0;
void draw() {
    if (frameCount < iterations) {

    	float x = ampx*cos(omegax*t+phix)+width/2;
    	float y = ampy*sin(omegay*t+phiy)+height/2;   
    	t += velocity;
        //point(x,y);
        translate(x,y);
        rotate(angle);
        ellipse(sin(angle),cos(angle),100*sin(angle)+100,200*sin(angle)+150); 
        angle+=0.01;    
    }
}


