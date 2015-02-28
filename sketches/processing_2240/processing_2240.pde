
//import processing.opengl.*;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Written by v3ga - http://www.v3ga.net
// Updated to processing 118 by Martin Antolini
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


float DEGTORAD = PI/180.0f;
//------------------------------------------------------------
// Globals
//------------------------------------------------------------
VerletPhysicsEngine Verlet;
MeshParticleObject  Pyramid;
MeshParticleObject  Sphere;
MeshParticleObject  currentObj;
Container           boxContainer;
ArcBall_           arcball;

float               gTime, gLastTime, gdt;
boolean             showParticle;
//------------------------------------------------------------
// Main
//------------------------------------------------------------

void setup()
{


  // Physics Engine
  Verlet           = new VerletPhysicsEngine();
  Verlet.m_gravity = new vector3(0.0f, 9.81f , 0.0f);
  Verlet.m_nbIterations = 3;

  // Objects
  createSphere(75.0f, 6, 6, 0.65f); // createSphere(float s, int sliceNb, int slicePointNb, float jello)
  currentObj   = Sphere;
  showParticle = false;

  // Container
  boxContainer = new Container(200.0f);

  // Rendering
  size(640,480, P3D);
  rectMode(CENTER);  
  // Control
  arcball = new ArcBall_();

  // Time
  gLastTime = 0.0f;
}

void draw()
{
  gTime = millis();
  gdt = (gTime - gLastTime)*0.001;
  gLastTime = gTime;

  // Center
  background(255);
  translate(0.5*width,0.5*height, 100);
  // Step
  Verlet.M_step(gdt);

  // Input Transform
  boxContainer.m_orientation = multiply(arcball.mouseQuat, arcball.startQuat);
  boxContainer.m_orientation.normalize();
  boxContainer.M_update();

  // Render 
  drawScene();

}

void drawScene()
{
  pushMatrix();
  applyMatrix
    (
  boxContainer.m_matrix3[0], boxContainer.m_matrix3[3], boxContainer.m_matrix3[6], 0.0,
  boxContainer.m_matrix3[1], boxContainer.m_matrix3[4], boxContainer.m_matrix3[7], 0.0,
  boxContainer.m_matrix3[2], boxContainer.m_matrix3[5], boxContainer.m_matrix3[8], 0.0,
  0.0,           0.0,           0.0,           1.0
    );
  boxContainer.M_render();
  currentObj.M_render(showParticle? MeshParticleObject.WIRED : MeshParticleObject.FLAT);
  popMatrix();
}

//------------------------------------------------------------
// Control
//------------------------------------------------------------
void mousePressed()
{

  arcball.circlePointStart.x = (mouseX - 0.5*width) / (0.5*width);
  arcball.circlePointStart.y = (mouseY - 0.5*height) / (0.5*width);
  arcball.spherePointStart = arcball.getPointSphere(arcball.circlePointStart);
  arcball.startQuat.set(boxContainer.m_orientation);
  arcball.mouseQuat.setIdentity();


}

void mouseDragged()
{

  arcball.circlePointEnd.x = (mouseX - 0.5*width) / (0.5*width);
  arcball.circlePointEnd.y = (mouseY - 0.5*height) / (0.5*width);
  arcball.spherePointEnd = arcball.getPointSphere(arcball.circlePointEnd);
  arcball.mouseQuat = arcball.getQuat(arcball.spherePointStart, arcball.spherePointEnd);

}

void keyPressed()
{
  switch(key)
  {
  case 'G':
  case 'g':
    Verlet.m_gravity.y = -Verlet.m_gravity.y ;
    break;

  case 'P':
  case 'p':
    showParticle = !showParticle;
    break;
  }
}


// ****************************
// class Particle
// ****************************
class Particle
{
  int      m_id;
  vector3  m_pos      = new vector3();    // position
  vector3  m_oldpos   = new vector3();    // previous position
  vector3  m_a        = new vector3();    // acceleration

  Particle(int id)
  {
    m_id = id;
    m_pos.zero();
    m_oldpos.zero();
  }

