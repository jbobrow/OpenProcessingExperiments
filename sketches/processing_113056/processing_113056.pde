
float r = 0;
float s = 1;
float scaleSpeed = 0.01;
float radius = 100;
float t = 0;
float hue = 0.0;
float offset = 10;
float counter = 0;
float ellipseX = 0.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  r += 0.1;
  s += scaleSpeed;
  t += 0.0167;
  counter += 1 / 60.0; // 0.0167;
  drawEllipse();
  
  if (s > 2 || s < 0.01)
  {
    scaleSpeed = -scaleSpeed;
  }
  float degrees = radians(45);
  rectMode(CENTER);
  
  if (t < 8.9)
  {
  int centX = 0;
  int centY = 0;
   
  stroke(0, 80);
  noFill();
  ellipseMode(CENTER);
  translate(width/2, height/2);
  rotate(r);
  scale(s);
  ellipse(centX,centY,450, 345);
  strokeWeight(3);
  stroke(100);
  float x, y;
  float lastx = -999;
  float lasty = -999;
  for (float ang = 0; ang <= 360; ang += 5) {   
    float rad = radians(ang);  
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    point(x,y);
  } //for above circle
  } //for swirl if statement 
} //for void draw

void drawEllipse()
{
  strokeWeight(3);
  if (t > 8.9 && t<22)
  {
  ellipseX += 1;
   
  if (ellipseX > width)
  {
    ellipseX = 0;
  } //for ellipseX if
   
  hue += offset;
  if (hue >= 360)
  {
     offset = -offset;
     hue = 360; 
  } //for hue if
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; 
  } //for else if
  fill(hue, 100, 100);
   strokeWeight(0);
  float angle = ellipseX * 4;
  float ellipseY = (height / 2) + cos(radians(angle)) * (height / 2);
  ellipse(ellipseY, ellipseX, 200, 100);
  ellipse(ellipseX, ellipseY, 100, 100);
  } //for time if statement
 
  if (t > 18 && t<25)
  {
    pushMatrix();
    strokeWeight(0);
    translate(width/2, height/2);
    smooth();
    fill(36, 0, 99);
    rotate(r);
    scale(s);
    rect(0,0,258,258);
    popMatrix();
  }
  
}//for void drawEllipse






