
float x, y, wd, ht; //happens first

void setup( )
{
  size(400,400);
  fill(200,0,0);
  x=width*.5;
  y=height*.5;
  wd=width*.1;
  ht=height*.15;
  textSize(24);
  frameRate(24);
}

void draw() //happens
{
  //background(0,200,0);
  ellipse (random(width), random(height),wd, ht);
  if (mousePressed)
  {
     //fill(random(255), random(255), random(255));
  }
}
void keyPressed()
{
  background(200,200,0);
  if ( key == UP )
  {
    text("UP Arow was pressed", 200, 240);
  }
  else
  {
    text(key,200,200);
  }
}

void mouseReleased()
{
  noLoop();
}

void mouseMoved()
{
  loop();
}

void mousePressed()
{
 fill(random(255), random(255), random(255)); 
}