  Particle(int id, float x0, float y0, float z0)
  {
    m_id = id;
    m_pos.set(x0, y0, z0);
    m_oldpos.set(x0, y0, z0);
  }

}

// ****************************
// Constraint
// ****************************

class Constraint
{
  final static int RIGID = 0x01;
  final static int SOFT  = 0x02;

  int   m_type;
  float m_restLength;
  float m_softLength = 0.0f;
  int   m_A,m_B;
  particleSystem m_parent;
  float m_jellyCoeff;
  boolean m_isDraw;

  Constraint(particleSystem parent, int A, int B, int type, float jellyCoeff, boolean isDraw)
  {
    m_parent = parent;
    m_type = type;
    m_A = A;
    m_B = B;
    m_jellyCoeff = jellyCoeff;
    m_isDraw = isDraw;
    M_setRestLength();
  }
  //------------------------------------------------------------
  // M_setRestLength()
  //------------------------------------------------------------
  void M_setRestLength()
  {
    float dx = m_parent.m_P[m_B].m_pos.x - m_parent.m_P[m_A].m_pos.x;
    float dy = m_parent.m_P[m_B].m_pos.y - m_parent.m_P[m_A].m_pos.y;
    float dz = m_parent.m_P[m_B].m_pos.z - m_parent.m_P[m_A].m_pos.z;

    m_restLength = sqrt(dx*dx + dy*dy + dz*dz);

  }
  //------------------------------------------------------------
  // M_draw()
  //------------------------------------------------------------

  void M_draw()
  {
    if (!m_isDraw) return; 
    float x1,y1,x2,y2,z1,z2;
    x1 =  m_parent.m_P[m_A].m_pos.x ;
    y1 =  m_parent.m_P[m_A].m_pos.y ;
    z1 =  m_parent.m_P[m_A].m_pos.z ;

    x2 =  m_parent.m_P[m_B].m_pos.x ;
    y2 =  m_parent.m_P[m_B].m_pos.y ;
    z2 =  m_parent.m_P[m_B].m_pos.z ;

    noFill();
    stroke(150,150,150,127);
    line (x1,y1,z1,x2,y2,z2);
    noStroke();

    fill(255,0,0);
    pushMatrix();
    translate(x1,y1,z1);
    box(4);
    popMatrix();    
    pushMatrix();
    translate(x2,y2,z2);
    box(4);
    popMatrix();    

  }

}

// ****************************
// class particleSystem
// ****************************
class particleSystem
{
  int           m_nb;
  int           m_nbC;
  Particle[]    m_P;
  Constraint[]  m_C;
  boolean       m_isJelly;
  vector3[]     m_temp;

  particleSystem(int nbParticles, int nbConstraints)
  {
    m_nb  = nbParticles;
    m_nbC = nbConstraints;

    m_P  = new Particle[nbParticles];
    if (m_nbC !=0 )   m_C  = new Constraint[nbConstraints];

    m_temp  = new vector3[nbParticles];
  }

  //------------------------------------------------------------
  // M_draw()
  //------------------------------------------------------------

  void M_draw()
  {
    pushMatrix();
    for (int i=0;i<m_nbC;i++)
      m_C[i].M_draw();
    popMatrix();
  }
}
// ****************************
// MeshParticleObject
// ****************************

class MeshParticleObject extends particleSystem
{
  final static int WIRED  = 0x01;
  final static int FLAT   = 0x02; 
  final static int SMOOTH = 0x04;

  float     m_size = 1.0f;
  vector3[] m_vertexArray;        // vertex 
  int       m_vertexArrayNb;
  Face[]    m_faceArray;
  int       m_faceArrayNb;

  MeshParticleObject(int nbParticles, int nbConstraints)
  {
    // particleSystem
    super(nbParticles,nbConstraints);
    // Mesh
    m_vertexArray   = new vector3[nbParticles];
    m_vertexArrayNb = nbParticles;
  }

  void M_createParticles()
  {
    for (int n=0 ; n<m_vertexArrayNb ; n++)
    {
      m_P[n]     = new Particle(n, m_vertexArray[n].x,  m_vertexArray[n].y, m_vertexArray[n].z);
      m_temp[n]  = new vector3();
    }
  }

