
float angle = 0;
float s = 1;
float scaleSpeed = 0.01;
float counter = 0.0;
float thickness = 2;
float offset = 10;
float hue = 0.0; 


void setup()
{
  size (500, 500);
  background (25);
  colorMode(HSB, 50, 25, 75);

  
}

void draw()
{
    angle += 0.1;
  s += scaleSpeed;
  counter += 1 / 60.0;
  
  if (counter < 5)
  {
    drawGradient();
  }
 
  if (s > 3 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
   
  strokeWeight(5);
  drawRect();

   //rotate(radians(45));
  float degrees = radians(45);
  rectMode(CENTER);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  rect(0, 0, 50, 50);
 popMatrix();

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
 
float rectX = 10.0;
 
void drawRect()
{
  rectX += 1;
   
  if (rectX > width)
  {
    rectX = 5;
  }
   
  hue += offset;
  if (hue >= 360)
  {
     offset = -offset;
     hue = 360;
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; 
  }
  fill(hue, 100, 100);
   
  float angle = rectX * 4;
  float rectY = (height / 2) + cos(radians(angle)) * (height /2 );
  rect(50, 50, 100, 100);
  rect(25, 25, 100, 100);
  
  

}



  




