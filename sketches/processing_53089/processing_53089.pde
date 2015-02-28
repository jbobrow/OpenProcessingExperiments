
//Melanie Danver
//copyright 2012 mdanver
// used class code set 8,
float dx, ux, uy, uySpeed, uxSpeed, ur;
float c, tx, ty, td, txSpeed, tySpeed;
void setup()
{
  background(255);
  noStroke();
  smooth();
  size(400, 400);
  ux = random(width);
  uy = random(50);
  uySpeed = 1;
  ur = random(-2, 2);
  c = 0;
}

void draw()
{
  background(255);
  monster(tx, ty, 40);
  moveMonster();
  balls();
  moveBalls();
  timer();
  counter();
  collisons();
}

void mouseDragged()
{
  if (mouseX>pmouseX)
  {
    txSpeed = txSpeed+.1;
  }
  else if (mouseX <pmouseX)
  {
    txSpeed = txSpeed -.1;
  }
  if (mouseY > pmouseY)
  {
    tySpeed = tySpeed+.1;
  }
  else if (mouseY < pmouseY)
  {
    tySpeed = tySpeed - .1;
  }
}

void collisons()
{
  dx = dist (tx, ty, ux, uy);  
  if (dx < 20)
  {
    ux = random(width);
    uy = random(height);
    fill(137,0,0);
    rect(0,0,width,height);
    c = c+1;
  }
}

void timer()
{
fill(0);
  text("time: "+(millis()/1000), 20, 20);
}

void counter()
{
  fill(0);
  String sd = nf(c, 1, 0);
  text("score: "+sd, 20, 40);
}



void monster(float tx, float ty, float td)

{
  fill(0, 3, 113);
  ellipse(tx, ty, td, td);
  fill(0);
}

void moveMonster()
{
  tx = tx + txSpeed;
  ty = ty + tySpeed;
  if (tx > (width+td))
  {
    tx = 0;
  }
  else if (tx < (0-td))
  {
    tx = width;
  }
  if (ty > height+td)
  {
    ty = 0-td;
  }
  else if (ty < 0-td)
  {
    ty = height+(td);
  }
}

void balls()
{
  fill(23, 245, 23);
  ellipse(ux, uy, 20, 20);
}

void moveBalls()
{ 
  uy = uy + uySpeed;
  ux = ux + ur;
  if (uy >= height - (5.0/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
  else if (uy < 0+(5.0/2))
  { 
    uySpeed = - uySpeed;
    ur = random(-2, 2);
  }
  if (ux >= width-(5.0/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
  if (ux <= 0+(5.0/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
}


