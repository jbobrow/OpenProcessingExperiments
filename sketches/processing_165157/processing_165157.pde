
int drip=0;
float timer=0.2;
int drip=0;
float dripY=0, dripX=0, d=0.0, e=0.0, f=0.0, g=0.0, r=random(0,600);

void setup()
{
  size(700,700);
  background(#CBC3C3);
}
  
void draw()
{

if(keyPressed)
{
  if(key == 'q')
  {
    float a=random(255), b=random(255), c=random(255);
    stroke(a,b,c);
    strokeWeight(2);
    noFill();
    triangle(mouseX, mouseY, mouseX+100, mouseY+100, r, 0);
  }
}

if(keyPressed)
{
  if(key == 'w')
  {
    strokeWeight(3);
    float a=random(255), b=random(255), c=random(255);
    stroke(a,b,c);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}
if(keyPressed)
{
  if(key == 'e')
  {
    strokeWeight();
    float a=random(255), b=random(255), c=random(255);
    stroke(a,b,c);
    line(mouseX, mouseY, mouseX+100, mouseY+100, r, 0);
  }
}
if(keyPressed)
{
  if(key == 'r')
  {
    strokeWeight(2);
    float a=random(255), b=random(255), c=random(255);
    stroke(a,b,c);
    fill(a,b,c);
    ellipse(mouseX, mouseY, mouseX+10, mouseY+10, r, 0);
  }
  if(keyPressed)
{
  if(key == 't')
  {
    filter(ERODE);
  }
}
  if(keyPressed)
{
  if(key == ' ')
  {
    fill(#FFFFFF);
    noStroke();
    rect(0,0,700,700);
  }
}
}
}


