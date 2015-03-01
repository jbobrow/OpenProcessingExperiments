
/* @pjs preload="gorilla.jpg"; */

Buoy[] buoys;
PImage pimg;
int margin = 30, nbW = 30, nbH = 20, w, h, mode = 0;
float maxD = 80;
PVector m;

void setup()
{
  size(550, 400, OPENGL);
  noStroke();
  rectMode(CENTER);
  pimg = loadImage("gorilla.jpg");

  w = (int)((pimg.width-2*margin) / nbW);
  h = (int)((pimg.height-2*margin) / nbH);
  buoys = new Buoy[nbW*nbH];
  for (int i = 0; i < nbW; i++)
  {
    for (int j = 0; j < nbH; j++)
    {
      buoys[i + j*nbW] = new Buoy(map(i, 0, nbW-1, margin, width-margin), map(j, 0, nbH-1, margin, height-margin));
    }
  }
}

void draw()
{
  background(70);
  computeBuoys();
  display();
}

void computeBuoys()
{
  m = new PVector(mouseX, mouseY);
  Buoy b;
  for (int i = 0; i < nbW*nbH; i++)
  {    
    buoys[i].move();
  }
}

void display()
{
  Buoy b, bx, bxy, by;
  beginShape(QUAD);
  texture(pimg);        
  for (int i = 0; i < nbW-1; i++)
  {
    for (int j = 0; j < nbH-1; j++)
    {
      b = buoys[i + j*nbW];//top left corner
      bx = buoys[i + 1 + j*nbW];//top rigth corner
      by = buoys[i + (j+1)*nbW];//bottom right corner
      bxy = buoys[i + 1 + (j+1)*nbW];//bottom left corner
      if (mode == 1)
      {     
        rect(b.pos.x, b.pos.y, 3, 3);
      } else
      {
        vertex(b.pos.x, b.pos.y, w*i, h*j);
        vertex(bx.pos.x, bx.pos.y, w*(i+1), h*j);
        vertex(bxy.pos.x, bxy.pos.y, w*(i+1), h*(j+1));
        vertex(by.pos.x, by.pos.y, w*i, h*(j+1));
      }
    }
  }
  endShape();
}

void keyPressed()
{
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT))
  {
    maxD = constrain(maxD + (keyCode == RIGHT ? 1 : -1) * 20, 20, 300);
  } else
  {
    mode = (mode+1)%2;
  }
}

class Buoy
{
  PVector o, pos, f = new PVector(0, 0);
  Buoy(float p_x, float p_y)
  {
    o = new PVector(p_x, p_y);
    pos = o.get();
  }

  void move()
  {
    f.mult(.92);
    PVector tmpv;
    float d = PVector.dist(pos, m);
    if (d < 6) d = 6;//prevent erratic behavior
    if (d < maxD)//buoy is disturbed by the mouse
    {
      tmpv = m.get();
      tmpv.sub(pos);
      float a = 0.0083 * cos(map(d, 0, maxD, 0, HALF_PI));
      tmpv.mult((mousePressed ? 1 : -1) * a * 100 / d);
      f.add(tmpv);
    }
    //buoy is attracted to its original position
    tmpv = o.get();
    tmpv.sub(pos);
    tmpv.mult(.03);
    f.add(tmpv);    
    pos.add(f);
  }
}



