
void setup()
{
  size(600, 320);

}
  
void draw()
{

  float x = 480;
  float y = 120;
  int x1;
  int y1;
  
  x1 = int (random(460,500));
  y1 = int (random(100,140));
  
background(94 , 18, 106);
smooth();

noFill();
stroke(0, 0, 255);
strokeWeight(10);
ellipse(120, 120, 150, 150);

noFill();
stroke(0);
strokeWeight(10);
ellipse(300, 120, 150, 150);

noFill();
stroke(255, 0, 0);
strokeWeight(10);

if((x1 != x) && (y1 != y))
{
ellipse(x1, y1, 150, 150);
}
else if((x1 == x) && (y1 == y))
{
ellipse(x, y, 150, 150);
noLoop();
}

noFill();
stroke(255, 255, 0);
strokeWeight(10);
ellipse(210, 200, 150, 150);

noFill();
stroke(0, 255, 0);
strokeWeight(10);
ellipse(390, 200, 150, 150);

}

