
/**

This program will create randomly placed and sized
rectangles or ellipses(if mouse is pressed).

**/

// number of ellipses on screen at one time
int num = 5;
// the range os values for ellipse size and position
int range = 30;

float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(640, 360);
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  smooth();
  frameRate(10);
}

void draw() 
{
  background(75);
  
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
  
  // Draw a rectangle/ellipse with random size and position
  if(mousePressed){
   
  for(int i=1; i<num; i++)   
    ellipse(ax[i-1], ay[i-1],random(10,80),random(10,80));
    fill(random(20,100),150,100,random(255));
  }
  else{
    for(int i=1; i<num; i++)
    rect(ax[i-1], ay[i-1],random(10,80), random(10,80));
    fill( 0, random(20,200), random(20,200));
    }
}

