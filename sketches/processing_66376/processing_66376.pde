
////////////-------------- UI BUTTON FUNCTIONS --------------------\\\\\\\\\\
public void controlEvent(ControlEvent theEvent)
{
  if (theEvent.controller().name() == "Restart")
  {
    points = new float[0][2];
    voronoi = new Voronoi(points);
    regions = voronoi.getRegions();
  }
}


//////////////////////---------------------- INTERACTIVITY FUNCTIONS FOR MOUSE CONTROLS  -------------------------\\\\\\\\\\\\\\\\\\\\\\\\\
void mousePressed()
{
  if(mouseButton == RIGHT)
  {
      points = (float[][])append(points, new float[]{mouseX, mouseY});
  } 
}

void mouseMoved() 
{
  // if myRegions is null then mesh is not ready
  if (regions==null) return;
  
  //Initializes the Voronoi cells (keeps them updated when created)
  if(triangleMode == false)
  {
    voronoi = new Voronoi(points);
    regions = voronoi.getRegions();
  }
  if(triangleMode == true)
  {
    DrawTriangles();
  }
}
//////////////////////////------------------------------ WORKS FOR WHEN MODIFYING VORONOI -----------------------------------\\\\\\\\\\\\\\\\\
void mouseDragged() 
{
  // if myRegions is null then mesh is not ready
  if (regions==null) return;

  for (int i=0;i<points.length;i++)
  {
    if (mouseX > points[i][0] - selectDistance && mouseX < points[i][0] + selectDistance && mouseY > points[i][1] - selectDistance && mouseY < points[i][1] + selectDistance)
    {
      if (mousePressed == true)
      {
        if (mouseButton == LEFT)
        {        
          selected = true;
          index = i;
        }
      }
    }
  }
  if (selected == true)
  {
    points[index][0]=mouseX;
    points[index][1]=mouseY;
  }
  mouseMoved();
}

