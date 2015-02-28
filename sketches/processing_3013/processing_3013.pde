
// mesh_node_link
//
// Node and link classes for NURBS fitting program
//
// Alasdair Turner 2009

// This is based on my NURBS surface code available here:  
// http://www.aac.bartlett.ucl.ac.uk/processing/samples/surface/

class Node {
  float u, v;
  PVector pos;
  Node(float a, float b) 
  {
    u = a;
    v = b;
  }
  void calcpos()
  {
    pos = new PVector();
    int u_deg = u_knots.length - u_ctrl_pts - 1;
    int v_deg = v_knots.length - v_ctrl_pts - 1;    
    for (int i = 0; i < u_ctrl_pts; i++) {
      for (int j = 0; j < v_ctrl_pts; j++) {
        float basisu = basisn(u,i,u_deg,u_knots);
        float basisv = basisn(v,j,v_deg,v_knots);
        PVector pk = PVector.mult( ctrl_pts[i][j], basisu * basisv);
        pos.add( pk );
      }
    }
  }
  void draw()
  {
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    noStroke();
    fill(#00dd88);
    box(3,3,3);
    popMatrix();
  }  
}

class Link
{
  Node a;
  Node b;
  float len;
  Link(Node x, Node y)
  {
    a = x;
    b = y;
    len = PVector.dist(a.pos,b.pos);
  }  
  void draw()
  {
    stroke(#ffffff);
    line(a.pos.x,a.pos.y,a.pos.z,b.pos.x,b.pos.y,b.pos.z); 
  }
  void move()
  {
    // note that the points are moved in u,v rather than x,y,z,
    // yet I use the x,y,z vector to extend / contract u,v
    // this relies on a direct mapping of x,z grid to u,v grid
    PVector atob = PVector.sub(b.pos,a.pos);
    len = atob.mag();
    // remove height dimension before moving to uv difference:
    atob.y = 0.0;
    atob.normalize();
    float fac = (desired_link_length - len) / desired_link_length;
    float duv = sqrt(sq(b.u-a.u)+sq(b.v-a.v));
    a.u -= atob.x * fac * 0.001;
    a.v -= atob.z * fac * 0.001;
    b.u += atob.x * fac * 0.001;
    b.v += atob.z * fac * 0.001;
    a.u = constrain(a.u,0.286,0.714);
    a.v = constrain(a.v,0.286,0.714);
    b.u = constrain(b.u,0.286,0.714);
    b.v = constrain(b.v,0.286,0.714);
    a.calcpos();
    b.calcpos();
  }
}

float basisn(float u, int k, int d, float [] knots)
{
  if (d == 0) {
    return basis0(u,k,knots);
  }
  else {
    float b1 = basisn(u,k,d-1,knots) * (u - knots[k]) / (knots[k+d] - knots[k]);
    float b2 = basisn(u,k+1,d-1,knots) * (knots[k+d+1] - u) / (knots[k+d+1] - knots[k+1]);
    return b1 + b2;
  }
}

float basis0(float u, int k, float [] knots)
{
  if (u >= knots[k] && u < knots[k+1]) {
    return 1;
  }
  else {
    return 0;
  }  
}  



