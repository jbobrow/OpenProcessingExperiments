
int xspacing =1;   
int w;              
PImage bg;
float theta = 0.0; 
float amplitude = 10.0;  
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(350,467);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
    bg = loadImage("ocean.jpg");
}

void draw() {
image(bg,0,-280);
  calcWave();
  renderWave();

}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.2;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/2+yvalues[x],4,4);
    ellipse(x*xspacing,width/1.5+yvalues[x],4,4);
    ellipse(x*xspacing,width/1.2+yvalues[x],4,4);
        ellipse(x*xspacing,width/1+yvalues[x],4,4);
        ellipse(x*xspacing,width/.85+yvalues[x],4,4);
          ellipse(x*xspacing,width/.75+yvalues[x],4,4);
  }
}

