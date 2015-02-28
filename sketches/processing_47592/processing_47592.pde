
/**
 * Brownian motion. 
 * 
 * Recording random movement as a continuous line. 
 */

int num = 2000;
int range = 30;

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(640, 360);
  for (int i = 0; i < num; i++) {
    ax[i] = width/6 ;
    ay[i] = height/6;
  }
  frameRate(10);
}

void draw() 
{
  background(0);

  // Shift all elements 1 place to the left
  for (int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);

  // Draw a line connecting the points
  for (int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    colorMode(HSB, 255);
    color c = color(360-mouseY/2, 126, 255, 90);
    fill(c);
    stroke(c);
    strokeWeight (1.5);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
    float value = hue(c);  // Sets "value" to "0"
fill(value);


    }
  }
  


