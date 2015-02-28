
PacMan Pac1, Pac2, Pac3, Pac4;
boolean mousePress, randomspawn;

void setup()
{
  size(800, 800);
  smooth();
  noStroke();
  mousePress=false;
  randomspawn=false;

  Pac1= new PacMan();
  Pac1.hexcolor = #FF1212;
  Pac1.v=random(10, 30);
  Pac1.bait=false;
  Pac1.contshape=0;
  Pac1.mouth=6;

  Pac2= new PacMan();
  Pac2.hexcolor = #FA12FF;
  Pac2.v=random(10, 30);
  Pac2.bait=false;
  Pac2.contshape=0;
  Pac2.mouth=6;

  Pac3= new PacMan();
  Pac3.hexcolor = #140FD3;
  Pac3.v=random(10, 30);
  Pac3.bait=false;
  Pac3.contshape=0;
  Pac3.mouth=6;

  Pac4= new PacMan();
  Pac4.hexcolor = #17D3B2;
  Pac4.v=random(10, 30);
  Pac4.bait=false;
  Pac4.contshape=0;
  Pac4.mouth=6;

  Pac1.x=random(200, 400);
  Pac1.y=random(200, 400);

  Pac2.x=random(200, 400);
  Pac2.y=random(200, 400);

  Pac3.x=random(200, 400);
  Pac3.y=random(200, 400);

  Pac4.x=random(200, 400);
  Pac4.y=random(200, 400);
}

void draw()
{
  //println(mousePress);
  fill(0);
  rect(0, 0, width, height);
  Pac1.movement();
  Pac2.movement();
  Pac3.movement();
  Pac4.movement();
  Pac1.show();
  Pac2.show();
  Pac3.show();
  Pac4.show();
  Pac1.boundary();
  Pac2.boundary();
  Pac3.boundary();
  Pac4.boundary();
  Pac1.contshape=Pac1.contshape+1;
  Pac2.contshape=Pac2.contshape+1;
  Pac3.contshape=Pac3.contshape+1;
  Pac4.contshape=Pac4.contshape+1;
  if (mousePress)
  {
    fill(#FFF812);
    ellipse(mouseX-10, mouseY-10, 20, 20);
  }
  fill(255);
  text("Press a to random and click to attract pacman, Click to begin", 100, 780);
}

void mousePressed()
{
  Pac1.bait=true;
  Pac2.bait=true;
  Pac3.bait=true;
  Pac4.bait=true;
  mousePress=true;
}

void mouseReleased()
{
  Pac1.bait=false;
  Pac2.bait=false;
  Pac3.bait=false;
  Pac4.bait=false;
  mousePress=false;
}

void keyPressed()
{
  if (key == 'a')
  {
    randomspawn=true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    randomspawn=false;
  }
}


class PacMan
{
  float x, y;
  float v;
  int hexcolor;
  float contshape= second();
  boolean bait;
  float arcstop, arcstart, mouth;

  void rules()
  {
    if (x>mouseX && y>mouseY)
    {
      x += mouseX* 0.005* -1*v;
      y += mouseY* 0.005* -1*v;
      arcstart=TWO_PI-PI/2;
      arcstop=TWO_PI+PI;
    }
    if (x>mouseX && y<mouseY)
    {
      x += mouseX* 0.001* -1 *v;
      y += mouseY* 0.001*v;
      arcstart=PI;
      arcstop=TWO_PI+PI/2;
    }
    if (x<mouseX && y>mouseY)
    {
      x += mouseX* 0.001*v;
      y += mouseY* 0.001* -1*v;
      arcstart=0;
      arcstop=TWO_PI-PI/2;
    }
    if (x<mouseX && y<mouseY)
    {
      x += mouseX* 0.001*v;
      y += mouseY* 0.001*v;
      arcstart=PI/2;
      arcstop=TWO_PI;
    }
    if (x-35<mouseX && x+35>mouseX && y-35<mouseY && y+35>mouseY)
    {
      x=random(8)*100;
      y=random(8)*100;
    }
    if (x-50<mouseX && x+50>mouseX && y<mouseY)
    {
      y += mouseY* 0.001*v;
    }    
    if (y-50<mouseY && y+50>mouseY && x<mouseX)
    {
      x += mouseX* 0.001*v;
    }
    if (x-50<mouseX && x+50>mouseX && y>mouseY)
    {
      y += mouseY* 0.001* -1*v;
    }   
    if (y-50<mouseY && y+50>mouseY && x>mouseX)
    {
      x += mouseX* 0.001* -1 *v;
    }
  }
  void show()
  {
    fill(hexcolor);
    if (contshape>mouth && mousePressed)
    {
      ellipse(x, y, 50, 50);
      if (contshape>mouth*2)
      {
        contshape=0;
      }
    }
    else
    {
      arc(x, y, 50, 50, arcstart, arcstop);
      x += random(-10, 10) * 0.02 * v;
      y += random(-10, 10) * 0.02 * v;
    }
  }

  void movement()
  {
    if (bait)
    {
      rules();
    }
    if (randomspawn)
    {
      x=random(800);
      y=random(800);
    }
  }

  void boundary()
  {
    if (x>width) x=0;
    else if (y>height) y=0;
    else if (y<0) y=height;
    else if (x<0) x=width;
  }
}


