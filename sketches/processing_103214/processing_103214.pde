
int vertices = 6;
int vertices_drawn = 0;
float[] xPositions = new float[vertices];
float[] yPositions = new float[vertices];
float[] xMidpoints = new float[vertices];
float[] yMidpoints = new float[vertices];

void setup()
{
  size(800, 600);
  stroke(255);
  strokeWeight(3);
  background(0);
}

void draw()
{
  String s = "Click " + vertices + " points, and then hit ENTER to draw the next inscribed polygon.";
  String t = "Hit BACKSPACE to clear everything.";
  fill(255);
  textSize(20);
  text(s, 40, 40);  // Text wraps within text box
  text(t, 40, 70);
}

void mousePressed() {
  if (vertices_drawn < vertices)
  {
    FirstPoint point = new FirstPoint(mouseX, mouseY);
    xPositions[vertices_drawn] = point.xPos;
    yPositions[vertices_drawn] = point.yPos;
    point.drawPoint();
    vertices_drawn = vertices_drawn + 1;
  }
  if (vertices_drawn == vertices)
  {
    drawPolygon();
  }
}

void keyPressed()
{

  if (keyCode == BACKSPACE)
  {
    reset();
  }
  if (keyCode == ENTER && vertices_drawn == vertices)
  {
    drawPolygon();
  }
}

void drawPolygon() {

  //Takes care of drawing the polygon. The nth and the 0th vertex are connected with help from modulo operator
  for (int i = 0; i < vertices; i++)
  {
    line(xPositions[i], yPositions[i], xPositions[(i+1)%vertices], yPositions[(i+1)%vertices]);
  }

  //Calculate Midpoints
  for (int i = 0; i < vertices; i++)
  {
    xMidpoints[i] = 0.5*( xPositions[i] + xPositions[(i+1)%vertices]);
    yMidpoints[i] = 0.5*( yPositions[i] + yPositions[(i+1)%vertices]);
//    ellipse(xMidpoints[i], yMidpoints[i], 10, 10);
  }
  drawNextPolygon();
}

void drawNextPolygon() {
  stroke(random(255), random(255), random(255));
  //cloned, otherwise we store the reference!
  xPositions = xMidpoints.clone(); 
  yPositions = yMidpoints.clone();
}

void reset()
{
  background(0);
  vertices_drawn = 0;
  float[] xPositions = new float[vertices];
  float[] yPositions = new float[vertices];
  float[] xMidpoints = new float[vertices];
  float[] yMidpoints = new float[vertices];
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
    ellipse(xPos, yPos, 10, 10);
  }
}
