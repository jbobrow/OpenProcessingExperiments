
P3Arc a;

PVector [] p =
{
  new PVector(0.0, 0.0, 0.0), 
  new PVector(50.0, 50.0, 10.0), 
  new PVector(100.0, 0.0, 50.0),
};


void setup()
{
  size(800, 800, P3D);
  a = new Arc();
}


void draw()
{
  background(255);  
  camera(200, 200.0, 200.0, 0.0, 0, 1.0, 0, 0, -1); //
  //rotateZ((float) frameCount/PI/50);
  //rotateZ((float) mouseX/PI/50);
  noFill();
  strokeWeight(1);
  stroke(0, 50);
  box(200);
  
  //p[1].x = mouseX;
  //p[1].y = mouseY;
  a.by2pointsAndTangent( p[0], p[2], p[1]);
  p[1].x = 10*sin(frameCount/PI/10);
  p[1].y = 20*sin(frameCount/PI/30);
  
  stroke(0, 0, 200);
  strokeWeight(1);

  a.draw();
  stroke(0, 0, 200, 125);
  strokeWeight(10);
  for(int i =0; i < p.length; i++)
  {
    point(p[i].x,p[i].y,p[i].z);
  }
  pushStyle();
  stroke(125);
  strokeWeight(1);
  line(a.center.x,a.center.y,a.center.z,a.p1.x,a.p1.y,a.p1.z);
  line(a.center.x,a.center.y,a.center.z,a.p3.x,a.p3.y,a.p3.z);
  popStyle();
}

class Arc
{
  PVector p1, p3, n, center;
  float radius;
  float angle;

  Arc()
  {
  }

  void draw()
  {

    beginShape();
    for (float u = 0; u <= angle; u+=angle/60)
    //for (float u = 0; u <= 2*PI; u+=PI/60)
    {
      PVector p = pointAt(u);
      vertex(p.x, p.y, p.z);
    }
    endShape();

    pushStyle();
    strokeWeight(10); 
    stroke(200, 0, 0);
    point(center.x, center.y, center.z);
    stroke(0,200,0);
    point(p3.x, p3.y, p3.z);
    popStyle();
    
  }

  PVector pointAt(float t)
  {
    PVector a = PVector.sub(center, p1);
    a.normalize();

    PVector b = a.cross(n);
    b.normalize();

    float x = center.x + radius * cos(t+PI) * a.x + radius * sin(t+PI) * b.x;
    float y = center.y + radius * cos(t+PI) * a.y + radius * sin(t+PI) * b.y;
    float z = center.z + radius * cos(t+PI)  *a.z + radius * sin(t+PI) * b.z;

    return new PVector(x, y, z);
  }

  void by3points(PVector pt1, PVector pt2, PVector pt3)
  {
    p1 = pt1;
    p3 = pt3;
    center = new PVector (pt1.x, pt1.y, pt1.z);

    PVector u = new PVector(pt2.x, pt2.y, pt2.z);
    PVector v = new PVector(pt3.x, pt3.y, pt3.z);
    u.sub(pt1);
    v.sub(pt1);
    
    
    n = u.cross(v);
    n.normalize();
    if (n.mag() > 0.999) //pts not in line
    {
      float u2 = u.dot(u); //u^2
      
      float v2 = v.dot(v); //v^2
      
      float uv = u.dot(v); //uv
      
      float d = 0.5/(u2*v2-uv*uv); // get determinant
      
      u.mult(v2 * (u2-uv) * d);    // u = u*k
   
      v.mult(u2 * (v2-uv) * d);    // v = v*l
      u.add(v);                    // w = k*u + l*v}
      center.add (u);              // M = A + w
      
      radius = u.mag();            // r = |w|
      
      calculateAngle();
    }
  }

  void calculateAngle()
  {
    //angles
    PVector cpt1 = new PVector(center.x, center.y, center.z);
    PVector cpt3 = new PVector(center.x, center.y, center.z);
    cpt1.sub(p1);
    cpt3.sub(p3);
    angle = PVector.angleBetween(cpt3, cpt1); 
    PVector ni = cpt1.cross(cpt3);
    float dir = n.dot(ni);
    if(dir > 0)
    {
      angle = 2*PI - angle;
    }
  }

  void by2pointsAndTangent(PVector pt1, PVector pt3, PVector ts)
  {
    p1 = pt1;
    p3 = pt3;
    //vector direction
    PVector vd = new PVector(p3.x - p1.x, p3.y - p1.y, p3.z - p1.z);
    //normal
    n = ts.cross(vd);
    n.normalize();
    if (n.mag() > 0.999) //pts not in line
    {
      //medium point
      PVector  pm = new PVector(vd.x/2+p1.x, vd.y/2+p1.y, vd.z/2+p1.z);
      //angle between chord and tangent
      float ang = PI/2 - PVector.angleBetween(vd, ts);
      float d1 = vd.mag()/2;
      //distance between center and chord mid point
      float d2 = d1 * tan(ang);
      //translation direction
      PVector v1 = ts.cross(vd);
      PVector v2 = v1.cross(vd);
      float v2L = v2.mag();
      //translation vector
      PVector v3 = new PVector (v2.x/v2L*d2, v2.y/v2L*d2, v2.z/v2L*d2);
      //center of the arc
      center = new PVector (pm.x + v3.x, pm.y + v3.y, pm.z + v3.z);
      radius = PVector.dist(p1, center);
      calculateAngle();
    }
  }
}

//a circle of radius 8, centered at 0,0 is (8cos t, 8sin t) t goes from 0 to 2pi.



