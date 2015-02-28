
/** PAPPUS THE CARPENTER
 *
 *  fait par Jacques Maire
 *
 *  jeudi 22 mai 2014
 *
 *  http://www.xelyx.fr , http:www.alcys.com
 *
 *  Illustre et explique le theoreme de Pappus par un passage par la 3D.
 *  
 *  Les deux perspectives consecutives de la figure de Pappus
 *  (dans le plan horizontal gris) sont obtenues comme projetees cylindriques 
 *  de deux perspectives consecutives (situees chacune dans un pan du toit 
 *  de la cabane.)
 *
 **/

Arcball arcball;
Figure figure;
float temps;

void setup() {
  size(600, 600, P3D); 
  arcball = new Arcball( 600);


  figure=new Figure();
}

void draw() { 
  temps=0.0005*millis();
  background(250, 100, 170);
  noStroke();

  arcball.run(250, -400);


  axeXYZ();

  figure.draw();
}


void mousePressed() {
  arcball.mousePressed();
}

void mouseDragged() {
  arcball.mouseDragged();
}



void axeXYZ() {
  noStroke();
  pushMatrix();
  translate(40, 0, 0);
  fill(255, 0, 0);
  box(80, 5, 5);
  popMatrix();
  pushMatrix();
  translate(0, 40, 0);
  fill(0, 255, 0);
  box(5, 80, 5);
  popMatrix();
  pushMatrix();
  translate(0, 0, 40);
  fill(0, 0, 255);
  box(5, 5, 80);
  popMatrix();
}


class Figure {
  int npts=10;
  PVector[] pts;
  PVector[] projetes;
  float rap13, rap15, rapA, rapB;
  Cycle cykle0;//, cykle1, cykle2;

  Figure() {
    rap13=0.7;
    rap15=1.4;
    rapA=0.5;
    rapB=0.5;

    pts=new PVector[npts];
    projetes=new PVector[npts];

    pts[0]= new PVector(0, 0, 400);
    pts[1]= new PVector(0, -400, 400);
    pts[2]= new PVector(250, 0, 100);
    pts[3]= comb(1.0, pts[1], rap13, PVector.sub(pts[2], pts[0]));
    pts[4]= new PVector(-230, 0, 250);
    pts[5]= comb(1.0, pts[1], rap15, PVector.sub(pts[4], pts[0]));
    pts[6]= barycentre(rapA, pts[2], pts[3]);//pointA
    pts[7]= barycentre(rapB, pts[4], pts[5]);//pointB
    pts[8]=new PVector(pts[6].x, pts[6].y, 0);//pointA0
    pts[9]=new PVector(pts[7].x, pts[7].y, 0);//pointB0

      cykle0=new Cycle(0.6);
    cykle1=new Cycle(0.65);
    cykle2=new Cycle(0.4);
  }
  //fin du constructeur


