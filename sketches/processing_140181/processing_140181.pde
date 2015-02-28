
/**
 Yingying Yang
 Creative Computing Section B
 Wk 6 Assignment 2 - Draw tool
 */

int numPoints = 5000;

int[] x;
int[] y;
float[] gradfade;

int index = 0;

void setup() {

  size(800, 800);
  x = new int[numPoints];
  y = new int[numPoints]; 
  
  gradfade = new float[numPoints]; //array example from processing.org for gradual fading
  for (int i = 0; i < numPoints; i++) {
    float amount = map(i, 0, 5000, 0, PI);
    gradfade[i] = abs(cos(amount));
  }
  frameRate(100);
}

void draw() {

  background(127);
  noStroke();

  if ( mousePressed ) {
    x[index] = mouseX;
    y[index] = mouseY;
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
    
  }

  for (int i = 0; i < index; i++) {
    fill(random(0,255), 255, 255, gradfade[i]*100); //glowing and fading
    ellipse( x[i], y[i], abs(x[i]-y[i])/4, abs(x[i]-y[i])/4 ); //size changes according to coordinates of mouse
  }
  }


void keyPressed() { //reset drawing space
  index = 0;
}



