
int num = 16;
int range = 8;
float alpha = 1.9;
 
float[] ax = new float[num];
float[] ay = new float[num];
float[] az = new float[num];

float[] bx = new float[num];
float[] by = new float[num];
float[] bz = new float[num];
 
int backgroundColour = 37;
 
void setup()
{
  size(640, 360, P3D);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
    az[i] = 0;
    
    bx[i] = width/2;
    by[i] = height/2;
    bz[i] = 0;
  }
  frameRate(24);
  
  strokeWeight(2);
}
 
void draw() {
  
  background(backgroundColour);
 
  textSize(22);
  fill(255, backgroundColour/2, backgroundColour/2);
  text("Lévy, α = " + alpha, 10, 30);
  fill(backgroundColour/2, 255, backgroundColour/2);
  text("Brownian", 10, 60);
    
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
    az[i-1] = az[i];
    
    bx[i-1] = bx[i];
    by[i-1] = by[i];
    bz[i-1] = bz[i];
  }
 
  // Put a new value at the end of the array
  float randX = random(-range, range);
  float randY = random(-range, range);
  float randZ = random(-range, range);
  
  ax[num-1] += randX * pow(random(0, 1), -1/alpha);
  ay[num-1] += randY * pow(random(0, 1), -1/alpha);
  az[num-1] += randZ * pow(random(0, 1), -1/alpha);
    
  bx[num-1] += randX;
  by[num-1] += randY;
  bz[num-1] += randZ;
    
  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], width/5, width-width/5);
  ay[num-1] = constrain(ay[num-1], height/5, height-height/5);
  az[num-1] = constrain(az[num-1], -10, 0);
  
  bx[num-1] = constrain(bx[num-1], width/5, width-width/5);
  by[num-1] = constrain(by[num-1], height/5, height-height/5);
  bz[num-1] = constrain(bz[num-1], -10, 0);
   
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {   
    float val = float(i)/num * (255 - backgroundColour) + backgroundColour;
    
    stroke(val, backgroundColour/2, backgroundColour/2);
    line(ax[i-1], ay[i-1], az[i-1], ax[i], ay[i], az[i]);
    
    stroke(backgroundColour/2, val, backgroundColour/2);
    line(bx[i-1], by[i-1], bz[i-1], bx[i], by[i], bz[i]);
  }
}
