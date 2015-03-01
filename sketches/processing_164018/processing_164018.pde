
float timer;
float radius = 0.0;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
float offsetHue = 10;
float hue = 0.0;
float i = 0;
int thickness = 6;
boolean filterApplied = false;
PImage galaxy;

 
 
void setup()
{
 size(600,600);
background(0);
colorMode(HSB, 360, 100, 100, 100);
rectMode(CENTER);
frameRate(300);
galaxy = requestImage("galaxy.jpg");
 
//spiral
center = width / 2.0;
prevX = center;
prevY = center;
}
 
void draw()
{
  //first
  if (timer >= 90.0)
  {
    timer = 0.0;
    radius = 0.0;
    prevX = center;
    prevY = center;
  }
  pushMatrix();
  float spiralOffset = 100.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
    strokeWeight(thickness);
    float timerScalar = 20.0;  
    stroke(timer * timerScalar, 100, 100, 40);
    line(prevX, prevY, x, y);
     
     prevX = x;
    prevY = y;
 
timer += 0.0167; // (1 / frameRate);
    radius += 0.9;
    popMatrix();
 
//galaxy
pushMatrix();
if (timer > 8)
{
  if (galaxy.width > 0 )
  {
  imageMode(CENTER);
  if (filterApplied == false)
  {
    galaxy.filter(INVERT);
    filterApplied = true;
  }
  }
  image(galaxy, width/2, height/2, width, height);
}
popMatrix();
 
 
i = i + 0.1;
 
pushMatrix();
hue += offsetHue;
  if (hue >= 360)
  {
     offsetHue = -offsetHue;
     hue = 360;
  }
  else if (hue < 0)
  {
    offsetHue = -offsetHue;
    hue = 0;
  }
 
if (timer > 8)
{
translate(300, 300);
smooth();
fill(hue, 200, 200);
rotate(i);
rect(100, 100, 150, 150);
}
popMatrix();
 
pushMatrix();
if (timer > 8)
{
    translate(300, 300);
    rotate(i);
    fill(hue, 500, 500);
    rect(50,50,100,100);
    translate(300, 300);
    rotate(i);
    rect(-25,-25,100,100);
}
    popMatrix();
 
 //3rd
 if (timer > 8)
{
translate(300, 300);
smooth();
fill(hue, 200, 200);
rotate(i);
ellipse(100, 100, 150, 150);
}
popMatrix();
 
pushMatrix();
if (timer > 18)
{
    translate(200, 200);
    rotate(i);
    fill(hue, 500, 500);
    ellipse(50,50,100,100);
    translate(200, 200);
    rotate(i);
    ellipse(-25,-25,100,100);
}
    popMatrix();
     
}



