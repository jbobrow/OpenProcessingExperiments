
float drip = 0;
float dripX = 0;
float dripY = 0;

void setup()
{
  size(600, 600);
}
 
void draw()
{
  drip += 1;
  
  if (mousePressed == true && mouseButton == LEFT)
  {
    drawX(mouseX, mouseY + 100, color(255, 255, 255), 2);
    drawX(width/2, height/2, color(0), 20);
    drawX(mouseX, mouseY, color(255, 0, 0), 4);

    
    drip = 0;
  } 
  
  if (drip < 50) // only draw 50 segments
  {
    stroke(255,0,0, calculateOpacity(drip)); // fade out by scaling with drip value
     
    float nextY = dripY + 10;
    line(dripX, dripY, dripX, nextY);
    dripY = nextY; 
  }
}

void drawX(float x, float y, color xcolor, float weight)
{
  stroke(xcolor);
  strokeWeight(weight);
  line(x, y + 5, x + 60, y + 65);
  line(x + 60, y + 5, x, y + 65);
  
  dripX = x + 60;
  dripY = y + 65;
}

float addTwoFloats(float x, float y)
{
  return (((x + y) * 2) / 7);
}
 
float calculateOpacity(float drip)
{
  return 200 - (drip * 10);
}

float cubeFloat(float x)
{
  return x * x * x;
}




