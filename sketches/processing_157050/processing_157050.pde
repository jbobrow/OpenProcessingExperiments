
/*    Pierre MARZIN 07/2014

    I just wanted to explore trackball rotations...
    3d rotations are commanded by mouse moves.

*/
int nbxe=4;
int nbye=4;
int nbze=4;
float camheight=500;
float baserotx=0, baseroty=0;
Element [] elements=new Element[nbxe][nbye][nbze];
void setup() {
  size(400, 400, P3D);
  arcball = new Arcball();
  float ecartX=width/(nbxe+1);
  float ecartY=height/(nbye+1);
  float ecartZ=height/(nbze+1);
  noStroke();

  for (int i=0; i<nbxe; i++) {
    for (int j=0; j<nbye; j++) {
      for (int k=0; k<nbze; k++) {
        elements[i][j][k]=new Element((i+1)*ecartX-width/2, (j+1)*ecartY-height/2, (k+1)*ecartZ-height/2);
      }
    }
  }
}
void draw() {
  background(0);
  lights();
  camera(0, 0, camheight, 0, 0, 0, 0, 1, 0);
  pushMatrix();
  //  rotateX(baseroty);
  //  rotateY(baserotx);
  PVector axis = arcball.getAxis();
  rotate( -arcball.getAngle(), -axis.x, -axis.y, axis.z );

  for (int i=0; i<nbxe; i++) {
    for (int j=0; j<nbye; j++) {
      for (int k=0; k<nbze; k++) {
        elements[i][j][k].display();
      }
    }
  }
  popMatrix();
}
void mouseScrolled()
{
  if (mouseScroll > 0 )
  {
    camheight+=20; // positive scroll
  } else 
  {
    camheight-=20; // negative scroll
  }
}
void mouseDragged()
{
  arcball.mouseDragged();
//  baserotx-=(pmouseX-mouseX)/100;
//  baseroty+=(pmouseY-mouseY)/100;
}
class Element {
  float x, y, z, dia, lim;
  int xr, yr, zr;
  Element(float x, float y, float z) {
    this.x=x;
    this.y=y;
    this.z=z;
    xr=yr=zr=0;
    dia=5;
    lim=.9;
  }
  void display() {
    pushMatrix();
    translate (x, y, z);
    if (random(1)>lim)xr++;
    if (random(1)>lim)yr++;
    if (random(1)>lim)zr++;
    rotateX(xr*PI/2);
    rotateY(yr*PI/2);
    rotateZ(zr*PI/2);
    fill(255, 0, 0);
    sphere(dia);
    translate(0, 0, 15);
    fill(255, 255, 255);
    cylinder(3, 30, 12);
    translate(0, 0, 15);
    fill(0, 255, 0);
    sphere(dia);
    translate(0, 0, -30);
    rotateX(PI/2);
    translate(0, 0, 15);
    fill(255, 255, 255);
    cylinder(3, 30, 12);
    translate(0, 0, 15);
    fill(0, 0, 255);
    sphere(dia);
    popMatrix();
  }
  void cylinder(float radius, float haut, float faces) {
    float angle=TWO_PI/faces;
    beginShape(QUADS);
    for (int f=0; f<faces; f++) {
      int f1=(f+1)%faces;   
      float sf=sin(f*angle); 
      float sf1=sin(f1*angle);
      float cf=cos(f*angle); 
      float cf1=cos(f1*angle);
      vertex(radius*sf, radius*cf, haut/2);
      vertex(radius*sf1, radius*cf1, haut/2);      
      vertex(radius*sf1, radius*cf1, -haut/2);
      vertex(radius*sf, radius*cf, -haut/2);
    }
    endShape();
    beginShape(TRIANGLES);
    for (int f=0; f<faces; f++) {
      int f1=(f+1)%faces;
      vertex(0, 0, -haut/2);
      vertex(radius*sf, radius*cf, -haut/2);
      vertex(radius*sf1, radius*cf1, -haut/2);

      vertex(0, 0, haut/2);
      vertex(radius*sf, radius*cf, haut/2);
      vertex(radius*sf1, radius*cf1, haut/2);
    }
    endShape();
  }
}

/*
  Adapted for use with processingJS by Pierre MARZIN 07/2014 from 
   Processing library 5th Feb 2006 by Tom Carden
  from "simple Arcball use template" 9.16.03 Simon Greenwold

  Heavily updated and moved to github in March 2012.
   
  Copyright (c) 2003 Simon Greenwold
  Copyright (c) 2006, 2012 Tom Carden

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA

*/

