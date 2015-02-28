
int str;
boolean large;
float w;
float t;
float shade;
void setup()
{
  size(1010,1000);
  background(255,255,255);
  float x = random(500);
  float w = 4;
  float t = 4;
  shade = 0;
  str = 4;
  noCursor();
  while (x > 0)
  {
    fill(random(180),random(180),random(180));
    ellipse(random(1000),random(1000),50,50);
    x = x - 1;
  }
}

void draw()
{
  strokeWeight(str);
  stroke(255,255,255);
  line(pmouseX,pmouseY,mouseX,mouseY);
  rectangle();
}
 
void mouseDragged()
{
   if (mouseButton == LEFT)
     {
       float x = random(500);
       while (x > 0)
      {
        stroke(0,0,0);
        fill(random(180),random(180),random(180));
        ellipse(random(1000),random(1000),50,50);
        x = x - 1;
      }
     }
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    stroke(0,0,0);
    fill(random(180),random(180),random(180));
    triangle(random(1000),random(1000),random(1000),random(1000),random(1000),random(500));
  }
}

void rectangle()
{
  fill(255,0,0);
  stroke(shade,0,0); 
  rect(t,w,t + 4,w + 4);
  shade = shade + 1;
  t = t + 2;
  w = w + 2;
  if (t > 1300)
  {
    t = 4;
    shade = 0;
  }
  if (w > 1300)
  {
    w = 4;
    shade = 0;
  }
}
