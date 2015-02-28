
// Based on http://processing.org/learning/topics/brownian.html

int num = 2000;
int range = 50; // changed from 6, to increase draw length

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(400, 400);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  frameRate(3); // changed from 30 to slow down drawing
}

void draw() 
{
  background(#FFFFFF); // changed to white
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
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
    stroke(#ffe900); // changed to yellow
    strokeWeight(2); // added stroke weight
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
}


