
//==========================================================
// sketch:  PG_RayCircleIntersection.pde
// intersection of a ray with a circle in 2D
// date:  2011-11-08
//by Gerd Platl 
//http://openprocessing.org/visuals/?visualID=45537
//==========================================================
 
Ray ray = new Ray (350,350,0, 0,0,0);
 
float radius = 100;
Circle circle = new Circle(new PVector (200,200), radius);
 
//----------------------------------------------------------
void setup()
{
  size(400, 400);
  ellipseMode(RADIUS);
  smooth();
}
//----------------------------------------------------------
void draw()
{
  background(188);
  ray.lookAt (mouseX, mouseY,0);
  PVector S1 = new PVector();
  PVector S2 = new PVector();
  int ip = rayCircleIntersection(ray, circle, S1, S2);
  fill(0);
  text ("press right mouse button to set ray origin",10,20);
  text ("intersectionPoints=" + ip,10,40);
 
  // draw circle
  if (ip > 0) fill(255); else fill(222);
  circle.draw();
 
  // draw ray
  ray.draw2d(); 
   
  // draw intersection points
  if (ip > 0)
  { fill(255,55,55);  
    ellipse (S1.x, S1.y, 3,3);  
    text ("S1: ["+(int)S1.x+", "+(int)S1.y+"]",10,60);
     
    fill(88,255,88);  
    ellipse (S2.x, S2.y, 3,3);  
    text ("S2: ["+(int)S2.x+", "+(int)S2.y+"]",10,80);
  }
}
//----------------------------------------------------------
void mousePressed()
{
  if (mouseButton == RIGHT) 
    ray.setOrigin (mouseX, mouseY,0);
}
 
//----------------------------------------------------------
// intersection of a ray with a circle in 2d
//           or of a ray with a sphere in 3d !!!
// input:  ray   ray origin and direction point
//         c     circle
// output: S1,S2 intersection points
// return: int   number of intersection points 0,1,2
//----------------------------------------------------------
int rayCircleIntersection(Ray ray, Circle c, PVector S1, PVector S2)
{
  PVector e = new PVector(ray.direction.x, ray.direction.y, ray.direction.z);   // e=ray.dir
  e.normalize();                            // e=g/|g|
  PVector h = PVector.sub(c.center,ray.origin);  // h=r.o-c.M
  float lf = e.dot(h);                      // lf=e.h
  float s = sq(c.radius)-h.dot(h)+sq(lf);   // s=r^2-h^2+lf^2
  if (s < 0.0) return 0;                    // no intersection points ?
  s = sqrt(s);                              // s=sqrt(r^2-h^2+lf^2)
 
  int result = 0;
  if (lf < s)                               // S1 behind A ?
  { if (lf+s >= 0)                          // S2 before A ?}
    { s = -s;                               // swap S1 <-> S2}
      result = 1;                           // one intersection point
  } }
  else result = 2;                          // 2 intersection points
 
  S1.set(PVector.mult(e, lf-s));  S1.add(ray.origin); // S1=A+e*(lf-s)
  S2.set(PVector.mult(e, lf+s));  S2.add(ray.origin); // S2=A+e*(lf+s)
 
  // only for testing
  fill(0);
  text (" s=" + nf( s,0,2),160,40);
  text ("lf=" + nf(lf,0,2),240,40);
 
  return result;
}
  
//----------------------------------------------------------
// rays are defined by origin and direction 
//----------------------------------------------------------
class Ray
{ PVector origin;
  PVector direction;
   
  Ray(float Ax, float Ay, float Az
     ,float Bx, float By, float Bz)
  { origin = new PVector(Ax, Ay, Az);
    direction = new PVector(Bx-Ax, By-Ay, Bz-Az);
  }
  Ray(PVector A, PVector B)
  { origin = new PVector(A.x, A.y, A.z);
    direction = PVector.sub(B,A);
  }
  Ray(Ray r)
  { origin = new PVector(r.origin.x, r.origin.y, r.origin.z);
    direction = new PVector(r.direction.x, r.direction.y, r.direction.z);
  }
  void set(PVector A, PVector B)
  { origin = new PVector(A.x, A.y, A.z);
    direction = PVector.sub(B,A);
  }
  void setOrigin(float x, float y, float z)
  { origin = new PVector(x, y, z);
  }
  void setOrigin(PVector pos)
  { origin = new PVector(pos.x, pos.y, pos.z);
  }
  void setDirection(float x, float y, float z)
  { direction = new PVector(x, y, z);
  }
  void setDirection(PVector dir)
  { direction = new PVector(dir.x, dir.y, dir.z);
  }
  void lookAt (float x, float y, float z)
  { direction = new PVector(x-origin.x, y-origin.y, z-origin.z);
  }
   
  void draw2d()
  { line(origin.x, origin.y, origin.x+direction.x, origin.y+direction.y);
    ellipse (origin.x, origin.y, 2,2);  
  }
  void draw3d()
  { line(origin.x, origin.y, origin.z, origin.x+direction.x, origin.x+direction.y, origin.z+direction.z);
  }
}
 
//----------------------------------------------------------
// circles are defined by center point and radius 
//----------------------------------------------------------
public class Circle
{ PVector center;
  float radius;
  Circle()
  { center = new PVector(0,0);
    radius = 1;
  }
  Circle(PVector center, float radius)
  { this.center = center;
    this.radius = radius; 
  }
  void draw()
  { ellipse(center.x, center.y, radius, radius);
    ellipse(center.x, center.y, 2,2);
  }
}
