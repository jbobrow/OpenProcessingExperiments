
/**
 * <h3>Application of Sine Wave - Drawing Gradients</h3>
 * <h4>Usage:</h4>
 * Right mouse button to decrease wavelength (or increase frequency)<br>
 * Left mouse button to increase wave length (or decraese frequency)<br>
 * Middle mouse button to clip negative values from sine wave.<br>
 * <br>
 * Jan 02, 2010 - Satish Goda - satishgoda@gmail.com<br><br>
 * More info on <a href="http://en.wikipedia.org/wiki/Sine_wave">Sine Wave</a>
 */

float prevX=0.0, prevY=0.0;

float sign = 0;
int numOfWaves = 1;
int scanTime = 0;

boolean clipNegativeValue = false;

// Set the sketch settings
void setup()
{
  size(360, 480);
  background(0);
  smooth();
  frameRate(120);
}

// stroke base color is multiplied by the sign to get the gradient
float getSign(int scanTime)
{
  // We get a value in the range between [-1, 1]
  sign = sin( radians(scanTime)*(numOfWaves/2.0) );

  // If we choose to neglect negative values, use "abs" function
  // to sign to a positive number
  if(clipNegativeValue) {
    sign = abs(sign);
  }

  return sign;
}

void drawGradient(float value)
{
  strokeWeight(1);
  stroke( value < 0 ? 50 : 255*value );
  line(0, scanTime, width, scanTime);
}

void drawGradientCurve(float value)
{
  pushMatrix();
  {
    translate(0, height);
    scale(1, -1);
    strokeWeight(2);
    stroke(value < 0 ? 50 : 255*value);
    //point(scanTime, map(value, -1, 1, 0, 120));
    line(prevX, prevY, scanTime, map(value, -1, 1, 0, 120));

    prevX = scanTime;
    prevY = map(value, -1, 1, 0, 120);
  }
  popMatrix();
}

void draw()
{
  float value;

  value = getSign(scanTime);

  if(scanTime < 360) {
    drawGradient(value);
    drawGradientCurve(value);
    scanTime++;
  } 
  else {
    delay(1500);
    resetDrawing();
  }
}

void mouseReleased()
{
  switch (mouseButton)
  {
  case LEFT:
    numOfWaves--;
    if(numOfWaves == 0) {
      numOfWaves = 1;
    }
    break;
  case RIGHT:
    numOfWaves++;
    break;
  case CENTER:
    clipNegativeValue = clipNegativeValue ? false : true;
    break;
  }

  resetDrawing();
}

void resetDrawing()
{
  // Reset time and clear background color
  scanTime = 0;
  background(0);
  prevX = prevY = 0.0;
}























