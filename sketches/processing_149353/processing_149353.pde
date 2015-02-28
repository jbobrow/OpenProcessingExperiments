
// All Examples Written by Casey Reas and Ben Fry

// unless otherwise stated.

int segs = 3;

int steps = 2;

float rotAdjust = radians(360.0/segs/2.0);

float radius = 95.0;

float segWidth = radius/steps;

float interval = TWO_PI/segs;




void setup(){

  size(200, 200);

  background(127);

  smooth();

  ellipseMode(CENTER_RADIUS);

  noStroke();
  colorMode(HSB,segs,255,steps);

 createWheel(width/2, height/2);

}



void createWheel(int x, int y){

    for (int j=0; j<steps; j++){

      for (int i=0; i< segs; i++){

        fill(color(i, 255, steps-j));

        arc(x, y, radius, radius, interval*i+rotAdjust, interval*(i+1)+rotAdjust);

      }

      radius -= segWidth;
    }

}
