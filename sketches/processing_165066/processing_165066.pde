
/* @pjs preload="bg.jpg"; */

final int NB = 30;
Hair[] hairs;
PImage pim;
MyColor;
float dispersion = 1.1;
Boolean imLoaded = false;

void setup()
{
  pim = loadImage("bg.jpg");
  size(600, 600, P2D);
  println(0);
}

void initialize()
{ 
  myCol = new MyColor();
  hairs = new Hair[NB];
  for (int i = 0; i < NB; i++)
  {
    hairs[i] = new Hair(map(i, 0, NB, -PI/5, PI/5));//random(-PI/5, PI/5)
  }

  imLoaded = true;
  refresh();
  println(222);
}

void draw()
{
  if (imLoaded)
  {
    if (pmouseX != mouseX || pmouseY != mouseY)
    {
      refresh();
    }
  }
}

void refresh()
{
  myCol.update();
  tint(red(myCol.getColor())-50, green(myCol.getColor())-50, blue(myCol.getColor())-50);
  image(pim, 0, 0);

  noFill();
  for (int i = 0; i < NB; i++)
  {
    hairs[i].display();
  }
}

void keyPressed()
{
  if (key == 'a')
  {
    dispersion = min(dispersion+.1, 2.5);
  } else if (key == 'q')
  {
    dispersion = max(dispersion-.1, .5);
  }
}

void mousePressed()
{
  initialize();
}

class Hair
{
  final static int LENGTH = 220;//number of segments
  final float DIST_MAX = 4.5;//length of each segment
  PVector[] pos;//position of each segment
  float R;

  Hair(float r)
  {
    R = r;
    pos = new PVector[LENGTH];
    for (int i = 0; i < LENGTH; i++)
    {
      pos[i] = new PVector(random(width), random(height));
    }
  }

  void display()
  {
    pos[0] = new PVector(mouseX, mouseY);
    for (int i = 1; i < LENGTH; i++)
    {
      if (PVector.dist(pos[i], pos[i-1]) > DIST_MAX)
      {

        PVector tmp = PVector.sub(pos[i-1], pos[i]);
        tmp.normalize();

        float tmpX = tmp.x;
        if (i == 1)
        {         
          //tmp.rotate(R);
          tmp.x = tmpX*cos(R) - tmp.y*sin(R);
          tmp.y = tmpX*sin(R) + tmp.y*cos(R);
        } else
        {
          //tmp.rotate(R/pow(i, dispersion));
          float theta = R/pow(i, dispersion);
          tmp.x = tmpX*cos(theta) - tmp.y*sin(theta);
          tmp.y = tmpX*sin(theta) + tmp.y*cos(theta);
        }

        tmp.mult(DIST_MAX);
        pos[i] = PVector.sub(pos[i-1], tmp);
      }
    }

    beginShape();
      stroke(myCol.getColor(), 100);//, map(i, 0, LENGTH-1, 230, 0));
    for (int i = LENGTH-1; i > -1; i--)
    {


      vertex(pos[i].x, pos[i].y);
      /*
      rectMode(CENTER);
       if(i > 0)
       {
       pushMatrix();
       translate(pos[i].x, pos[i].y);
       rotate(atan2(pos[i].y - pos[i-1].y, pos[i].x - pos[i-1].x) + PI/2);
       rect(0, 0, 10, 10);
       popMatrix();
       }
       */
    }
    endShape();
  }
}


class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .4;
  final static float maxSpeed = .7;
  MyColor()
  {
    init();
  }
  
  public void init()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  
  public void update()
  {
    Rspeed = ((R += Rspeed) > 240 || (R < 40)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 240 || (G < 40)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 240 || (B < 40)) ? -Bspeed : Bspeed;
  }
  
  public color getColor()
  {
    return color(R, G, B);
  }
}

