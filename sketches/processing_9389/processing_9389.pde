
/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 
remixed by mar_b
 */
 
int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
boolean flip       = true;
float d;
float e;
void setup() {
  size(400,200);
  frameRate(40);
  colorMode(HSB);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
  renderWave2();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {

  pushMatrix();
  rotate(radians(45));
  translate(40,-250);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    if(flip){
    fill(x,255,255,60);}
    else{
    fill(x+10,255,255,60);
    }
     
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],x,x);
    flip = !flip;
   
    
      flip=flip;
      ellipse(width/2+yvalues[x],x*xspacing,x,x);
   }
   popMatrix();
}
 void renderWave2() {
   
  rotate(radians(225));
  translate(-height-200,-width+290);
  
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x=x+1) {
    noStroke();
    if(flip){
    fill(x+100,255,255,60);}
    else{
    fill(x+200,255,255,60);
    }
     
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],x,x);
    flip = !flip;
   
    
      flip=flip;
      ellipse(width/2+yvalues[x],x*xspacing,x,x);
    }
}


