
float timer = 0;
float i = 0;
float offsetHue = 10;
float hue = 0.0;
float scaleX = 1;
float ellipseX = 0.0;


void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
}

void draw()
{
  background(0);
  ellipseX += 1;
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
  fill(hue, 100, 100);
  timer += 1 / 60.0;
  if (timer < 5)
  {
    strokeWeight(2);
    stroke(hue, 100, 100);
    line(random(500), random(500), random(500), random(500));
  }  
  
  i = i + 0.1;
  
  pushMatrix();
  noStroke();
  translate(width/2, height/2);
  smooth();
  rotate(i);
  if (scaleX > 2)
  {
    scaleX = -scaleX;
  }
  else if (scaleX < 2)
  {
     scaleX += 0.01;
  }
  if (timer > 5)
  {
    scale(scaleX);
  }
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix();
  
  if (timer < 5 || timer > 10)
  {
  pushMatrix();
  translate(width/2, height/2);
  rotate(i);
  rect(0, 0, 50, 50);
  popMatrix();
  }
  
  float ellipseY = (height/2) + sin(radians(ellipseX * 5)) * 100;
  ellipse(ellipseX, ellipseY, 50, 50);
  ellipse(ellipseY, ellipseX, 50, 50);

  

}


