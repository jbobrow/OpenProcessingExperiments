
String txt = "AbcdEfghijklMnopqrstuvwXYz";

class Text
{
  float x, y, vx, vy;
  boolean dead = false;
  int which_char;
  int change_txt_timing;
  Text(float _x, float _y) 
  {
    x=_x+random(-3, 3);
    y=_y+random(-3, 3);
    vx=0;
    vy=0;
    which_char = int(random(0, txt.length()));
  }

  void update()
  {
    x+=vx;
    y+=vy;
  }

  void display()
  {
    fill(0);
    pushMatrix();
    translate(x, y);
    text(txt.charAt(which_char), 0, 0);
    popMatrix();
  }
}


ArrayList texts;
float mvelx, mvely;


void setup()
{
  size (600, 600);
  noSmooth();
  PFont font;
  font = loadFont("Calibri-20.vlw");
  textFont(font, 20);
  texts = new ArrayList();
}

float x, y;

void draw()
{
  x=random(width);
  y=random(height);
  background (255);
  float push = .0004;
  fill(0);
  ellipse(x,y,20, 20);


  for (int i=0; i<1; i++)
  {
    texts.add(new Text(random(width), random(height)));
  }

  for (int i=0; i<texts.size (); )
  {
    Text t= (Text) texts.get(i);
    if (frameCount%1000==0)
    {
      t.dead=true;
    }
    if (t.dead==true)
    {
      texts.remove(i);
    } else
    {
      for (int j = i+1; j< texts.size (); j++)
      {
        Text t2= (Text) texts.get(j);
        float x1 = t.x;
        float y1 = t.y;
        float x2 = t2.x;
        float y2 = t2.y;
        if (dist(x1, y1, x2, y2) < random(20, 50))
        {
          float dx = x1-x2;
          float dy = y1-y2;
          t.vx+=(dx*push);
          t.vy+=(dy*push);
          t2.vx-=dx*push;
          t2.vy-=dy*push;
        }
      }

      t.update();
      t.display();
      i++;
    }
  }
}