  void M_createFaces(int nb)
  {
    m_faceArray = new Face[nb];
    m_faceArrayNb = nb;
  }

  void M_createNormals()
  {

    vector3 A  = new vector3();
    vector3 B  = new vector3();
    vector3 C  = new vector3();
    vector3 AB = new vector3();
    vector3 AC = new vector3();
    //Face    f  = new Face();

    for (int n=0 ; n< m_faceArrayNb ; n++)
    {
      Face f = m_faceArray[n];
      A.set(m_vertexArray[f.A]);
      B.set(m_vertexArray[f.B]);
      C.set(m_vertexArray[f.C]);
      AB.x = B.x - A.x ; 
      AB.y = B.y - A.y ; 
      AB.z = B.z - A.z ;   
      AC.x = C.x - A.x ; 
      AC.y = C.y - A.y ; 
      AC.z = C.z - A.z ;  

      f.n = cross(AB, AC);  
      f.n.norm();    
    }
  }


  void M_drawTriangle(Face f)
  {
    beginShape(TRIANGLES);
    vertex(m_vertexArray[f.A].x, m_vertexArray[f.A].y, m_vertexArray[f.A].z);
    vertex(m_vertexArray[f.B].x, m_vertexArray[f.B].y, m_vertexArray[f.B].z);
    vertex(m_vertexArray[f.C].x, m_vertexArray[f.C].y, m_vertexArray[f.C].z);
    endShape();
  }

  void M_render(int mode)
  {
    switch(mode)
    {
      case (WIRED):
      M_draw();
      break;

    case FLAT:
      noStroke();
      for (int n=0 ; n< m_faceArrayNb ; n++)
      {
        // BackFace Culling
        vector3 A  = new vector3();
        vector3 B  = new vector3();
        vector3 C  = new vector3();
        vector3 AB = new vector3();
        vector3 AC = new vector3();

        Face f = m_faceArray[n];
        A.set(m_vertexArray[f.A]);
        B.set(m_vertexArray[f.B]);
        C.set(m_vertexArray[f.C]);
        AB.x = B.x - A.x ; 
        AB.y = B.y - A.y ; 
        AB.z = B.z - A.z ;   
        AC.x = C.x - A.x ; 
        AC.y = C.y - A.y ; 
        AC.z = C.z - A.z ;  

        f.n = cross(AB, AC);  
        f.n.norm();              


        //vector3 n = cross
        float l = boxContainer.m_matrix3[2]*f.n.x +  boxContainer.m_matrix3[5]*f.n.y + boxContainer.m_matrix3[8]*f.n.z;
        if (l<0.2f )
        {
          fill((int)(-l*255),0,0);        // lighting ;-)
          M_drawTriangle(f);
        }  
      }
      noFill();

      break;
    }
  }


}

// ****************************
// VerletPhysicsEngine
// ****************************

class VerletPhysicsEngine
{
  vector3 m_gravity;
  int     m_nbIterations;

  VerletPhysicsEngine()
  {
  }

  void M_accumulateForces()
  {
    vector3 g_ = new vector3();
    // ---> gravity in Local frame of container
    //boxContainer.M_makeMatrix3Inv();
    g_.x = boxContainer.m_matrix3[0] * m_gravity.x + boxContainer.m_matrix3[1] * m_gravity.y + boxContainer.m_matrix3[2] * m_gravity.z;
    g_.y = boxContainer.m_matrix3[3] * m_gravity.x + boxContainer.m_matrix3[4] * m_gravity.y + boxContainer.m_matrix3[5] * m_gravity.z;
    g_.z = boxContainer.m_matrix3[6] * m_gravity.x + boxContainer.m_matrix3[7] * m_gravity.y + boxContainer.m_matrix3[8] * m_gravity.z;

    // ---> gravity
    for (int i=0;i<currentObj.m_nb;i++)
      currentObj.m_P[i].m_a.set(g_);
  }

