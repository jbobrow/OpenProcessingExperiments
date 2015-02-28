
private ArrayList points;
PImage p;

void setup()
{
  points = new ArrayList();

  smooth();
  size(450, 450);
  background(0);

  p = loadImage("StainGlass.jpg");
}

void keyPressed()
{
  if(key == ' ')
    background(0);
}

void mousePressed()
{
  fill(255);//random(0,255), random(0,255), random(0,255));
}

void mouseReleased()
{
  strokeWeight(10);

  for(int k = 0; k < points.size(); k++)
    for(int i = 0; i < points.size(); i++)
    {
      stroke(254);//random(0,255), random(0,255), random(0,255));
      line((PVector)points.get(k),(PVector)points.get(i));
    }

  rotate(TWO_PI/6);

  PVector diff = new PVector(width/2, height/2);

  for(int x = 0; x < width; x++)
    for(int y = 0; y < height; y++)
      if(brightness(get(x,y)) == 254)
        for(float theta = 0; theta < TWO_PI; theta += TWO_PI/6)
          set(PVector.add(rotatePoint(new PVector(x - width/2, y - width/2), theta), diff), p.get(x,y));

  points.clear();
}

void draw()
{
  translate(width/2, height/2);

  if(mousePressed)
  {
    strokeWeight(0);

    int x = mouseX - width/2;
    int y = mouseY - height/2;
    points.add(new PVector(x,y));
    for(float theta = 0; theta < TWO_PI; theta += TWO_PI/6)
      ellipse(rotatePoint(new PVector(x, y), theta), 10, 10);
  }
}

public PVector rotatePoint(PVector p, float theta)
{
  int x = (int)p.x;
  int y = (int)p.y;

  return new PVector(x*cos(theta) - y*sin(theta), x*sin(theta) + y*cos(theta));
}

void ellipse(PVector p, int w, int h)
{
  ellipse(p.x, p.y, w, h);
}

void set(PVector p, color c)
{
  set((int)p.x, (int)p.y, c);
}

void line(PVector p1, PVector p2)
{
  line(p1.x, p1.y, p2.x, p2.y);
}


