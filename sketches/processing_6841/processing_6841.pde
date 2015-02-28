
/**
 * <h3>Application of Sine function - Plotting a linearly decaying sine wave</h3>
 * Usage:<br>
 * * Left mouse click at various areas of screen to change the frequency of wave<br>
 * * Middle mouse click to toggle decaying of the wave<br>
 * * Right mouse click to clip the wave on the negative y-axis<br>
 * <br>
 * 2010, Satish Goda. (satishgoda at gmail dot com)<br>
 * http://sites.google.com/site/satishgoda/
 */

float x, y;
float prevX=0.0, prevY=0.0;
int numOfWaves = 2;
float angle = 0;

boolean clipSineWave = false;
boolean disableDecay = true;

void setup()
{
  size(360, 360);
  background(0);
  smooth();
  stroke(255);
  strokeWeight(4);
}

/*
  My own linear interpolation function
  You can also use the builtin lerp() function
*/
float linearDecay(int count, int range)
{
  return (range - count)/float(range);
}

void draw()
{
  // Translate origin down by half the height of the window 
  // (Processing default is origin at top-left of the screen)
  translate(0, height/2);
  // Make +y-axis point up (Processing default +y is pointing down)
  scale(1, -1);

  for(int count=0; count < 360; ++count)
  {
    x = count;

    angle = radians(count);
    y = sin(angle*(numOfWaves/2.0));

    if(disableDecay) {
//      y = y * linearDecay(count, 360);
      y = y * lerp(1, 0, count/float(360));
    }

    if(clipSineWave) {
      y = abs(y);
    }

    y = map(y,-1,1,-height/2,height/2);

    line(prevX, prevY, x, y);

    prevX = x;
    prevY = y;
  }

  prevX = prevY = 0.0;
}

void mouseReleased() 
{
  switch(mouseButton)
  {
  case LEFT:
    numOfWaves = int(mouseX/30.0);
    break;
  case CENTER:
    disableDecay = disableDecay ? false : true;
    break;
  case RIGHT:
    clipSineWave = clipSineWave ? false : true;
    break;
  }
  background(0);
}












