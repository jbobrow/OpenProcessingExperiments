
/*
*
*
*  copied from processing.org sin wave example
*  trying to add rainbow cycling along the wave,
*
*   mouse left - right - saturation
*   mouse up - down - brightness
*   phase - left/right arrow
*   amplitude - up/down arrow
*   Shift - angular momentum +
*   Control - angular momentum -
*   
*  changed to multi dim array
*
*
*/

int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float angMom = .04;  // angular momentum
float amplitude = 90.0;  // Height of wave
float period = 330.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[][] yvalues;  // Using an array to store height values for the wave
int[] coloff;
int colMax = 360;        //colour range
int brlValue;
int satValue;
int phase = 2;

void setup() {
  colorMode(HSB,colMax,255,255);
  size(660, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing][w/xspacing];
  coloff = new int[w/xspacing];
}

void draw() {
  period = int (width / phase);
  dx = (TWO_PI / period) * xspacing;
  background(0);
  satValue =int(map(mouseX,0,width,255,1));
  brlValue =int(map(mouseY,0,height,255,1));
 
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += angMom;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i][1] = sin(x)*amplitude;

    //we want to cycle through 360
    yvalues[i][2] =float(int(theta / angMom)%colMax);
    
    
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  float rwCol = 1;
  
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    
    //set the color to offset along the wave
    rwCol = (x * colMax/yvalues.length) + yvalues[x][2];
    if (rwCol > colMax) rwCol = rwCol - colMax;
    
    fill(rwCol, satValue, brlValue);
    
    ellipse(x*xspacing, height/2+yvalues[x][1], 16, 16);
    
  }
}


void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
      case SHIFT: 
        angMom = angMom + .01;
        break;
      case CONTROL: 
        if (angMom>=.02) angMom = angMom - .01;
        break;
      
      case UP: 
        if (amplitude < (height/2)) amplitude++;
        break;
      case DOWN:
        if (amplitude > 2) amplitude--;
        break;
      case LEFT:
        if (phase > 1) phase--;        
        break;
      case RIGHT:
        phase++;              
        break;
    }
  }
      
}
    
    
   