  void M_satisfyConstraints()
  {
    float v,d;
    float dx,dy,dz,dlength,diff;
    int A,B;
    Constraint c;
    vector3 pos, posA, posB;

    // ---> Compute the length of a constraint when it collides 

    for (int i=0;i<currentObj.m_nb;i++)
    {
      pos = currentObj.m_P[i].m_pos;
      currentObj.m_temp[i].set(
      min(max(pos.x, -boxContainer.m_w2), boxContainer.m_w2),
      min(max(pos.y, -boxContainer.m_w2), boxContainer.m_w2),
      min(max(pos.z, -boxContainer.m_w2), boxContainer.m_w2)
        );
    }

    // ---> Compute now the length of the constraint to be restored
    for (int i=0;i<currentObj.m_nbC;i++)
    {
      c = currentObj.m_C[i];

      if (c.m_type == Constraint.SOFT)
      {
        A    = c.m_A;
        B    = c.m_B;
        posA = currentObj.m_temp[A];
        posB = currentObj.m_temp[B];


        dx = posB.x - posA.x;
        dy = posB.y - posA.y;
        dz = posB.z - posA.z;

        c.m_softLength = sqrt(dx*dx + dy*dy + dz*dz);
        c.m_softLength = (c.m_restLength - c.m_softLength)*c.m_jellyCoeff + c.m_softLength;
      }
      else if (c.m_type == Constraint.RIGID)
      {
        c.m_softLength = c.m_restLength;
      }
    }

    // ---> Satisfy World Constraints + internal constraints
    for (int nIt = 0 ; nIt<Verlet.m_nbIterations; nIt++)
    {
      for (int i=0;i<currentObj.m_nb;i++)
      {
        pos = currentObj.m_P[i].m_pos;
        pos.set(
        min(max(pos.x, -boxContainer.m_w2), boxContainer.m_w2),
        min(max(pos.y, -boxContainer.m_w2), boxContainer.m_w2),
        min(max(pos.z, -boxContainer.m_w2), boxContainer.m_w2)
          );    
      }
    }

    for (int i=0;i<currentObj.m_nbC;i++)
    {
      A = currentObj.m_C[i].m_A;
      B = currentObj.m_C[i].m_B;

      posA = currentObj.m_P[A].m_pos;
      posB = currentObj.m_P[B].m_pos;

      dx =  posB.x - posA.x;
      dy =  posB.y - posA.y;
      dz =  posB.z - posA.z;

      dlength = sqrt(dx*dx + dy*dy + dz*dz);
      diff    = (dlength - currentObj.m_C[i].m_softLength)/dlength;

      posA.x += dx*0.5*diff;
      posA.y += dy*0.5*diff;
      posA.z += dz*0.5*diff;

      posB.x -= dx*0.5*diff;
      posB.y -= dy*0.5*diff;
      posB.z -= dz*0.5*diff;
    }

  }

  void M_integrate(float dt)
  {
    float    tempx, tempy, tempz;
    float    dt2 = dt*dt;
    Particle p;

    for (int i=0;i<currentObj.m_nb;i++)
    {
      p     = currentObj.m_P[i];
      tempx = p.m_pos.x;
      tempy = p.m_pos.y;
      tempz = p.m_pos.z;

      p.m_pos.x += (p.m_pos.x - p.m_oldpos.x) + p.m_a.x*dt;
      p.m_pos.y += (p.m_pos.y - p.m_oldpos.y) + p.m_a.y*dt;
      p.m_pos.z += (p.m_pos.z - p.m_oldpos.z) + p.m_a.z*dt;
      p.m_oldpos.set(tempx, tempy, tempz);

      // 
      currentObj.m_vertexArray[i].set(p.m_pos);
    }
  }

  void M_step(float dt)
  {
    M_accumulateForces();
    M_integrate(dt);
    M_satisfyConstraints();
  }

}


