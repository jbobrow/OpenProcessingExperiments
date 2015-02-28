
float angle = 0;
float offset = 1;
float counter = 0;
float s = 2;
float scaleSpeed = 0.01;

void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
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
    
  //rotate(radians(45));
  float degrees = radians(45);
  rectMode(CENTER);
  
  pushMatrix();
  fill(0, 0, 255);
  translate(width/2, height/2);
  rotate(degrees);
  scale(s);
  rect(0, 0, 100, 100);
  noFill();
  
  popMatrix();
  
  
  if(counter > 5 || counter < 0)
  {
  fill(255, 0, 0);
  rectMode(CENTER);
  translate(width/2 , height/2);
  rotate(angle);
  rect(0, 0, 50, 50);
  noFill();
 
  }


  counter += 1 / 60.0;
  if (counter < .5)
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
}
float ellipseX = 0.0;

void drawEllipse()
{
  ellipseX += 1;
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
   
  fill(0);
   
  float angle = ellipseX * 8;
  float ellipseY = (height / 2) + cos(radians(angle)) * (height / 2);
  ellipse(ellipseY, ellipseX, 100, 100);
}



void drawGradient()
{
  for (int x = 0; x < width; x += 1)
  {
    float percentage = x / (float)width;
    stroke(50, 100, 100 * percentage);
    line(x, 0, x, height);
  }
}



