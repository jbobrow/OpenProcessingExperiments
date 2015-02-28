

//----------------------------------------------------------
//     file:  PG_CloseCurve1
//     date:  2011-01-22  V1.0
//   author:  Ing. Gerd Platl.   
//  version:  tested with processing 1.2.1
//  purpose:  demonstrate how to draw a close curve
// handling:  Click left mouse button to add a curve point.
//            Click right mouse button to remove a curve point.
//----------------------------------------------------------
private ArrayList vertices;
private PVector mousePos;
int xSize = 400;
int ySize = 400;
//----------------------------------------------------------
void setup()
{
  vertices = new ArrayList();
  vertices.add(new PVector(xSize/2, ySize/2));

  size (xSize, ySize);
  textSize(25);
  smooth();
  fill(500,0,0,40); 
  stroke(150,50,30,100);
  strokeWeight(5);
}
//----------------------------------------------------------
void draw()
{
  background(255);
  int cn = vertices.size();
  text ("add point -> left mouse button", 9, 29);
  text ("delete point -> right mouse button", 9, 59);
  text ("n="+cn, 9, 89);
  
  switch (cn)
  {
    case 1:                          // draw point
      { ellipse(mouseX, mouseY, 5,5);  
        break;
      }  
    case 2:                          // draw line
      { PVector P = (PVector)vertices.get(0);
        line(mouseX,mouseY, P.x, P.y); 
        break;
      }  
    default:                         // draw closed curve
    { 
      PVector P;
      beginShape();
      for (Iterator ni = vertices.iterator(); ni.hasNext();)
      {
        P = (PVector)ni.next();
        curveVertex(P.x, P.y);
      }        
    
      // close curve by overlapping the first three points
      for (int ni=0; ni<3; ni++)
      {
        P = (PVector)vertices.get(ni);
        curveVertex(P.x, P.y);
      }
      endShape();
    }
  }  
  
  // draw vertex positions
  beginShape(POINTS);
  for (Iterator ni=vertices.iterator(); ni.hasNext();)
  {
    PVector P = (PVector)ni.next();
    vertex(P.x, P.y);  
  }
  endShape();
}
//----------------------------------------------------------
void mouseMoved()      // set current vertex position
{
  mousePos = new PVector(mouseX,mouseY);
  vertices.set (vertices.size()-1, mousePos);
}
//----------------------------------------------------------
void mouseClicked()
{
  if (mouseButton == LEFT)
  {                               // add a vertex
    mousePos = new PVector(mouseX,mouseY);
    vertices.add(mousePos);    
  }  
  else 
  {                               // remove a vertex
    int cn = vertices.size();
    if (cn > 1) 
    { 
      vertices.remove(cn-1); 
      mouseMoved();      // set current vertex position
    }
  }
}


