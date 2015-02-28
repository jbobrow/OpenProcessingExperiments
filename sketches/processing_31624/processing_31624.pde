
//Linart, by Dlaor
 
class Line
{
  PVector Pos, PPos, Vel;
  float Dir;
  boolean Dead;
  int TurnThres;
  color Color;
  Line(PVector pos, float dir, color col)
  {
    Pos = pos;
    PPos = Pos;
    Dir = dir;
    Dead = false;
    Vel = new PVector(0, 0);
    TurnThres = 10;
    Color = col;
     
    if (random(40) < 1)
    {
      Color = color(random(255), 255, 255);
    }
  }
  void Update()
  {
    if (Dead) return;
    PPos = Pos;
     
    if (TurnThres > 0)
      TurnThres--;
    ResetThres = 200;
     
    Vel.x = sin(radians(Dir));
    Vel.y = cos(radians(Dir));
     
    if (random(100) < 1 && TurnThres == 0)
    {
      TurnThres = 2;
      if (random(2) < 1)
        Dir += 90;
      else
        Dir -= 90;
    }
     
    if (LookInFuture(4) && TurnThres == 0)
    {
      TurnThres = 2;
      Dir += 90;
    }
     
    if (random(100) < 1)
    {
      NewLine(Pos, Dir + 90, Color);
      NewLine(Pos, Dir - 90, Color);
      if (random(2) < 1) Dead = true;
    }
     
    Pos = PVector.add(Pos, Vel);
     
    if (Pos.x > width || Pos.x < 0 || Pos.y > height || Pos.y < 0 || LookInFuture(1))
      Dead = true;
  }
   
  void Draw()
  {
    if (Dead) return;
    stroke(Color);
    line(Pos.x, Pos.y, PPos.x, PPos.y);
  }
   
  boolean LookInFuture(int mul)
  {
    return get((int)(Pos.x + Vel.x * mul), (int)(Pos.y + Vel.y * mul)) != BGColor;
  }
}
 
Line[] Lines;
int ResetThres = 200;
color BGColor = color(50);
 
void setup()
{
  size(500, 500);
  colorMode(HSB);
  Lines = new Line[200];
  Reset();
}
 
void draw()
{
  ResetThres--;
  if (ResetThres < 1)
    Reset();
   
  for (int i = 0; i < Lines.length; i++)
  {
    if (Lines[i] != null)
    {
      Lines[i].Update();
      Lines[i].Draw();
    }
  }
  //saveFrame("lines-####.png");
}
 
void NewLine(PVector pos, float dir, color col)
{
  for (int i = 0; i < Lines.length; i++)
  {
    if (Lines[i] == null || Lines[i].Dead)
    {
      Lines[i] = new Line(pos, dir, col);
      break;
    }
  }
}
 
void Reset()
{
  background(BGColor);
  NewLine(new PVector(1, (int)random(height)), 90, color(255));
}                                   
