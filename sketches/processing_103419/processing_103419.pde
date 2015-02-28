
int vertices = 6;
int vertices_drawn = 0;
boolean firstClick = true;
int[] xPositions = new int[vertices];
int[] yPositions = new int[vertices];
int[] xMidpoints = new int[vertices];
int[] yMidpoints = new int[vertices];

void setup()
{
  size(600,600);
  stroke(255);
  strokeWeight(3);
  background(0);
}

void draw()
{
    if (vertices_drawn == 0)
    {
    background(0);
    String p = "Click the screen to get started.";
    String r = "Click " + vertices + " points, and then hit ENTER to draw the next inscribed polygon.";
    String s = "(Or, you can type any number from 3-9 to change the number of vertices to draw.)";
    String t = "Hit SHIFT to clear everything.";
    fill(255);
    textSize(14);
    text(p, 20, 40);
    text(r, 20, 70);
    text(s, 20, 100);  
    text(t, 20, 130);
    }
}

void mousePressed() {
  if (vertices_drawn < vertices && firstClick == false)
  {
   FirstPoint point = new FirstPoint(mouseX,mouseY);
      xPositions[vertices_drawn] = point.xPos;
      yPositions[vertices_drawn] = point.yPos;
      point.drawPoint();
      vertices_drawn = vertices_drawn + 1;
  }
  if (vertices_drawn == vertices)
  {
    drawPolygon();
  }
  if (firstClick == true)
  {
     firstClick = false;
  }
}

void keyPressed()
{
  
  if (keyCode == SHIFT)
  {
    reset();    
  }
  if (keyCode == ENTER && vertices_drawn == vertices)
  {
   drawPolygon();
  }
  if (keyCode == 51 && vertices_drawn == 0)
  {
    vertices = 3;
  }
  if (keyCode == 52 && vertices_drawn == 0)
  {
    vertices = 4;
  }
  if (keyCode == 53 && vertices_drawn == 0)
  {
    vertices = 5;
  }
  if (keyCode == 54 && vertices_drawn == 0)
  {
    vertices = 6;
  }
  if (keyCode == 55 && vertices_drawn == 0)
  {
    vertices = 7;
  }
  if (keyCode == 56 && vertices_drawn == 0)
  {
    vertices = 8;
  }
  if (keyCode == 57 && vertices_drawn == 0)
  {
    vertices = 9;
  }
}

void drawPolygon() {

  //Takes care of drawing the polygon. The 0th and the nth vertex are directly connected, which could be done more cleverly with modular arithmetic, I think.
   line(xPositions[0],yPositions[0],xPositions[vertices - 1],yPositions[vertices - 1]);
   for (int i = 0; i < vertices - 1; i++)
   {
      line(xPositions[i],yPositions[i],xPositions[i+1],yPositions[i+1]);
   }
   
  //Takes care of the midpoints. These two steps are separate to avoid entanglement between drawing and calculation, which was an issue.
      for (int i = 0; i < vertices - 1; i++)
      {
      xMidpoints[i] = ( xPositions[i] + xPositions[i+1])/2;
      yMidpoints[i] = ( yPositions[i] + yPositions[i+1])/2;
      }
      xMidpoints[vertices - 1] = ( xPositions[0] + xPositions[vertices - 1])/2;
      yMidpoints[vertices - 1] = ( yPositions[0] + yPositions[vertices - 1])/2;
      drawNextPolygon();
   
}

void drawNextPolygon() {
  stroke(random(255),random(255),random(255));
  for (int i = 0; i<vertices; i++)
  {
      xPositions[i] = xMidpoints[i];
      yPositions[i] = yMidpoints[i];
  }
}

void reset()
{
  background(0);
    vertices_drawn = 0;
    int[] xPositions = new int[vertices];
    int[] yPositions = new int[vertices];
    int[] xMidpoints = new int[vertices];
    int[] yMidpoints = new int[vertices];
    stroke(255);
}

class FirstPoint {
  int xPos, yPos;
  FirstPoint (int x, int y)
  {
    xPos = x;
    yPos = y;
  }
  void drawPoint()
  {
    ellipse(xPos,yPos,10,10);
  }
  
}
