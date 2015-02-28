
float angle = 0;
float offset = 1;
float counter = 0;
float s = 2;
float scaleSpeed = 0.01;
PImage NImage;
PImage WImage;

void setup()
{
  size(500,500);
  NImage = requestImage("NImage.jpg");
  WImage = requestImage("WImage.jpg");
}

 
void draw()
{
   if (WImage.width > 0);
  {
    image(WImage, 0,0, width, height);
  }
  angle += 0.1;
  s += scaleSpeed;
  if (s > 3 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  else
  {
    scaleSpeed = .6;
  }
  

  
  float degrees = radians(45);
  rectMode(CENTER);
   
  pushMatrix();
  fill(255, 0, 0, 40);
  translate(width/2, height/2);
  rotate(degrees);
  scale(s);
  rect(0, 0, 100, 100);
  noFill();
   
  popMatrix();
   
   
  if(counter > 15 || counter < 0)
  {
  fill(255, 0, 0);
  rectMode(CENTER);
  translate(width/2 , height/2);
  rotate(angle);
  rect(0, 0, 50, 50);
  noFill();
  
  }
 
 
  counter += 1 / 60.0;
  if (counter < 8.5)
  {
    drawGradient();
  }
  stroke(360, 0, 100);
  strokeWeight(5);
  float radius = 200;
  int centX = width / 2;
  int centY = height / 2;
  float x, y;
  float lastx = centX + (radius * cos(50));
  float lasty = centY + (radius * sin(50));
  for (float ang = 0; ang <= 360; ang += 5)
  { 
    float rad = radians(ang);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
 
  strokeWeight (2);
  fill( 0, 255, 0);
  drawEllipse();
  if (counter > 15)
  {
    fill(255,0,0);
    rect(0, 0, width * 2, height * 2);
    noFill();
  }
}
float ellipseX = 0.0;
 
void drawEllipse()
{
  ellipseX += 1;
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  if (counter < 8.5)
  {  
  fill(252, 245, 3);
  }
  else
  {
    fill(255);
  }
 
  float angle = ellipseX * 8;

  ellipse((height / 2) + cos(radians(angle)) * (height / 2), ellipseX, 100, 100);
}
 
 
 
void drawGradient()
{
  if (NImage.width > 0);
  {
    image(NImage, 0,0, width, height);
  }
  if (counter > 4.25)
  {
    filter(INVERT);
  }
}



