
/** 
 * <h3>A simple processing sketch to move a circle along the path of a sine wave.</h3>
 * <h4>Usage:</h4>
 * Right mouse button to decrease wavelength (or increase frequency) <br>
 * Left mouse button to increase wave length (or decraese frequency) <br>
 * Middle mouse button to toggle shivering. <br><br>
 * Jan 02, 2010 - Satish Goda - satishgoda@gmail.com 
 */

float x, y; 
float numOfWaves = 0;

float angle = 0;
float yScale;

float radiusOfCircle = 25; 

boolean isShivering = true;
float shiverValue = .05; 

void setup() 
{ 
  size(360, 360); 
  background(0); 

  smooth(); 
  noStroke(); 

  frameRate(60);

  x = 0; 
  y = 0; 

  yScale = (height/2)-radiusOfCircle; 
} 

void enableMotionBlur()
{
  fill(0, 15); 
  rect(0, 0, width, height);
}

void draw()  
{ 
  enableMotionBlur();

  translate(0, height/2); 
  scale(1, -1);

  // Warp the curve once it reaches the right most part of the window
  x = frameCount%(width);
  
  angle = radians(x);
  
  // Create vertical displacement between -1, 1 
  y = sin(angle*(numOfWaves/2.0)); 

  // Add a random variation to that value
  if(isShivering) 
    y = y + random(shiverValue); 

  // Scale the value according to the height of the window 
  y = map(y, -1, 1, -yScale, yScale); 

  fill(255, 0, 0); 
  ellipse(x, y, radiusOfCircle*2, radiusOfCircle*2); 
} 

void mouseReleased()
{
  switch(mouseButton)
  {
  case LEFT:
    numOfWaves = (--numOfWaves < 0) ? 0 : numOfWaves;
    break;
  case CENTER:
    isShivering = isShivering ? false : true;
    break;
  case RIGHT:
    numOfWaves++;
    break;
  }
}









