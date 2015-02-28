

//==========================================================
// sketch:  PG_RaySphereIntersection.pde
// intersection of a ray with a sphere 
// date:  2011-11-08
//==========================================================

Ray ray = new Ray (350,250,80, 20,20,100);

float radius = 100;
TSphere testSphere = new TSphere(new PVector (200,200), radius);
TSphere helpSphere = new TSphere(new PVector (200,200), 3);

//----------------------------------------------------------
void setup() 
{
  size(400, 400, P3D);
  sphereDetail(44);
  smooth();
  ortho(-width/2, width/2, -height/2, height/2, -1, 1); 
}
//----------------------------------------------------------
void draw()
{
  background(188);
  lights();
  ray.lookAt (mouseX, mouseY, 50);
  // println (ray.origin + "   " + ray.direction);
  
  // draw ray
  strokeWeight(2);
  stroke (0);     // black color
  ray.draw3d();  
  
  // draw sphere
  fill(244,177);   // transparent gray color
  stroke (244,44);
  noStroke();
  testSphere.draw();
  
  PVector S1 = new PVector();
  PVector S2 = new PVector();
  int ip = raySphereIntersection(ray, testSphere, S1, S2);
  fill(0);
  showText ("press right mouse button to set ray origin",10,20);
  showText ("intersectionPoints=" + ip,10,40);

  // draw intersection points
  if (ip > 0)
  { fill(255,55,55);   
    noStroke();
    helpSphere.set (S1, 3.0);   
    helpSphere.draw();
    showText ("S1: ["+(int)S1.x+", "+(int)S1.y+", "+(int)S1.z+"]",10,60);
    
    fill(88,255,88);   
    helpSphere.set (S2, 3);   
    helpSphere.draw();
    showText ("S2: ["+(int)S2.x+", "+(int)S2.y+", "+(int)S2.z+"]",10,80);
  }
}
//----------------------------------------------------------
void mousePressed()
{
  if (mouseButton == RIGHT)  
    ray.setOrigin (mouseX, mouseY, 80);
}
//----------------------------------------------------------
// show 2d text
//----------------------------------------------------------
void showText(String infoText, int x, int y)
{
  textMode(SCREEN);
  text(infoText, x, y);
}

//----------------------------------------------------------
// intersection of a ray with a circle in 2d
//           or of a ray with a sphere in 3d !!!
// input:  ray   ray origin and direction point
//         c     sphere
// output: S1,S2 intersection points
// return: int   number of intersection points 0,1,2
//----------------------------------------------------------
int raySphereIntersection(Ray ray, TSphere c, PVector S1, PVector S2) 
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
  { line(origin.x, origin.y, origin.z, origin.x+direction.x, origin.y+direction.y, origin.z+direction.z);
  }
}

//----------------------------------------------------------
// spheres are defined by center point and radius  
//----------------------------------------------------------
public class TSphere 
{ PVector center;
  float radius;
  TSphere()
  { center = new PVector(0,0);
    radius = 1;
  }
  TSphere(PVector center, float radius)
  { this.center = center;
    this.radius = radius;  
  }
  void set(PVector center, float radius)
  { this.center = center;
    this.radius = radius;  
  }
  void setCenter(PVector center)
  { this.center = center;
  }
  void draw() 
  { pushMatrix();
      translate (center.x, center.y, center.z);
      sphere(radius);
    popMatrix();  
  }
}


