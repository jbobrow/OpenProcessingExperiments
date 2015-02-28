
float pointWidth = 10;
float pointHeight = 10;
float radius = 6;

color sinColor = color(0, 183, 235);
color cosColor = color(50, 120, 120);
color tanColor = color(100, 40, 0);

class Coord
{
  Coord(float X, float Y)
  {
    x = X;
    y = Y;
  }
  float x;
  float y;
}

ArrayList<Coord> sinPoints;
ArrayList<Coord> cosPoints;
ArrayList<Coord> tanPoints;

void setup()
{
  size(600, 600);
  sinPoints = new ArrayList<Coord>();
  cosPoints = new ArrayList<Coord>();
  tanPoints = new ArrayList<Coord>();
  
  background(255,255,255);
  for(int x = 0; x < width; ++x)
  {
    Coord c = new Coord(x , width/2 + sin(radians(x))* (height / 2));
    sinPoints.add(c);
    
    Coord d = new Coord(x , width/2 + cos(radians(x))* (height / 2));
    cosPoints.add(d);
    
    Coord e = new Coord(x , width/2 + tan(radians(x))* (height / 2));
    tanPoints.add(e);
  }
}

void draw()
{
  for(Coord c : sinPoints)
  {
    fill(sinColor);
    noStroke();
    //stroke(0,0,200);
    rect(c.x, c.y, pointWidth, pointHeight, radius );
  }
  
  for(Coord d : cosPoints)
  {
    fill(cosColor);
    noStroke();
    //stroke(0,0,200);
    rect(d.x, d.y, pointWidth, pointHeight, radius );
  }
  
  for(Coord e : tanPoints)
  {
    fill(tanColor);
    noStroke();
    //stroke(0,0,200);
    rect(e.x, e.y, pointWidth, pointHeight, radius );
  }
}


