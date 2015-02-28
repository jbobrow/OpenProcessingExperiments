
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
}
// variabili globali
float t = 0;
float velocity = 0.01;

void draw() {
        smooth();
        stroke (200); 
        strokeWeight(15);
    	float x = 200*cos(3*t+1)+width/2;
    	float y = 120*sin(5*t+2)+height/2;   
    	t += velocity;
        background(0);
        point(x,y);
       }


