
float x, y, wid, hei, time, x1;
boolean mousepress, Shape1, qPressed, aPress, wPress, sPress, xPress ;

void mouseClicked()
{
  if (Shape1) Shape1=false;
  else 
  {
    Shape1=true;
  }
}

void keyPressed()
{
  if (key == 'a') 
  {
    aPress=true;
  }
  else if (key == 'w') 
  {
    wPress=true;
  }
  else if (key == 's') 
  {
    sPress=true;
  }
  if (key == 'x')
  {
    xPress=false;
  }
}

void keyReleased()
{
  if (key == 's') sPress=false;
  if (key == 'a') aPress=false;
  if (key == 'w') wPress=false;
  if (key == 'x') xPress=true;
}

void setup()
{
  xPress=true;
  Shape1=true;
  size(400, 400);
  smooth();
  noStroke();
  qPressed=false;
  wid=hei=10;
  rectMode(CENTER);
  background(0);
}

void draw()
{
  fill(255);
  fill(random(255), random(255), random(255));
  if (xPress)
  {
    if (Shape1) Circle();
    if (Shape1==false) Rectangle();
    if (aPress)wid=hei=wid+1;
    if (sPress && wid>1)wid=hei=wid-1;
    if (wPress)background(random(255), random(255), random(255));
  }
  fill(255);
  rect(200, 380, width, 100);
  fill(0);
  text("Press a to enlarge and s to shrink. Also w to clear.", 100, 360);
  text("Click to change shape and hold x to stop repeating.", 100, 380);
}

void Circle()
{
  ellipse(mouseX, mouseY, wid, hei);
}

void Rectangle()
{
  rect(mouseX, mouseY, wid, hei);
}