  void draw() {


    fromTo(pts[8], pts[6], color(105, 100, 255));
    fromTo(pts[9], pts[7], color(105, 100, 255));
    lights();
    directionalLight(100, 100, 255, -1, 0, -1);
    directionalLight(255, 100, 100, 0, -1, -0.5);
    for (int i=0; i<npts; i++) {
      pushMatrix();
      translate(pts[i].x, pts[i].y, pts[i].z);
      fill(#ff0000);
      noStroke();
      sphere(7);
      popMatrix();
    }

    for (int i=0; i<npts; i++) {
      projetes[i]=new PVector(pts[i].x, pts[i].y, 0);
    }

    stroke(255); 
    strokeWeight(2.8);
    cykle0.actualiser(0.6*abs(cos(temps))+0.37);//
    cykle1.actualiser(0.65*abs(sin(temps*0.5))-0.32);
    cykle2.actualiser(0.8*abs(cos(-temps)));
    strokeWeight(1.0);
    noStroke();
    fromTo(projetes[0], projetes[1], color(255, 0, 0));
    fromTo(projetes[2], projetes[3], color(255, 0, 0));
    fromTo(projetes[4], projetes[5], color(255, 0, 0));
    fromTo(pts[0], pts[1], color(0, 255, 0));
    fromTo(pts[2], pts[3], color(0, 255, 0));
    fromTo(pts[4], pts[5], color(0, 255, 0));


    quad4(new PVector(-350, 200, 0), new PVector(-350, -700, 0), new PVector(350, -700, 0), new PVector(350, 200, 0), color(255, 255, 255), color(255, 255, 255));
    quad4(pts[0], pts[1], pts[3], pts[2], color(255, 255, 155, 150), color(255, 255, 0, 150));
    quad4(pts[0], pts[1], pts[5], pts[4], color(155, 200, 5, 150), color(255, 255, 155, 150)); 
    quad4(projetes[0], pts[0], pts[1], projetes[1], color(100, 055, 255, 220), color(0, 0, 255, 220));
    quad4(projetes[2], pts[2], pts[3], projetes[3], color(100, 055, 255, 220), color(0, 0, 255, 220));
    quad4(projetes[4], pts[4], pts[5], projetes[5], color(100, 055, 255, 220), color(0, 0, 255, 220));
  }




  PVector inter2Droites(int n0, int n1, int m0, int m1) {
    PVector ad=soustraire(n0, n1);
    PVector bd=soustraire(m0, m1);
    PVector ap=pts[n0];
    PVector bp=pts[m0];
    PVector ab=PVector.sub(bp, ap);
    float lambda = determinant(ab, ad)/determinant(bd, ad);
    return comb(1, bp, -lambda, bd);
  } 
  float  calculRap3(int a, int m, int b) {  
    PVector ab=soustraire( a, b);
    PVector  am=soustraire( a, m);

    return (am.dot(ab))/(ab.dot(ab));
  }


  float  calculRap(int a, int b, int m, int r) {  
    PVector ab=soustraire( b, a);
    PVector  mr=soustraire( r, m);

    return (mr.dot(ab))/(ab.dot(ab));
  }



  PVector soustraire(int n, int m) {
    return PVector.sub(pts[m], pts[n]) ;
  }

  boolean aligne(int n0, int n1, int n2) {
    float d=determinant(soustraire( n1, n0), soustraire(n0, n2));
    return (abs(d)<1.01);
  } 


  boolean parallele(int n0, int n1, int n2, int n3) {
    float d=determinant(soustraire( n1, n0), soustraire(n3, n2));
    return (abs(d)<1.01);
  } 


  void quad4(PVector a, PVector b, PVector c, PVector d, color c1, color c2) {

    beginShape();
    fill(c1);
    vertex( a.x, a.y, a.z);        
    vertex( b.x, b.y, b.z);
    fill(c2);
    vertex( c.x, c.y, c.z);
    vertex( d.x, d.y, d.z);
    endShape(CLOSE);
  }



  PVector interPlan(int n1, int n2, int n3, PVector vA) {
    PVector no=soustraire(n3, n1).cross(soustraire(n2, n1));
    PVector uv=PVector.sub(pts[0], vA);
    float lambda=(uv.dot(no))/no.z;
    return new PVector(vA.x, vA.y, lambda);
  }

  void fromTo(PVector u, PVector v, color col) {
    PVector m=PVector.add(PVector.mult(u, 0.5), PVector.mult(v, 0.5));
    PVector w=PVector.sub(v, u);
    float lon=w.mag();
    PVector n=new PVector(0, -w.z, w.y);
    n.normalize();
    w.normalize();
    pushMatrix();
    translate(m.x, m.y, m.z);
    rotate(acos(w.x), n.x, n.y, n.z);
    fill(col);
    box(lon, 6, 6);
    popMatrix();
  }

  PVector comb(float t1, PVector v1, float t2, PVector v2) {
    PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
    return res;
  }
  PVector comb3(float t1, PVector v1, float t2, PVector v2, float t3, PVector v3) {
    PVector res=PVector.add(PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2)), PVector.mult(v3, t3));
    return res;
  }

  PVector barycentre(float lamb, PVector u, PVector v) {
    return comb(1-lamb, u, lamb, v);
  }

  float determinant(PVector u, PVector v) {
    return u.x*v.y-u.y*v.x;
  }
}
//fin de classe



class Cycle {
  int npk=9;
  float  rap;
  PVector[] punks;

  Cycle(float r) {
    rap=r;
    punks=new PVector[npk];
  }

  void actualiser(float r) {
    rap=r;
    punks[0]=figure.pts[6].get();
    punks[1]=barycent(rap, figure.pts[0], figure.pts[1]);

    punks[2]=inter2Droites(4, 5, punks[0], punks[1]);

    punks[3]=new PVector(punks[2].x, punks[2].y, 0);
    punks[4]=figure.pts[7];
    punks[5]=punks[1].get();
    punks[6]=inter2Droites(2, 3, punks[4], punks[5]); 

    punks[7]=new PVector(punks[6].x, punks[6].y, 0); 
    punks[8]=new PVector(punks[1].x, punks[1].y, 0); 

    stroke(255);
    strokeWeight(2.8);
    ligne(punks[0], punks[1]);
    ligne(punks[0], punks[2]);    
    ligne(figure.pts[7], punks[1]); 

    ligne(punks[4], punks[6]);
    strokeWeight(1);

    noStroke();
    fill(255, 200, 200);
    fromTo(punks[2], punks[3]);
    fromTo(figure.pts[8], punks[3]);  
    fromTo(punks[6], punks[7]);
    fromTo(punks[7], figure.pts[9]);   
    fromTo(punks[1], punks[8]);
  }

