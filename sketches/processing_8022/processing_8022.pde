
/**
* RotationTraces by Bejoscha<BR>
*  [R]       starts/stops rotation of figure<BR>
*  [SPACE]   draws/hides vertices<BR>
*  [+][-][0] increase/reduce/zero rotation speed<BR>
*  [S][N]    turns smoothing on/off<BR>
*  [D]       makes all vertices the same distance from the origin<BR>
*  [A]       spreads vertices in equidistant angular steps<BR>
*  [C]       arranges vertices on a circle<BR>
*  [T]       toggles "moving traces" vs. 360-degree trace<BR>
* <BR>
* If vertices are shown:<BR>
* Left-Click & Drag to move them<BR>
* Left-Click to insert new ones<BR>
* Right-Click to delete (min 3 vertices)<BR>
*/

RotationObject R;
boolean doRotate;
boolean doRunningTrace;
float angle;

void setup()
{
  size(600,500);
  background(0);
  stroke(255);
  noFill();
  R = new RotationObject(width/4,height/4,100,5);
  doRotate=false;
  doRunningTrace=true;
  angle=1;
}

void draw()
{
  R.ClearFigure();
  R.DrawFigure();
  R.DrawShadowFigure(360);
  if (doRotate) R.Turn(angle);
  if (doRunningTrace) R.RunningTracePoint();
  else R.Draw360degreeTrace();
}

void mousePressed()
{
  if (R.GetDrawDots())  
      {
        if (!R.SelectVertexUnderMouse()&&(mouseButton == LEFT))  R.AddVertex(new PVector(mouseX,mouseY));      // Select a Vertex if clicked on or create one
        if (mouseButton == RIGHT) R.DeleteVertex();  // Delete clicked on Vertex if total VertexNr>3;
      }

}

void mouseDragged()
{
  if (R.GetDrawDots()) 
   {
     R.DragActiceVertexToMouse();  // Drag selected vertex if points are shown.
   }
}

void keyPressed()
{
  if (key==' ') R.SetDrawDots(!R.GetDrawDots());
  if (key=='r') doRotate=!doRotate;
  if (key=='t') 
      {
        R.ClearTrace();
        doRunningTrace=!doRunningTrace;
      }
  if (key=='+')angle+=0.125;
  if (key=='-')angle-=0.125;
  if (key=='0')angle=0;
  if (key=='s') smooth();
  if (key=='n') noSmooth();
  if (key=='d') R.MakeItEquidistant();
  if (key=='a') R.MakeItEquiangular();
  if (key=='c') 
    {
      R.MakeItEquiangular();
      R.MakeItEquidistant();
    }
}