public class Arcball {

  PVector center;
  float radius;
  
  Quat qNow = new Quat(); 
  Quat qDrag;
  float dragFactor = 0.99f;

  /** defaults to radius of mag(width, height)/2 */
  public Arcball() {
    this(null, 0);
  }

  public Arcball(PVector center, float radius) {

    if (center == null) {
      float w = width;
      float h = height;
      if (radius == 0) {
        radius = mag(w, h) / 2.0f;
      }
      center = new PVector(w / 2.0f, h / 2.0f);
    }
    //parent.registerPre(this);

    this.center = center;
    this.radius = radius;
  }
  
  public void reset() {
    qNow = new Quat(); 
    qDrag = null;    
  }

  public void mousePressed() {
    qDrag = null;
  }
  
  public void mouseReleased() {
    updateDrag();
  }  

  public void mouseDragged() {
    updateDrag();
    qNow = qNow.multQ(qDrag);
  }
  
  private void updateDrag() {
    PVector pMouse = new PVector(pmouseX, pmouseY);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector from = mouseOnSphere(pMouse);
    PVector to = mouseOnSphere(mouse);
    qDrag = new Quat(from.dot(to), from.cross(to));
  }

  public void pre() {
    if (dragFactor > 0.0 && !mousePressed && qDrag != null && qDrag.w < 0.999999) {
      qDrag.scaleAngle(dragFactor);
      qNow = Quat.mult(qNow, qDrag);
    }
  }

  private PVector mouseOnSphere(PVector mouse) {
    PVector v = new PVector();
    v.x = (mouse.x - center.x) / radius;
    v.y = (mouse.y - center.y) / radius;

    float mag = v.x * v.x + v.y * v.y;
    if (mag > 1.0f) {
      v.normalize();
    }
    else {
      v.z = sqrt(1.0f - mag);
    }
    return v;
  }

  public float getAngle() {
    return qNow.getAngle();
  }
  
  public PVector getAxis() {
    return qNow.getAxis();
  }

  // Quat!

  class Quat {
        
    float w, x, y, z;

    Quat() {
      reset();
    }

    Quat(float w, PVector v) {
      this.w = w;
      x = v.x;
      y = v.y;
      z = v.z;
    }

    Quat(float w, float x, float y, float z) {
      this.w = w;
      this.x = x;
      this.y = y;
      this.z = z;
    }

    void reset() {
      w = 1.0f;
      x = 0.0f;
      y = 0.0f;
      z = 0.0f;
    }

    void set(float w, float x, float y, float z) {
      this.w = w;
      this.x = x;
      this.y = y;
      this.z = z;
    }

    void set(float w, PVector v) {
      this.w = w;
      x = v.x;
      y = v.y;
      z = v.z;
    }

    void set(Quat q) {
      w = q.w;
      x = q.x;
      y = q.y;
      z = q.z;
    }

    Quat multQ(Quat q2) {
      Quat res = new Quat();
      res.w = w * q2.w - x * q2.x - y * q2.y - z * q2.z;
      res.x = w * q2.x + x * q2.w + y * q2.z - z * q2.y;
      res.y = w * q2.y + y * q2.w + z * q2.x - x * q2.z;
      res.z = w * q2.z + z * q2.w + x * q2.y - y * q2.x;
      return res;
    }

    float[] getValue() {
      // transforming this quat into an angle and an axis vector...

      float[] res = new float[4];

      float sa = (float) Math.sqrt(1.0f - w * w);
      if (sa < EPSILON) {
        sa = 1.0f;
      }

      res[0] = (float) Math.acos(w) * 2.0f;
      res[1] = x / sa;
      res[2] = y / sa;
      res[3] = z / sa;

      return res;
    }
    
    float getAngle() {
      return acos(w) * 2.0f;
    }
    
    PVector getAxis() {
      float sa = (float) sqrt(1.0f - w * w);
      if (sa < EPSILON) {
        sa = 1.0f;
      }
      return new PVector(x / sa, y / sa, z / sa);      
    }

    // these are a bit sketchy because they've been written without concern for whetherthe quat remains a unit quat :-/

    void scaleAngle(float scale) {
      setAngle(scale * getAngle());
    }    
    
    void setAngle(float angle) {
      PVector axis = getAxis();
      w = cos(angle / 2.0f);
      float scale = sin(angle / 2.0f);
      x = axis.x * scale;
      y = axis.y * scale;
      z = axis.z * scale;      
    }
    
  } // Quat

}



