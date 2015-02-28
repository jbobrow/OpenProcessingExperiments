
float centerX,centerY;
int anglechange = 5;
int shapeangle = 0;

void setup()
{
  size(640,480);
  centerX = width/2;
  centerY = height/2;
}

void draw()
{
  background(255);
  
  for(int j = 400; j > 0; j-=20)
  {
    ellipse(centerX,centerY,j,j);
  }
  drawDots();
  drawShape();
  shapeangle += anglechange;
  drawLines();
  drawRect();
}

void drawShape()
{
  pushMatrix();
  translate(centerX,centerY);
  rotate(radians(shapeangle));
  beginShape();
    vertex(20, 20);
    vertex(40, 20);
    vertex(40, 40);
    vertex(80, 40);
    vertex(100, 60);
    vertex(20, 80);
  endShape(CLOSE);
  popMatrix();
}

void drawDots()
{
  for(int a = 0; a < width; a += 10)
  {
    for(int b = 0; b < height; b += 10)
    {
      point(a,b);
    }
  }
}

void drawLines()
{
  for(int i = 0; i < width; i+=10)
  {
    line(i,height,mouseX,mouseY);
  }
}

void drawRect()
{
  translate(mouseX,mouseY);
  rect(-50,100,100,20,10);
}


