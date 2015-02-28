
float s = 2;
int currentBrush = 0;
int currentBrush2 = 0;
float hue = 0;
float angle = 0;
float radius = 100;
int centX = 0;
int centY = 0;
boolean Invert = false;

void setup()
{
  size(600,600);
  background(255);
  colorMode(HSB, 360, 50, 50);
}

void keyReleased()
{
  if (key == 'z')
  {
  currentBrush = 0;
  }
  if (key == 'x')
  {
  currentBrush = 1;
  }
  if (key == 'c')
  {
  currentBrush = 2;
  }
  if (key == 'v')
  {
  currentBrush = 3;
  }
} 

void draw()
{
   hue = hue + 1;
 if (hue >= 360)
 {
   hue = 0;
}
  if(mousePressed == true)
  {
    if(mouseButton == LEFT)
    {
      if(currentBrush == 0)
      {
        stroke(4);
        fill(0,0,0);
        pushMatrix();
        translate(mouseX, mouseY);
        scale(s);
        triangle(0,-15,-15,15, 15, 15);
        popMatrix();
      }
    }
     if(mouseButton == LEFT)
    {
      if(currentBrush == 1)
      {
        stroke(4);
        fill(0,0,0);
        pushMatrix();
        translate(mouseX, mouseY);
        scale(s);
        rect(0,0,30,30);
        popMatrix();
      }
    }
     if(mouseButton == LEFT)
    {
      if(currentBrush == 2)
      {
        stroke(4);
        fill(0,0,0);
        pushMatrix();
        translate(mouseX, mouseY);
        scale(s);
        ellipse(0,0,30,30);
        popMatrix();
      }
    }
    if(mouseButton == LEFT)
    {
      if(currentBrush == 3)
      {
        filter(INVERT);
        filter(BLUR);
      }
    }
    }
       if(mouseButton == RIGHT)
      {
        angle += 50;
    translate(mouseX, mouseY); 
    stroke(0, 0);
    rotate(angle);
    noFill();
    ellipse(0,0,0,0);
    stroke(hue, 360 ,360);
    radius = 10;       
    float x, y;
    float lastx = -999;
    float lasty = -999;
    for (float ang = 0; ang <= 1440; ang += 5) {   
    radius += 0.5;
      float rad = radians(ang);
      x = centX + (radius * cos(rad));
      y = centY + (radius * sin(rad));
      if (lastx > -999) {
      line(x,y,lastx,lasty);
      }
      lastx = x;
      lasty = y; 
      }
  }
  }