// ****************************
// Objects Creation
// ****************************
void createSphere(float s, int sliceNb, int slicePointNb, float jelly)
{
  int      sliceStep         = slicePointNb-2;
  float    sliceStepAngle    = 180.0f / (float)(slicePointNb-1);
  float    sliceAngle        = 0.0f;
  float    rotationStepAngle = 360.0f / (float)(sliceNb);
  float    rotationAngle     = 0.0f;
  vector3  vLocal            = new vector3();
  vector3  v                 = new vector3();
  int      vIndex,cIndex;
  float    cosAngle, sinAngle;
  int      particleNb, constraintNb;


  particleNb   = 3+sliceNb*(slicePointNb-2);
  constraintNb = 2+( (slicePointNb-1) + (slicePointNb-2) + (slicePointNb-2) + (slicePointNb-3)*2 )*sliceNb;

  println("constraintNb:" + constraintNb);
  println("particleNb:" + particleNb);

  Sphere        = new MeshParticleObject(particleNb, constraintNb/*2+7*5+40*/);
  Sphere.m_size = s;
  Sphere.m_vertexArray[0] = new vector3(0.0f, -Sphere.m_size, 0.0f);
  Sphere.m_vertexArray[1] = new vector3(0.0f, 0.0f, 0.0f);
  Sphere.m_vertexArray[2] = new vector3(0.0f, Sphere.m_size, 0.0f);

  // ---> Vertex Array
  vIndex = 3;

  for (int n=0 ; n<sliceNb ; n++)
  {
    // Rotate (i,j,k) around y to form a new basis
    rotationAngle = n*rotationStepAngle;
    cosAngle = cos(rotationAngle*DEGTORAD);
    sinAngle = sin(rotationAngle*DEGTORAD);

    for (int m=1; m<slicePointNb-1 ; m++)
    {
      sliceAngle = -90.0f + m*sliceStepAngle;

      vLocal.x = Sphere.m_size*cos(sliceAngle * DEGTORAD);
      vLocal.y = Sphere.m_size*sin(sliceAngle * DEGTORAD);
      vLocal.z = 0.0f;

      // Transform local vertex

      v.x = cosAngle*vLocal.x + sinAngle*vLocal.z;
      v.y = vLocal.y; 
      v.z = -sinAngle*vLocal.x + cosAngle*vLocal.z;

      Sphere.m_vertexArray[vIndex++] = new vector3(v.x, v.y, v.z);
    }
  }

  // ---> Particles
  Sphere.M_createParticles();

  // ---> Constraints
  Sphere.m_C[0] = new Constraint( (particleSystem) Sphere, 1, 0, Constraint.SOFT, jelly,false);
  Sphere.m_C[1] = new Constraint( (particleSystem) Sphere, 1, 2, Constraint.SOFT, jelly,false);
  cIndex = 2;

  for (int n=0 ; n<sliceNb ; n++)
  {
    // Center To Point
    for (int m=0; m<slicePointNb-2 ; m++)
    {
      Sphere.m_C[cIndex++] = new Constraint( (particleSystem) Sphere, 1, 3+sliceStep*n+m, Constraint.SOFT, jelly,false);
    }

    // Point To point
    int A,B,C,D;

    for (int m=0; m<slicePointNb-1 ; m++)
    {
      A = (m==0) ? 0 : 3+sliceStep*n+m-1;
      B = (m==slicePointNb-2) ? 2 : 3+sliceStep*n+m;
      Sphere.m_C[cIndex++] = new Constraint( (particleSystem) Sphere, A, B, Constraint.SOFT, jelly,true);
    }   

  }

  // Finish by creating the surface constraints
  int A,B,C,D;
  for (int n=0 ; n<sliceNb; n++)
  {
    for (int m=1; m<slicePointNb-1 ; m++)
    {
      A = 3+sliceStep*n+m-1;
      if (n < sliceNb-1) { 
        C = (A + sliceStep); 
      } 
      else {
        C =3+m-1;
      }
      Sphere.m_C[cIndex++] = new Constraint( (particleSystem) Sphere, A, C, Constraint.SOFT, jelly,true);

    }


    for (int m=1; m<sliceStep ; m++)
    {
      A = 3+sliceStep*n+m-1;
      B = 3+sliceStep*n+m;
      if (n < sliceNb-1) { 
        C = (A + sliceStep); 
      } 
      else {
        C =3+m-1;
      }
      if (n < sliceNb-1) { 
        D = (B + sliceStep); 
      } 
      else {
        D =3+m  ;
      }

      Sphere.m_C[cIndex++] = new Constraint( (particleSystem) Sphere, A, D, Constraint.SOFT, jelly,true);
      Sphere.m_C[cIndex++] = new Constraint( (particleSystem) Sphere, B, C, Constraint.SOFT, jelly,true);

    } 

  }

  // Creates Faces
  Sphere.M_createFaces(2*sliceNb/*Caps*/ + 2*(sliceStep-1)*sliceNb/*Body*/);
  int nbFace = 0;
  // ---> Caps
  for (int n=0 ; n <sliceNb ; n++)
  {
    A = 0;
    B = 3+sliceStep*n;
    if (n < sliceNb-1) {
      C = 3+sliceStep*(n+1);
    } 
    else {
      C = 3;
    }
    Sphere.m_faceArray[nbFace++] = new Face(A,B,C);
    //println("Face_"+n+"    A:" + A + "- B:" + B + " -C:" + C);
  }

  for (int n=0 ; n <sliceNb ; n++)
  {
    A = 2;
    C = 3 + (sliceStep-1) + sliceStep*n;
    if (n < sliceNb-1) {
      B = 3+(sliceStep-1)+sliceStep*(n+1);
    } 
    else {
      B = 3+(sliceStep-1);
    }
    Sphere.m_faceArray[nbFace++] = new Face(A,B,C);
    //println("Face_"+n+"    A:" + A + "- B:" + B + " -C:" + C);
  }

  // ---> Body
  for (int n=0 ; n<sliceNb; n++)
  {
    for (int m=1; m<sliceStep ; m++)
    {
      A = 3+sliceStep*n+m-1;
      B = 3+sliceStep*n+m;
      if (n < sliceNb-1) { 
        C = (A + sliceStep); 
      } 
      else {
        C =3+m-1;
      }
      if (n < sliceNb-1) { 
        D = (B + sliceStep); 
      } 
      else {
        D =3+m  ;
      }

      Sphere.m_faceArray[nbFace++] = new Face(B,C,A);
      Sphere.m_faceArray[nbFace++] = new Face(C,B,D);
    }
  }          
  // ---> Normals
  Sphere.M_createNormals();


}

