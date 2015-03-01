
int WIDTH = 640;
int HEIGHT = 480;

PFont font;

float[] q;
float[] qn;

// Funktionsparametrar begin
float m = 5;
float mEnd = 1;
float k = 10000;
float L = 8;
float c = 0.1;
int points = 40;
int sysOr = points*4;

//float[] z0 = new float[sysOr];


// Funktionsparametrar end

//Solverparametrar begin
float Tfinal = 100;
float h = 0.01;
int steps;
float t = 0;
//Solverparametrar end
int j = 0;
int i = 0;
int e = 0;

float orX = WIDTH/2;
float orY = 100;

float[] x = new float[points];
float[] y = new float[points];

ode ode1;
funktion funk;
void setup()
{
  
  /*for(i = 0; i < sysOr; i++)
    z0[i] = 0;
  for(i = 1; i < sysOr+1; i = i + 4)
    z0[i-1] = i*10+20;*/
  
  //font = loadFont("Aharoni-Bold-48.vlw");
  //textFont(font, 32);
  size(640,480);
  background(255);
  frameRate(400);
  steps = (int)(Tfinal/h);
  q = new float[sysOr];
  qn = new float[sysOr];
  
  funk = new funktion(sysOr, k, L, m, mEnd, c);
  ode1 = new ode(Tfinal, h, z0, funk, sysOr);
  
  for(i = 0; i < sysOr; i++)
    q[i] = z0[i];
  
}

void draw()
{  
  background(255);

  j = 0;
  for(i = 0; i < sysOr; i = i + 4) {
    x[j] = q[i];
    y[j] = q[i+2];
    j++;
  }
  
  qn = ode1.diffUpdate(q);
  for(i = 0; i < sysOr; i++)
    q[i] = qn[i];

  
  strokeWeight(0.5);
  
  line(orX, orY, x[0]+orX, -y[0]+orY);
  
  for(i = 0; i < points-1; i++)
    line(x[i]+orX, -y[i]+orY, x[i+1]+orX, -y[i+1]+orY);

  
  /*strokeWeight(1);
  for(i = 0; i < points; i++)
    ellipse( x[i]+orX, -y[i]+orY, 5, 5);*/
  
  //fill(0);
  //e = e + 1;
  //text("tid: " + nf(e*h,2,2), 30, 30);
  
  /*if(e >= steps) {
    e = 0;
    
    for(i = 0; i < sysOr; i++)
      q[i] = z0[i];
  }*/
  
  
}

void keyPressed() {
  
  if(key == 'r') {
    for(i = 0; i < sysOr; i++)
      q[i] = z0[i];
  }
  
  if(key == 't') {
    for(i = 0; i < sysOr; i++)
      q[i] = z01[i];
  }
  
  if(key == 'y') {
    for(i = 0; i < sysOr; i++)
      q[i] = z02[i];
  }
  
  if(key == 'u') {
    for(i = 0; i < sysOr; i++)
      q[i] = z03[i];
  }
  
}
class funktion {

  private float L;

  private float[] F;
  private float k;
  private float m;
  private float mEnd;
  private float g = 9.82;
  private float c;
  private float[] zp;
  private float[] r;
  private int i;
  private int j;
  private int p;
  private int l;
  private int rEnd;
  private int fEnd;
  
  funktion(int sysOr, float k, float L, float m, float mEnd, float c) {
    this.m = m;
    this.mEnd = mEnd;
    this.L = L;
    this.c = c/sqrt(2);
    this.k = k;
    zp = new float[sysOr];  
    r = new float[sysOr/4];
    F = new float[sysOr/4];
    rEnd = sysOr/4-1;
    fEnd = sysOr/4-1;
  }
  
