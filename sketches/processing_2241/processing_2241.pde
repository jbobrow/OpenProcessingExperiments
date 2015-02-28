
//import processing.opengl.*;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Written by v3ga - http://www.v3ga.net
// Updated to processing 118 by Martin Antolini
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


int     W = 640;
int     H = 480;
float   DEGTORAD = PI/180.0;
Torus   torus;
timer   Timer;
float   a, aSpeed;
boolean launched      = false;
boolean frameBlending = true;
boolean drawTorus     = false;

char drawFlag_Line    = 0x01;
char drawFlag_Tangent = 0x02;

int   pixelNb = W*H;
int[] buffer  = new int[pixelNb];

int    boidNb  = 15;
Boid[] boid    = new Boid[boidNb];
// SetUp
void setup()
{
  size(W,H, P3D);
  background(255);

  // Create the path
  torus = new Torus(150.0, 3, 5);

  // Create the boids
  float startTh = 0.0;
  for (int i=0 ; i<boidNb ; i++)
  {
    boid[i] = new Boid(torus, 10.0+3*i, 40.0, 4.0, 20.0);
    boid[i].M_startAt(startTh); 
    startTh+=360.0 / (float) (boidNb);
  }

  // Imaging + Scene parameters
  createBlendTable(0.12);
  a       = 0.0;
  aSpeed  = 30.0;

}

// Main Loop
void draw()
{
  // Launch timer
  if (!launched)
  {
    Timer = new timer(millis());
    launched = true;
  }

  // Timing
  float dt = Timer.M_getDelta(millis())/1000;


  // Save Screen into buffer
  loadPixels();
  if (frameBlending)System.arraycopy(pixels, 0, buffer, 0, pixelNb);

  // Draw new scene
  background(255);
  translate(0.5*(float)W, 0.5*(float)H,-50);
  pushMatrix();
  rotateY(a*DEGTORAD);
  rotateX(a*DEGTORAD);
  if (drawTorus) torus.M_draw(150, char(drawFlag_Line | drawFlag_Tangent));
  for (int i=0 ; i<boidNb ; i++)
    boid[i].M_draw();

  popMatrix();

  // Frame Blending
  // if (frameBlending) blendFrame(pixels, buffer, pixelNb);

  // Update parameters for actors
  for (int i=0 ; i<boidNb ; i++) boid[i].M_update(dt);

  a += aSpeed*dt; 
  if (a >= 360.0) a -= 360.0;
  updatePixels();
}


// -------------------------------------------
// Blend Table
// Frame Blending
// -------------------------------------------
char[] blendTable = new char[256*256];
void createBlendTable(float blendFactor)
{
  int i,j;
  float blendFactor_1 = 1.0 - blendFactor;
  for (i=0 ; i<256 ; i++)
    for (j=0 ; j<256 ; j++)
      blendTable[i+j*256] = (char) (blendFactor * (float)i + blendFactor_1*(float)j);

}

void blendFrame(int[] now, int[] previous, int nb)
{
  int pix,buf;
  char R,G,B;
  char R_,G_,B_;

  for (int p=0 ; p<nb ; p++)
  {
    pix = now[p];
    R = (char)(red(pix));
    G = (char)(green(pix));
    B = (char)(blue(pix)) ;

    buf = previous[p];
    R_ = (char)(red(buf));
    G_ = (char)(green(buf));
    B_ = (char)(blue(buf)) ;


    R = blendTable[R+R_*256];
    G = blendTable[G+G_*256];
    B = blendTable[B+B_*256];

    now[p] = color(red(R), green(G) , blue(B));
  }

}

// -------------------------------------------
// class PQTorus
// -------------------------------------------
class Torus
{
  public float m_R,m_P,m_Q;

  // Constructor
  Torus(float R, float P, float Q)
  {
    m_R = R;
    m_P = P;
    m_Q = Q;
  }

  // Methods
  vector3 M_getPointAt(float th)
  {
    vector3 p = new vector3();
    float   rA	= 0.5*(2.0+sin(m_Q*th*DEGTORAD));
    p.x	= m_R*rA*cos(m_P*th*DEGTORAD);
    p.y	= m_R*rA*cos(m_Q*th*DEGTORAD);
    p.z	= m_R*rA*sin(m_P*th*DEGTORAD);

    return p;
  }

  vector3 M_getTangentAt(float th)
  {
    float dth = 360.0 / 1000.0f;
    vector3 A = new vector3();
    vector3 B = new vector3();
    vector3 T = new vector3();

    A = this.M_getPointAt(th);
    B = this.M_getPointAt(th+dth);

    T.x = B.x - A.x;
    T.y = B.y - A.y;
    T.z = B.z - A.z;

    T.norm();

    return T;
  }

  float[] M_getTangentBasis(float th)
  {
    float[] Basis = new float[9];
    float dth = 360.0/1000.0;

    vector3 A = new vector3();
    vector3 B = new vector3();

    vector3 T  = new vector3();
    vector3 N  = new vector3();
    vector3 B_ = new vector3();

    A = M_getPointAt(th);
    B = M_getPointAt(th+dth);

    T.set(B.x - A.x, B.y - A.y, B.z - A.z);
    N.set(B.x + A.x, B.y + A.y, B.z + A.z);

    B_ = cross(T, N);
    N  = cross(B_,T);

    N.norm();
    B_.norm();
    T.norm();

    Basis[0] = N.x ; 
    Basis[3] = B_.x ; 
    Basis[6] = T.x ;
    Basis[1] = N.y ; 
    Basis[4] = B_.y ; 
    Basis[7] = T.y ;
    Basis[2] = N.z ; 
    Basis[5] = B_.z ; 
    Basis[8] = T.z ;

    return Basis;
  }

