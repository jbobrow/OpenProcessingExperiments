
/**
 * Mosaic Waves by Alex Kuzmichov
 * based on Sine Wave by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 */
color colorsFromColorBrewer[] = { color(239, 243, 255),
                                  color(189, 215, 231),
                                  color(107, 174, 214),
                                  color(49, 130, 189),
                                  color(8, 81, 156)
                                  };
int lineCount = 4;
int depthCount = 3;
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 24;//75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float[] alphavalues;
float initTileSize = 10;

void setup() 
{
  size(840, 360);
  smooth();
  noStroke();
  w = width + int(initTileSize*2);
  
  yvalues = new float[int(w/initTileSize)];
  alphavalues = new float[yvalues.length];
}

void draw() {
  background(0);
  
  renderWaves();
}

void calcWave(int depth, float xStep) 
{
  // Increment theta (try different values for 'angular velocity' here
  theta -= 0.012;
  float xShift = 60*depth;

  dx = (TWO_PI / period) * xStep;
  // For every x value, calculate a y value with sine function
  float x = (theta + xShift)/(3 - depth);
  for (int i = 0; i < yvalues.length; i++) 
  {
    yvalues[i] = sin(x)*amplitude;
    alphavalues[i] = atan(cos(x))/PI;
    x += dx;
  }
}

void renderWaves() 
{  
  for(int depth = 0; depth < depthCount; depth++)
  {
    drawWavesForDepth(depth);    
  }
}

void drawWavesForDepth(int depth)
{
  float startY = height/1.14;
  float tileSize = initTileSize + depth*3;
  float xCoord, yCoord, yCoordAdd;
  
  float xStep = tileSize + 1 + depth;
  calcWave(depth, xStep);
  
  if(depth != 0)
  {
    fill(0);
    beginShape();
    vertex(width, height);
    vertex(0, width);
    for (int x = 0; x < yvalues.length; x++)
    {
      vertex(x*xStep, startY + yvalues[x] - 1);
    }
    endShape(CLOSE);
  }
    
  for(int i = 0; i < lineCount; i++)
  {
    yCoordAdd = (tileSize + 2)*i;
    fill(colorsFromColorBrewer[i+1]);
    for (int x = 0; x < yvalues.length; x++)
    {
      xCoord = x*xStep;
      yCoord = startY + yvalues[x] + yCoordAdd;
      pushMatrix();
      translate(xCoord, yCoord);
      rotate(alphavalues[x]);
      rect(0, 0, tileSize, tileSize);
      translate(-xCoord, -yCoord);        
      popMatrix();
    }
  }
}


