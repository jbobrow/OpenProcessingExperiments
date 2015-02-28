
int rad = 0;
void setup()
{
  size(500,500);
  color(255,255,255);
}

void draw()
{
  fill(0,0,0);
  stroke(255,0,0);
  ellipse(250,250,100,100);
  fill(0,0,0);
}

void mousePressed()
{
  changeBackground(int(random(0,10)));
}

void changeBackground(int i)
{
  if (i == 0)
  {
   
    background(255,255,255);
    ellipse(290,250,100,100);
  }
  
  if (i == 1)
  {
    background(255,255,255);
      ellipse(210,250,100,100);
      ellipse(290,250,100,100);
  }
  
  if (i == 2)
  {
    background(255,255,255);
      ellipse(210,250,100,100);
      ellipse(290,250,100,100);
  }
  
  if (i == 3)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
  }
  
  if (i == 4)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);  }

 if (i == 5)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);
  }

if (i == 6)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);  
  ellipse(370,250,100,100);
}
 if (i == 7)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);  
  ellipse(370,250,100,100);
  ellipse(90,250,100,100);
}
if (i == 8)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(250,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);  
  ellipse(370,250,100,100);
  ellipse(90,250,100,100);
  ellipse(410,250,100,100);
}
if (i == 9)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);  
  ellipse(370,250,100,100);
  ellipse(90,250,100,100);
  ellipse(410,250,100,100);
  ellipse(50,250,100,100);
}
if (i == 10)
  {
    background(255,255,255);
     ellipse(210,250,100,100);
      ellipse(290,250,100,100);
      ellipse(170,250,100,100);
      ellipse(330,250,100,100);
  ellipse(130,250,100,100);  
  ellipse(370,250,100,100);
  ellipse(90,250,100,100);
  ellipse(410,250,100,100);
  ellipse(50,250,100,100);
  ellipse(450,250,100,100);
}
}