  float[] f(float[] z) { //-------------- f begin ------------------
     
     r[0] = sqrt(sq(z[0]) + sq(z[2]));
     j = 0;
     l = 2;
     for(i = 0; i < (sysOr/4-1); i++) {
       r[i+1] = sqrt( sq(z[j] - z[j + 4]) + sq(z[l] - z[l+4]) );
       
       j = j + 4;
       l = l + 4;
     }

       

     for(i = 0; i < (sysOr/4-1); i++) {
       if(r[i] > L)
         F[i] = (k/m)*(r[i]-L);
       else
         F[i] = 0;
     }
     
     if(r[rEnd] > L)
         F[fEnd] = (k/mEnd)*(r[rEnd]-L);
       else
         F[fEnd] = 0;
     
     for(i = 0; i < sysOr; i = i + 2)
       zp[i] = z[i+1];

     zp[1] = -F[0]*z[0]/r[0] + F[1]*(z[4] - z[0])/r[1] - (c/m)*z[1];     
     zp[3] = -F[0]*z[2]/r[0] + F[1]*(z[6] - z[2])/r[1] - g - (c/m)*z[3];
     
     
     j = 1;
     p = 4;
     for(i = 0; i < sysOr/4-2; i++) {
       zp[p+1] = -F[j]*(z[p] - z[p-4])/r[j] + F[j+1]*(z[p+4] - z[p])/r[j] - (c/m)*z[p+1];       // x
       zp[p+3] = -F[j]*(z[p+2] - z[p-2])/r[j]  + F[j+1]*(z[p+6] - z[p+2])/r[j] - g - (c/m)*z[p+3];    // y
       
       j++;
       p = p + 4;
       
     }

     zp[sysOr-3] = -F[fEnd]*(z[sysOr-4] - z[sysOr-8])/r[rEnd] - (c/m)*z[sysOr-3];
     
     zp[sysOr-1] = -F[fEnd]*(z[sysOr-2] - z[sysOr-6])/r[rEnd] - g - (c/m)*z[sysOr-1];


     /*
     z[0] = x1
     z[1] = x1'
     z[2] = y1
     z[3] = y1'
     
     z[4] = x2
     z[5] = x2'
     z[6] = y2
     z[7] = y2'
     
     z[8] = x3
     z[9] = x3'
     z[10] = y3
     z[11] = y3'
     */
     
     
     
     return zp;
  } //-------------- f end ------------------
}

float[] z0 = {L, 0, 0, 0,
              2*L, 0, 0, 0,
              3*L, 0, 0, 0,
              4*L, 0, 0, 0,
              5*L, 0, 0, 0,
              6*L, 0, 0, 0,
              7*L, 0, 0, 0,
              8*L, 0, 0, 0,
              9*L, 0, 0, 0,
              10*L, 0, 0, 0,
              11*L, 0, 0, 0,
              12*L, 0, 0, 0,
              13*L, 0, 0, 0,
              14*L, 0, 0, 0,
              15*L, 0, 0, 0,
              16*L, 0, 0, 0,
              17*L, 0, 0, 0,
              18*L, 0, 0, 0,
              19*L, 0, 0, 0,
              20*L, 0, 0, 0,
              21*L, 0, 0, 0,
              22*L, 0, 0, 0,
              23*L, 0, 0, 0,
              24*L, 0, 0, 0,
              25*L, 0, 0, 0,
              26*L, 0, 0, 0,
              27*L, 0, 0, 0,
              28*L, 0, 0, 0,
              29*L, 0, 0, 0,
              30*L, 0, 0, 0,
              31*L, 0, 0, 0,
              32*L, 0, 0, 0,
              33*L, 0, 0, 0,
              34*L, 0, 0, 0,
              35*L, 0, 0, 0,
              36*L, 0, 0, 0,
              37*L, 0, 0, 0,
              38*L, 0, 0, 0,
              39*L, 0, 0, 0,
              40*L, 0, 0, 0};

float yd = 100;

float[] z01 = {L, 0, 0, yd,
              2*L, 0, 0, yd,
              3*L, 0, 0, yd,
              4*L, 0, 0, yd,
              5*L, 0, 0, yd,
              6*L, 0, 0, yd,
              7*L, 0, 0, yd,
              8*L, 0, 0, yd,
              9*L, 0, 0, yd,
              10*L, 0, 0, yd,
              11*L, 0, 0, yd,
              12*L, 0, 0, yd,
              13*L, 0, 0, yd,
              14*L, 0, 0, yd,
              15*L, 0, 0, yd,
              16*L, 0, 0, yd,
              17*L, 0, 0, yd,
              18*L, 0, 0, yd,
              19*L, 0, 0, yd,
              20*L, 0, 0, yd,
              21*L, 0, 0, yd,
              22*L, 0, 0, yd,
              23*L, 0, 0, yd,
              24*L, 0, 0, yd,
              25*L, 0, 0, yd,
              26*L, 0, 0, yd,
              27*L, 0, 0, yd,
              28*L, 0, 0, yd,
              29*L, 0, 0, yd,
              30*L, 0, 0, yd,
              31*L, 0, 0, yd,
              32*L, 0, 0, yd,
              33*L, 0, 0, yd,
              34*L, 0, 0, yd,
              35*L, 0, 0, yd,
              36*L, 0, 0, yd,
              37*L, 0, 0, yd,
              38*L, 0, 0, yd,
              39*L, 0, 0, yd,
              40*L, 0, 0, yd};
              
