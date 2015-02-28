

 
int xspacing =8;   // How far apart should each horizontal location be spaced
int yspacing=8;
int w;              // Width of entire wave

float theta = 90.0f;       // Start angle at 0
float amplitude = 150.0f;  // Height of wave
float period = 1000.0f;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
float[] xvalues;
float dy;


void setup() {
  size(600,600);
  frameRate(30);
  colorMode(HSB);
  smooth();
  w = width+20;
  dx = (TWO_PI / period) * xspacing;
  dy = ((TWO_PI / period) * yspacing);
  yvalues = new float[w/xspacing];
  xvalues= new float[w/yspacing];
  println(yvalues.length); 
  println(xvalues.length); 
  

}

void draw() {
  //background(0);
  fill(255,10);
  rect(0,0,width,height);
  calcWave();
  renderWave();


}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.005;

  // For every x value, calculate a y value with sine function
  float x = theta;
  float y = theta;
  
  
  for (int i = 0; i < yvalues.length; i++) {
    for (int l=0; l< xvalues.length; l++){
    yvalues[i] = cos(x)*amplitude;
    xvalues[l]= cos(y)*amplitude;
    x+=dx;
    y+=dy;
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  
  

  for (int x = 0; x < yvalues.length; x++) {

    stroke( x, 255, 255, 50 ); 
    fill( yvalues[x], 255, 255, 1 ); 
    strokeWeight(1);   // Default
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],yvalues[(x*3)%77],yvalues[(x*3)%77]);
    }
  
}




