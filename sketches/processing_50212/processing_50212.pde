
/* Shugo Tanaka
   1/19/2012
   
   This program reflects the user drawing across the axes and a buncha other crazy randomness!
   */
int colorVal = 0;
boolean countUp = true;

void setup()
{
  size(480,480);
  background(240);
  colorMode(HSB, 360, 100, 100);
  rectMode(CORNERS);
  strokeWeight(5);
}

void draw()
{
  if(mousePressed)
  {
    stroke(colorVal, 75, 100);
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(480-pmouseX, 480-pmouseY, 480-mouseX, 480-mouseY);
    line(pmouseX, 480-pmouseY, mouseX, 480-mouseY);
    line(480-pmouseX, pmouseY, 480-mouseX, mouseY);
    
    // Increases or decreases color value
    if(countUp)
    {
      colorVal+= 5;
    }
    else
    {
      colorVal-= 5;
    }
    
    // Changes from increasing value to decreasing
    if(colorVal >= 360)
    {
      countUp = false;
    }
    if(colorVal <= 0)
    {
      countUp = true;
    }
  }
}

void keyPressed()
{
  noStroke();
  fill(0, 0, 90);
  rect(0,0,480, 480);
}


