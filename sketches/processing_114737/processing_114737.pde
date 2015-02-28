
int drip = 0;
float dripX = 0;
float dripY = 0;
float gray = 0;
 
void setup() 
{
  size(600, 600);
}

void draw()
{
  drip += 1;
  
  println(addTwoFloats(50, 30));
  
  if (mousePressed == true && mouseButton == LEFT)
  {
    drawX(mouseX, mouseY, 0, 2);
    drawX(mouseX + 5, mouseY + 5, 255, random(10));
    drawX(mouseX - 15, mouseY + 15, 128, random(4));
    drawX(mouseX - 5, mouseY - 10, 40, 1);
     
    // reset drip
    drip = 0;
  }  
  
  if (drip < 50) // only draw 50 segments
  {
    stroke(gray, calculateOpacity(drip)); // fade out by scaling with drip value
    
    float nextY = dripY + 10;//(drip * drip) * 0.15; // drip squared to better emulate gravity
    line(dripX, dripY, dripX, nextY);
    dripY = nextY + 1; // + 1 so they don't overlap
  }
}

void drawX(float x, float y, float graycolor, float weight)
{
  stroke(graycolor);
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


