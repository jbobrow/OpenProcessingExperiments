
float timer= 0.0;
float CX = 0;
float Left = 0;
float Right = 0;
float speed = 3.0;
float radius = 30.0;
blocks[] block = new blocks[8];

void setup()
{
  size(500,600);
  for(int i = 0; i < block.length; i+= 1)
  {
    block[i]= new blocks();
  }
}

void draw()
{
  if (rectCircleIntersect(rectX, rectY, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    background(255,0,0);
  }
  else {
    background(0);
  }
  timer= timer + (1.0/30.0);
  for(int i = 0; i < block.length; i+= 1)
  {
    block[i].Y += 2;
    fill(255);
    rect(block[0].X, block[0].Y, block[0].LW, block[0].LW);
  }
  CX += (Right - Left) * speed;
  fill(random(255),random(255),random(255));
  ellipse(CX,560,radius,radius);
  //boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  //float circleDistanceX = abs(cx - rx - rw/2);
  //float circleDistanceY = abs(cy - ry - rh/2);
 
  //if (circleDistanceX > (rw/2 + cr)) { return false; }
  //if (circleDistanceY > (rh/2 + cr)) { return false; }
  //if (circleDistanceX <= rw/2) { return true; }
  //if (circleDistanceY <= rh/2) { return true; }
 
  //float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  //return cornerDistance <= pow(cr, 2);

}

class blocks
{
  float X = random(10, width - 10);
  float Y = -100;
  float LW= 60;
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT);
    {
      Left = 0;
    }
    if (keyCode == RIGHT);
    {
      Right = 0;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      Left = 1;
    }
    if (keyCode == RIGHT)
    {
      Right = 1;
    }
  }
}