  void M_draw(int res, char drawFlag)
  {
    float   th, dth,dth2;
    vector3 A,B,T;

    th  = 0.0;
    dth = 360.0/(res-1) ;

    for (int i=0 ; i<res ; i++)
    {
      A = this.M_getPointAt(th);
      B = this.M_getPointAt(th+dth);
      th+=dth;

      // Line Drawing
      if ( (drawFlag & drawFlag_Line) ==1)
      {
        stroke(140);
        line(A.x, A.y, A.z, B.x, B.y, B.z);
      }

      // Tangent Drawing
      if ((drawFlag & drawFlag_Tangent)==1)
      {
        T = this.M_getTangentAt(th);
        B.x = A.x + 10.0*T.x;
        B.y = A.y + 10.0*T.y;
        B.z = A.z + 10.0*T.z;

        stroke(255, 0, 0);
        line(A.x, A.y, A.z, B.x, B.y, B.z);

      }

    }
  }
};

// -------------------------------------------
// class Boid
// -------------------------------------------
class Boid
{
  float   m_th, m_th2, m_offset2, m_radius;
  float[] m_basis = new float[9];
  vector3 m_pos   = new vector3(); // expressed in the tangent basis
  vector3 m_origin = new vector3();
  float   m_speed, m_speed2;
  float   m_size;
  color   m_color;
  Torus   m_torus;
  __Tail__   m_tail;

  vector3 sm_newPos = new vector3();

  Boid(Torus torus, float speed, float speed2, float size, float radius){
    m_torus  = torus;
    m_th     = 0.0; 
    m_th2    = 0.0; 
    m_offset2 = 0.0;
    m_speed  = speed; 
    m_speed2 = speed2; 
    m_size   = size;
    m_radius  =radius;

    m_tail   = new __Tail__(50);

  }

  void M_startAt(float th2)
  {
    m_offset2 = th2;
    m_pos = M_getLocalPos(th2);
    m_tail.M_initWith(m_pos);

  }

  vector3 M_getLocalPos(float th)
  {
    return new vector3(
    m_radius * cos(th*DEGTORAD),
    m_radius * sin(th*DEGTORAD),
    0.0
      );
  }

  void M_update(float dt)
  {
    m_pos.set(M_getLocalPos(m_th2+m_offset2));
    m_th+=m_speed*dt; 
    if (m_th>=360.0) m_th -= 360.0;
    m_th2+=m_speed2*dt; 
    if (m_th2>=360.0) m_th2 -= 360.0;

  }

  void M_draw()
  {
    m_basis  = m_torus.M_getTangentBasis(m_th);
    m_origin = m_torus.M_getPointAt(m_th);

    sm_newPos.x = m_basis[0] * m_pos.x + m_basis[3] * m_pos.y + m_basis[6] * m_pos.z + m_origin.x;
    sm_newPos.y = m_basis[1] * m_pos.x + m_basis[4] * m_pos.y + m_basis[7] * m_pos.z + m_origin.y;
    sm_newPos.z = m_basis[2] * m_pos.x + m_basis[5] * m_pos.y + m_basis[8] * m_pos.z + m_origin.z;

    pushMatrix();
    translate(sm_newPos.x, sm_newPos.y, sm_newPos.z);
    noStroke();
    fill(153,0,0);
    box(m_size);
    popMatrix();

    stroke(153,152,168);
    m_tail.M_update(sm_newPos);
    m_tail.M_draw();

  }
};

// -------------------------------------------
// class Tail
// -------------------------------------------
class __Tail__
{
  int         m_pointsNb;
  vector3[]   m_points; 

  __Tail__(int pointsNb)
  {
    m_pointsNb = pointsNb;
    m_points = new vector3[m_pointsNb];
    for (int i=0 ; i<m_pointsNb ; i++) m_points[i] = new vector3();
  }

  void M_initWith(vector3 startPos)
  {
    for (int i=0 ; i< m_pointsNb ; i++) m_points[i].set(startPos);
  }

  void M_update(vector3 newPos)
  {
    for (int i=0 ; i<m_pointsNb-1; i++) m_points[i].set(m_points[i+1]);
    m_points[m_pointsNb-1].set(newPos);
  }

  void M_draw()
  {
    for (int i=0 ; i<m_pointsNb-1 ; i++)
      line(m_points[i].x, m_points[i].y, m_points[i].z,
      m_points[i+1].x, m_points[i+1].y, m_points[i+1].z); 

  }


};

//------------------------------------------------------------
// class timer
//------------------------------------------------------------
class timer
{
  float t;
  timer(float now){
    t = now;
  }
  float M_getDelta(float timeNow)
  {
    float dt = timeNow - t;
    t = timeNow;
    return dt;
  }
};

//------------------------------------------------------------
// class vector3
//------------------------------------------------------------

public class vector3
{
  float x,y,z;

  vector3()
  {
    this.x = 0.0;
    this.y = 0.0;
    this.z = 0.0;
  }

  vector3(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void set(vector3 v)
  {
    this.x = v.x;
    this.y = v.y;
    this.z = v.z;
  }

  void set(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void norm()
  {
    float n = sqrt(x*x + y*y + z*z);
    this.x /= n;
    this.y /= n;
    this.z /= n;
  }

  void zero()
  {
    x = 0.0;
    y = 0.0;
    z = 0.0;
  }

  void output()
  {
    print( "(" + this.x + " ; " + this.y + " ; " + this.z + ")\n");
  }

}

vector3 cross(vector3 a, vector3 b)
{
  vector3 result = new vector3();
  result.x = a.y*b.z - a.z*b.y;
  result.y = a.z*b.x - a.x*b.z;
  result.z = a.x*b.y - a.y*b.x;

  return result;
}


