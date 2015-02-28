
// Author : Mostafa Mohsenvand 
// Date : Mon 12:35 PM , Dec 9, 2013
// Vancouver, Canada

color[] pallet = {#627D80, #B3C8CC, #E0FAFF, #89EBFF, #B30855};
int high = 400;
int wide = 800;

int tail = 10; //number of pieces
float[] x = new float[tail];
float[] y = new float[tail];
float[] coef = new float[tail];
float[] d = new float[tail];

float noiseAmp = 1.0; //a little bit on noise to make it look alive 
//for collision detection
float colterm; 
float distance;

//
//
void setup(){
  size(wide,high);
  background(50);
  stroke(pallet[0]);
  strokeWeight(5);
  //noFill();
  ellipseMode(RADIUS);
  for(int i = 0; i<tail; i++) {
  x[i] = random(0,wide);
  y[i] = random(0,high);
  coef[i] = 0.2; //speed of convergence
  d[i] = 1.7* (tail - i*0.3); //diameters 
}
}
//
void draw(){
  background(80);
  for(int i = 1; i<tail; i++) {
  distance = dist(x[i],y[i],x[i-1],y[i-1]);
  colorMode(HSB,360,100,100);
  stroke(122+2*distance,100,100);
  strokeWeight(30); 
  line(x[i],y[i],x[i-1],y[i-1]);
}

  colorMode(RGB,100);
  strokeWeight(5);
  stroke(pallet[3]);
//  noStroke();
//  noFill();


  x[0] = x[0]+(mouseX-x[0])*coef[0] + random(-noiseAmp,noiseAmp);
  y[0] = y[0]+(mouseY-y[0])*coef[0] + random(-noiseAmp,noiseAmp);
  ellipse(x[0],y[0],d[0],d[0]);
for(int i = 1; i<tail; i++) {
  //collision parameters
  colterm = (d[i]+d[i-1]);
  distance = dist(x[i],y[i],x[i-1],y[i-1]);
  //easing with recursive collision avoidance
  x[i] = x[i]+(x[i-1]+colterm*(x[i]-x[i-1])/distance-x[i])*coef[i]+ random(-noiseAmp,noiseAmp);
  y[i] = y[i]+(y[i-1]+colterm*(y[i]-y[i-1])/distance-y[i])*coef[i]+ random(-noiseAmp,noiseAmp);
  ellipse(x[i],y[i],d[i],d[i]);
}
}
