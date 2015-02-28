
class GlassNode 
{
  int num;
  float diam;
  float nx, ny, nz;
  float angle = 0;
  float angle1 = 0;
  PVector[] nodes;

  // number of nodes, diameter, and which floor it is
  GlassNode (int number, float diameter, float f, float ratio, boolean isTruss) 
  {
    num = number;
    diam = diameter;
    ny = - f * floorHeight * ratio ;
    angle = TWO_PI / num;   
    if (isTruss) {
      if (f % 2 == 0) angle1 = -rotAngle;  // for the truss structure
    }  
    else {
      if (f % 2 != 0)  angle1 = rotAngle * ratio; //for the glaze fabrication
    }
    nodes = new PVector[num+2];
    for (int i=0; i<nodes.length; i++) {
      nx = diam * cos(angle * i + angle1 ) /2;
      nz = diam * sin(angle * i + angle1) /2;
      nodes[i] = new PVector(nx, ny, nz);
    }
  }

  void display()
  { 
    stroke(255, 255, 0, 200);
    strokeWeight(1.5);
    noFill();
    for (int i=0; i<nodes.length; i++) {
      pushMatrix();
      translate(nodes[i].x, nodes[i].y, nodes[i].z);
      box(5, 5, 5);
      popMatrix();
    }
  }
}