float[] z02 = {L, 0, 0, -yd,
              2*L, 0, 0, -yd,
              3*L, 0, 0, -yd,
              4*L, 0, 0, -yd,
              5*L, 0, 0, -yd,
              6*L, 0, 0, -yd,
              7*L, 0, 0, -yd,
              8*L, 0, 0, -yd,
              9*L, 0, 0, -yd,
              10*L, 0, 0, -yd,
              11*L, 0, 0, -yd,
              12*L, 0, 0, -yd,
              13*L, 0, 0, -yd,
              14*L, 0, 0, -yd,
              15*L, 0, 0, -yd,
              16*L, 0, 0, -yd,
              17*L, 0, 0, -yd,
              18*L, 0, 0, -yd,
              19*L, 0, 0, -yd,
              20*L, 0, 0, -yd,
              21*L, 0, 0, -yd,
              22*L, 0, 0, -yd,
              23*L, 0, 0, -yd,
              24*L, 0, 0, -yd,
              25*L, 0, 0, -yd,
              26*L, 0, 0, -yd,
              27*L, 0, 0, -yd,
              28*L, 0, 0, -yd,
              29*L, 0, 0, -yd,
              30*L, 0, 0, -yd,
              31*L, 0, 0, -yd,
              32*L, 0, 0, -yd,
              33*L, 0, 0, -yd,
              34*L, 0, 0, -yd,
              35*L, 0, 0, -yd,
              36*L, 0, 0, -yd,
              37*L, 0, 0, -yd,
              38*L, 0, 0, -yd,
              39*L, 0, 0, -yd,
              40*L, 0, 0, -yd};

float xd = 100;

float[] z03 = {L, 0, xd, 0,
              2*L, 0, xd, 0,
              3*L, 0, xd, 0,
              4*L, 0, xd, 0,
              5*L, 0, xd, 0,
              6*L, 0, xd, 0,
              7*L, 0, xd, 0,
              8*L, 0, xd, 0,
              9*L, 0, xd, 0,
              10*L, 0, xd, 0,
              11*L, 0, xd, 0,
              12*L, 0, xd, 0,
              13*L, 0, xd, 0,
              14*L, 0, xd, 0,
              15*L, 0, xd, 0,
              16*L, 0, xd, 0,
              17*L, 0, xd, 0,
              18*L, 0, xd, 0,
              19*L, 0, xd, 0,
              20*L, 0, xd, 0,
              21*L, 0, xd, 0,
              22*L, 0, xd, 0,
              23*L, 0, xd, 0,
              24*L, 0, xd, 0,
              25*L, 0, xd, 0,
              26*L, 0, xd, 0,
              27*L, 0, xd, 0,
              28*L, 0, xd, 0,
              29*L, 0, xd, 0,
              30*L, 0, xd, 0,
              31*L, 0, xd, 0,
              32*L, 0, xd, 0,
              33*L, 0, xd, 0,
              34*L, 0, xd, 0,
              35*L, 0, xd, 0,
              36*L, 0, xd, 0,
              37*L, 0, xd, 0,
              38*L, 0, xd, 0,
              39*L, 0, xd, 0,
              40*L, 0, xd, 0};
class ode {

  private int sysOr;
  private float[] zn;
  private float[] zk0;
  
  private float[] a2;
  private float[] a3;
  private float[] a4;
  private int i = 0;
  
  private float[] k1;
  private float[] k2;
  private float[] k3;
  private float[] k4;
  funktion funk;
  
 
    
  ode(float Tfinal, float h, float[] z0, funktion funk, int sysOr) {
    
    this.sysOr = sysOr;
    
    zn = new float[sysOr];
    
    a2 = new float[sysOr];
    a3 = new float[sysOr];
    a4 = new float[sysOr];
    
    k1 = new float[sysOr];
    k2 = new float[sysOr];
    k3 = new float[sysOr];
    k4 = new float[sysOr];
    
    this.funk = funk;
     
  }
  
  float[] diffUpdate(float[] z) { //--------- diffUpdate begin ---------------
   
   k1 = funk.f(z);
   
   for(i = 0; i < sysOr; i++)
     a2[i] = z[i] + (h/2)*k1[i];
   k2 = funk.f(a2);
   
   for(i = 0; i < sysOr; i++)
     a3[i] = z[i] + (h/2)*k2[i];
   k3 = funk.f(a3);
   
   for(i = 0; i < sysOr; i++)
     a4[i] = z[i] + h*k3[i];
   k4 = funk.f(a4);
   
   
   for(i = 0; i < sysOr; i++)
     zn[i] = z[i] + (h/6)*( k1[i] + 2*k2[i] + 2*k3[i] + k4[i] );
   
   return zn;
   
   } //--------- diffUpdate end ---------------
   
   
   
}