  PVector inter2Droites(int n0, int n1, PVector p0, PVector p1) {
    PVector adir=figure.soustraire(n0, n1);
    PVector bdir=PVector.sub(p0, p1);
    PVector ab=PVector.sub(figure.pts[n0], punks[1]);
    float lambda = determ(ab, adir)/determ(bdir, adir);
    return comb(1, punks[1], lambda, bdir);
  } 

  void ligne(PVector a, PVector b) {
    // stroke(0);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }
  void fromTo(PVector u, PVector v) {
    PVector m=PVector.add(PVector.mult(u, 0.5), PVector.mult(v, 0.5));
    PVector w=PVector.sub(v, u);
    float lon=w.mag();
    PVector n=new PVector(0, -w.z, w.y);
    n.normalize();
    w.normalize();
    pushMatrix();
    translate(m.x, m.y, m.z);
    rotate(acos(w.x), n.x, n.y, n.z);
    box(lon, 8, 8);
    popMatrix();
  }
  PVector barycent(float lamb, PVector u, PVector v) {
    return comb(1-lamb, u, lamb, v);
  } 

  float determ(PVector u, PVector v) {
    return u.x*v.y-u.y*v.x;
  } 
  PVector comb(float t1, PVector v1, float t2, PVector v2) {
    PVector res=PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
    return res;
  }
}
//fin de class

// Ariel and V3ga's arcball class with a couple tiny mods by Robert Hodgin
//Ken Shoemake :http://www.tecgraf.puc-rio.br/~mgattass/fcg/material/old/shoemake92.pdf
class Arcball {

  float center_x, center_y, radius;
  PVector v_down, v_drag;
  Quat q_now, q_down, q_drag;
  PVector[] axisSet;
  int axis;
  float mxv, myv;
  float x, y;

  Arcball( float radius) {

    this.radius = radius;

    v_down = new PVector();
    v_drag = new PVector();

    q_now = new Quat();
    q_down = new Quat();
    q_drag = new Quat();

    axisSet = new PVector[] {
      new PVector(1.0f, 0.0f, 0.0f), new PVector(0.0f, 1.0f, 0.0f), new PVector(0.0f, 0.0f, 1.0f)
    };
    axis = -1;
  }

  void mousePressed() {
    v_down = mouse_to_sphere(mouseX, mouseY);
    q_down.set(q_now);
    q_drag.reset();
  }

  void mouseDragged() {
    v_drag = mouse_to_sphere(mouseX, mouseY);
    q_drag.set(v_down.dot( v_drag), v_down.cross( v_drag));
  }

  void run(float dy, float dz) {
    center_x = width/2.0;
    center_y = height/2.0;

    q_now = Quat.mul(q_drag, q_down);
    translate(center_x, center_y+dy, dz);
    applyQuat2Matrix(q_now);

    x += mxv;
    y += myv;
    mxv -= mxv * .01;
    myv -= myv * .01;
  }

  PVector mouse_to_sphere(float x, float y) {
    PVector v = new PVector();
    v.x = (x - center_x) / radius;
    v.y = (y - center_y) / radius;

    float mag = v.x * v.x + v.y * v.y;
    if (mag > 1.0f) {
      v.normalize();
    } else {
      v.z = sqrt(1.0f - mag);
    }

    return (axis == -1) ? v : constrain_vector(v, axisSet[axis]);
  }

  PVector constrain_vector(PVector vector, PVector axis) {

    PVector res =PVector.sub(vector, PVector.mult(axis, axis.dot(vector)));
    res.normalize();
    return res;
  }

  void applyQuat2Matrix(Quat q) {
    // instead of transforming q into a matrix and applying it...

    float[] aa = q.getValue();
    rotate(aa[0], aa[1], aa[2], aa[3]);
  }
}

static class Quat {
  float w, x, y, z;

  Quat() {
    reset();
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

  static Quat mul(Quat q1, Quat q2) {
    Quat res = new Quat();
    res.w = q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z;
    res.x = q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y;
    res.y = q1.w * q2.y + q1.y * q2.w + q1.z * q2.x - q1.x * q2.z;
    res.z = q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x;
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
}



