
float prevX;
float prevY;
int currentBrush = 0;
color backgroundColor;
 PImage palletteImage;
  float drip = 0;
float dripX = 0;
float dripY = 0;

  
  
 float s=.5;
 float r=1;
void setup()
{
  size(600, 600);

}
  
void draw()
{

  if (mousePressed == true && mouseButton == RIGHT)
  {
    backgroundColor = get(mouseX,mouseY);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT && currentBrush==1)
    {
       drawX(mouseX, mouseY, color(255, 0, 0), 4);
       drip = 0;
    }
    if (mouseButton == LEFT && currentBrush==0)
    {
 
  
      //float d = dist(pmouseX,pmouseY,mouseX,mouseY);
       pushMatrix();
       translate(pmouseX,pmouseY);
       rotate(r);
       scale(s);
        fill(backgroundColor);
        triangle(-30, 30, 0, -30, 30, 30);
       popMatrix();
 
    }
    if (mouseButton ==LEFT && currentBrush==2)
    {
      line(0,0,mouseX,mouseY);
      line(600,600,mouseX,mouseY);
      line(0,600,mouseX,mouseY);
      line(600,0,mouseX,mouseY);
      line(300,300,mouseX,mouseY);
      line(0,300,mouseX,mouseY);
      line(300,0,mouseX,mouseY);
      line(300,600,mouseX,mouseY);
      line(600,300,mouseX,mouseY);
      line(400,400,mouseX,mouseY);
      line(200,200,mouseX,mouseY);
      line(500,500,mouseX,mouseY);
      line(200,400,mouseX,mouseY);
      line(100,600,mouseX,mouseY);
      line(400,600,mouseX,mouseY);
      line(500,600,mouseX,mouseY);
      line(100,200,mouseX,mouseY);
      line(500,100,mouseX,mouseY);
      line(400,200,mouseX,mouseY);
      line(500,200,mouseX,mouseY);
      line(500,300,mouseX,mouseY);
      line(400,100,mouseX,mouseY);
      line(400,200,mouseX,mouseY);
      line(200,0,mouseX,mouseY);
    }
  }
  if (drip < 50) // only draw 50 segments
  {
    stroke(255,0,0, calculateOpacity(drip)); // fade out by scaling with drip value
      
    float nextY = dripY + 10;
    line(dripX, dripY, dripX, nextY);
    dripY = nextY;
  }
  prevX = mouseX;
  prevY = mouseY;
}


void keyReleased()
{
  if (key == '0')
  {
    currentBrush = 0;
  }
  if (key == '1')
  {
    currentBrush = 1;
  }
    if (key == '2')
  {
    currentBrush = 2;
  }
  if (keyCode == UP)
  {
    s+=.1;
  }
    if (keyCode == DOWN)
  {
    s-=.1;
  }
  if (keyCode == LEFT)
  {
    r+=1;
  }
    if (keyCode == RIGHT)
  {
    r-=1;
  }
}


void drawX(float x, float y, color xcolor, float weight)
{
  stroke(xcolor);
  strokeWeight(weight);


   
  dripX = x;
  dripY = y;
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


