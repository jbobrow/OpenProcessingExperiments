
/**
 * Brownian motion. 
 * 
 * Recording random movement as a continuous line. 
 */
 
int num = 2000;
int range = 200;



float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(640, 360);
  colorMode(HSB);
  stroke(random(255),255,255,random(20));
  for(int i = 0; i < num; i=i+1) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  frameRate(30);
}

void draw() 
{
  background(20);
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i=i+1) {
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
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
   // stroke(val);
    stroke(random(50,150),255,255,random(50));
    noFill();
    ellipse(ax[i-1], ay[i-1],10,10);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
}

