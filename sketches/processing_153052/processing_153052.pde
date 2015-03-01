
Unit[][] units;
int xnum, ynum;

int shapeSize;
int alfa = 50;

boolean circles = true;
color bgcolour = 0;

int direction;
int ii, jj;
int di = 5;
int dj = 5;
int minStroke, maxStroke;

boolean displayDiagnostics = false;


void setup() 
{
  size(500, 500);
  background(bgcolour);
  frameRate(12);

  rectMode(CENTER);
  smooth();
  noStroke();

  xnum = ynum = 20;
  shapeSize = (int)width/xnum;
  minStroke = shapeSize / 20; 
  maxStroke = shapeSize;
  units = new Unit[xnum][ynum];
  for (int j = 0; j < ynum; j++)
  {
    for (int i = 0; i < xnum; i++)
    {
      PVector pos = new PVector((i + 0.5) * shapeSize, (j + 0.5) * shapeSize);
      units[i][j] = new Unit(pos, shapeSize, 192);
    }
  }

  ii = (int)random(xnum);
  jj = (int)random(ynum);
}



void draw() 
{
  findNextUnit();

  for (int j = 1; j < ynum - 1; j++)
  {
    for (int jy = max(0, j - dj); jy < min(ynum, j + dj) && jy != j; jy++)
    {
      Unit unitA = units[ii][j];
      Unit unitB = units[ii][jy];
      if (unitA.switchedOn && unitB.switchedOn)
      {
        if (unitA.colour == unitB.colour)
        {
          stroke(unitA.colour, alfa / 10);
          strokeWeight(map(mouseY, 0, height, minStroke, maxStroke));
          line(unitA.pos.x, unitA.pos.y, unitB.pos.x, unitB.pos.y);
          noStroke();
          if (displayDiagnostics)
          {
            fill(170, 151, 58, 192);
            ellipse(unitA.pos.x, unitA.pos.y, 10, 10);
            fill(95, 67, 82, 192);
            ellipse(unitB.pos.x, unitB.pos.y, 10, 10);
          }
        }
      }
    }
  }
  for (int i = 1; i < xnum - 1; i++)
  {
    for (int ix = max(0, i - di); ix < min(xnum, i + di) && ix != i; ix++)
    {
      Unit unitA = units[i][jj];
      Unit unitB = units[ix][jj];
      if (unitA.switchedOn && unitB.switchedOn)
      {
        if (unitA.colour == unitB.colour)
        {
          stroke(unitA.colour, alfa / 10);
          strokeWeight(map(mouseX, 0, height, minStroke, maxStroke));
          line(unitA.pos.x, unitA.pos.y, unitB.pos.x, unitB.pos.y);
          noStroke();
          if (displayDiagnostics)
          {
            fill(255, 192);
            ellipse(unitA.pos.x, unitA.pos.y, 10, 10);
            fill(0, 192);
            ellipse(unitB.pos.x, unitB.pos.y, 10, 10);
          }
        }
      }
    }
  }

  units[ii][jj].display();
}

void findNextUnit()
{
  direction = (int) random(8);

  if (direction == 0) 
  {  
    jj --;
    checkBounds();
    units[ii][jj].colour = color(7, 15, 38);
  } 
  else if (direction == 1) 
  {
    ii ++;
    jj --;
    checkBounds();
    units[ii][jj].colour = color(27, 34, 89);
  } 
  else if (direction == 2) 
  {
    ii ++;
    checkBounds();
    units[ii][jj].colour = color(69, 75, 139);
  } 
  else if (direction == 3) 
  {
    ii ++;
    jj ++;
    checkBounds();
    units[ii][jj].colour = color(61, 70, 37);
  }
  else if (direction == 4) 
  {
    jj ++;
    checkBounds();
    units[ii][jj].colour = color(86, 101, 67);
  }
  else if (direction == 5) 
  {
    ii --;
    jj ++;
    checkBounds();
    units[ii][jj].colour = color(151, 131, 102);
  }
  else if (direction == 6) 
  {
    ii --;
    checkBounds();
    units[ii][jj].colour = color(208, 205, 190);
  }
  else if (direction == 7) 
  {
    ii --;
    jj --;
    checkBounds();
    units[ii][jj].colour = color(255);
  }
  units[ii][jj].switchedOn = true;
}

void checkBounds()
{
  if (ii > xnum - 1) ii = 0;
  if (ii < 0) ii = xnum - 1;
  if (jj < 0) jj = ynum - 1;
  if (jj > ynum - 1) jj = 0;
}

void keyReleased()
{
  if (key == 'd' || key == 'D') displayDiagnostics = !displayDiagnostics;
  if (key == 'c' || key == 'C')circles = !circles;
  if(key == '1') strokeCap(ROUND);
  if(key == '2') strokeCap(SQUARE);
  if(key == '3') strokeCap(PROJECT);
  if(key == 's' || key == 'S') saveFrame("####.png");
}  

void mouseReleased()
{
  background(bgcolour = (bgcolour == 0 ? 255 : 0));
}


class Unit
{
  PVector pos;
  float dia;
  color colour;
  boolean switchedOn;
  
  Unit(PVector pos, float dia, color colour)
  {
    this.pos = pos;
    this.dia = dia;
    this.colour = colour;
  }
  
  void display()
  {
    fill(colour, alfa);
    if(switchedOn)
    {
      if(circles) ellipse(pos.x, pos.y, dia, dia);
      else rect(pos.x, pos.y, dia, dia);
    }
  }
}
  