// ****************************
// Cubic Container
// ****************************
class Container
{

  float    m_w,m_w2;
  Quat     m_orientation = new Quat();
  float[]  m_matrix3     = new float[9];

  Container(float w)
  {
    this.m_w  = w;
    this.m_w2 = 0.5f*w;
  }

  void M_render()
  {
    stroke(220);
    noFill();
    box(m_w);    
  }

  void M_update()
  {
    m_matrix3 = m_orientation.toMatrix3();
  }


}

//**************************************************
//**************************************************
//------------------------------------------------------------
// vector3
//------------------------------------------------------------

class vector3
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
// ****************************
// Face
// ****************************
class Face
{
  int A,B,C;
  vector3 n;
  Face(int A, int B, int C)
  {
    this.A = A;
    this.B = B;
    this.C = C;
  }
}

//------------------------------------------------------------
// Quat class
//------------------------------------------------------------

class Quat
{

  float r,x,y,z;



  Quat()
  {
    setIdentity();
  }

  Quat(float r, float x, float y, float z)
  {
    set(r,x,y,z);
  }

  void setIdentity()
  {
    this.r = 1.0;
    this.x = 0.0;
    this.y = 0.0;
    this.z = 0.0;
  }

  void set(float r,float x,float y,float z)
  {
    this.r = r;
    this.x = x;
    this.y = y;
    this.z = z;  
  }

  void set(float r, vector3 v)
  {
    this.r = r;
    this.x = v.x;
    this.y = v.y;
    this.z = v.z;
  }

  void set(Quat q)
  {
    this.r = q.r;
    this.x = q.x;
    this.y = q.y;
    this.z = q.z;


  }

  void normalize()
  {
    float norm;
    norm = sqrt(r*r + x*x + y*y + z*z);

    this.r /= norm;
    this.x /= norm;
    this.y /= norm;
    this.z /= norm;
  }  

  boolean isUnit()
  {
    return (r*r + x*x + y*y + z*z > 0.99);
  }  

  void conjuguate()
  {
    this.x = -this.x;
    this.y = -this.y;
    this.z = -this.z;  
  }

  void multiplyBy(Quat q2)
  {
    Quat qTemp=new Quat();
    qTemp.r = this.r;
    qTemp.x = this.x;
    qTemp.y = this.y;
    qTemp.z = this.z;

    this.r = qTemp.r * q2.r - (qTemp.x * q2.x + qTemp.y * q2.y + qTemp.z * q2.z);
    this.x = qTemp.r * q2.x +  q2.r * qTemp.x + qTemp.y * q2.z - qTemp.z * q2.y; 
    this.y = qTemp.r * q2.y -  q2.z * qTemp.x + qTemp.y * q2.r + qTemp.z * q2.x;
    this.z = qTemp.r * q2.z +  q2.y * qTemp.x - qTemp.y * q2.x + qTemp.z * q2.r;

  }

  void multiplyBy(float a)
  {
    this.r *= a;
    this.x *= a;
    this.y *= a;
    this.z *= a;
  }


  void vectorTransform(vector3 v)
  {
    this.r = 0;
    this.x = v.x;
    this.y = v.y;
    this.z = v.z;

  }


  float[] toMatrix3()
  {
    float rx, ry, rz, xx, yy, yz, xy, xz, zz, x2, y2, z2; 
    float[] matrix = new float[9];

    x2 = this.x + this.x; 
    y2 = this.y + this.y; 
    z2 = this.z + this.z;

    xx = this.x * x2; 
    xy = this.x * y2; 
    xz = this.x * z2;
    yy = this.y * y2; 
    yz = this.y * z2; 
    zz = this.z * z2;
    rx = this.r * x2; 
    ry = this.r * y2; 
    rz = this.r * z2;


    matrix[0] = 1.0 - (yy + zz); 
    matrix[1] = xy + rz; 
    matrix[2] = xz - ry; 

    matrix[3] = xy - rz;
    matrix[4] = 1.0 - (xx + zz);
    matrix[5] = yz + rx;

    matrix[6] = xz + ry; 
    matrix[7] = yz - rx; 
    matrix[8] = 1.0 - (xx + yy); 

    return matrix;

  }
}





// -------------------------------------------------------------
// Multiply()
// q = q1*q2
// -------------------------------------------------------------

Quat multiply(Quat q1, Quat q2)
{

  Quat result = new Quat();
  result.r = q1.r * q2.r - (q1.x * q2.x + q1.y * q2.y + q1.z * q2.z);
  result.x = q1.r * q2.x +  q2.r * q1.x + q1.y * q2.z - q1.z * q2.y; 
  result.y = q1.r * q2.y -  q2.z * q1.x + q1.y * q2.r + q1.z * q2.x;
  result.z = q1.r * q2.z +  q2.y * q1.x - q1.y * q2.x + q1.z * q2.r;

  return result;
}


Quat multiply(Quat q, float a)
{
  Quat result = new Quat();
  result.r = q.r * a;
  result.x = q.x * a;
  result.y = q.y * a;
  result.z = q.z * a;
  return result;
}



// -------------------------------------------------------------
// vectorRotate()
// Rotates a vector3 , rotation given by a Quat
// result = q.v.q^-1
// -------------------------------------------------------------

vector3 vectorRotate(vector3 v, Quat rot)
{
  vector3 result   = new vector3();
  Quat invr  = new Quat();
  Quat qv    = new Quat();
  Quat tmp   = new Quat();

  invr.r =  rot.r;
  invr.x = -rot.x;
  invr.z = -rot.y;
  invr.z = -rot.z;

  qv.vectorTransform(v);

  tmp = multiply(qv, invr);
  invr = multiply(rot, tmp); 

  result.x = invr.x;
  result.y = invr.y;
  result.z = invr.z;	

  return result;
}

// -------------------------------------------------------------
// eulerTransform
// Takes 3 angles, and returns a Quat
// -------------------------------------------------------------

Quat eulerTransform(float alpha, float beta, float gamma)
{
  Quat result = new Quat();
  float cr, cp, cy, sr, sp, sy, cpcy, spsy;

  alpha *= DEGTORAD;
  beta  *= DEGTORAD;
  gamma *= DEGTORAD;

  cr = cos(alpha/2);

  cp = cos(beta/2);
  cy = cos(gamma/2);


  sr = sin(alpha/2);
  sp = sin(beta/2);
  sy = sin(gamma/2);

  cpcy = cp * cy;
  spsy = sp * sy;


  result.r = cr * cpcy + sr * spsy;
  result.x = sr * cpcy - cr * spsy;
  result.y = cr * sp * cy + sr * cp * sy;
  result.z = cr * cp * sy - sr * sp * cy;

  return result;
}


// -------------------------------------------------------------
// SLERP: Spherical Linear Interpolation
// Step from q1 to q2, 0=<t=<1
// SLERP(q1,q2,0) = q1
// SLERP(q1,q2,1) = q2
// -------------------------------------------------------------

Quat SLERP(Quat q1, Quat q2, float t)
{
  Quat result = new Quat();
  float[]     to1 = new float[4];
  float       omega, cos_omega, sin_omega, scale0, scale1;


  // calc cosine
  cos_omega = q1.r*q2.r + q1.x*q2.x + q1.y*q2.y + q1.z*q2.z;


  // adjust signs (if necessary)
  if ( cos_omega <0.0 ){ 
    cos_omega = -cos_omega; 
    to1[0] = - q2.r;
    to1[1] = - q2.x;
    to1[2] = - q2.y;
    to1[3] = - q2.z;

  } 
  else  {
    to1[0] =   q2.r;
    to1[1] =   q2.x;
    to1[2] =   q2.y;
    to1[3] =   q2.z;
  }


  // calculate coefficients


  if ( (1.0 - cos_omega) > 0.01 ) {
    // standard case (slerp)
    omega = (float)Math.acos(cos_omega);
    sin_omega = sin(omega);
    scale0 = sin((1.0 - t) * omega) / sin_omega;
    scale1 = sin(t * omega) / sin_omega;


  } 
  else {        
    // "from" and "to" Quats are very close 
    //  ... so we can do a linear interpolation
    scale0 = 1.0 - t;
    scale1 = t;
  }
  // calculate final values
  result.r = scale0 * q1.r + scale1 * to1[0];
  result.x = scale0 * q1.x + scale1 * to1[1];
  result.y = scale0 * q1.y + scale1 * to1[2];
  result.z = scale0 * q1.z + scale1 * to1[3];

  return result;
}


// ****************************
// class ArcBall
// ****************************
class ArcBall_
{


  vector3     circlePointStart, circlePointEnd, spherePointStart, spherePointEnd;
  Quat        startQuat, mouseQuat;

  ArcBall_()
  {
    circlePointStart = new vector3();
    circlePointEnd   = new vector3();
    spherePointStart = new vector3();
    spherePointEnd   = new vector3();
    startQuat        = new Quat();
    mouseQuat        = new Quat();


  }

  vector3 getPointSphere(vector3 P)
  {
    float r = P.x*P.x + P.y*P.y;
    vector3 result = new vector3();

    result.x = P.x;
    result.y = P.y;
    result.z = P.z;    

    if(r>1.0)
    {	
      float sr = sqrt(r);
      result.x /= sr;
      result.y /= sr;	
      result.z = 0.0;
    }
    else
      result.z = sqrt( 1.0-r);  



    return result;

  }
  Quat getQuat(vector3 pStartPoint, vector3 pEndPoint)
  {
    Quat        result = new Quat();
    vector3     crossResult;
    float       dotResult;


    crossResult = cross(pStartPoint,pEndPoint);
    dotResult   = pStartPoint.x*pEndPoint.x + pStartPoint.y*pEndPoint.y + pStartPoint.z*pEndPoint.z;

    result.set(dotResult, crossResult);  

    return result;
  }

}



