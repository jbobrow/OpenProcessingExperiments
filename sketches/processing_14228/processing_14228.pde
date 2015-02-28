
// camera

class PolarCamera
{
  float  m_camD;
  float   m_CamAngleX = -0.4f;
  float   m_CamAngleY = -0.5f;
  PVector  m_camDir;
  float    m_camDelta;
  PVector m_camPos;
  PolarCamera()
  {
    update(0,0);
  }
  String Settings()
  {
    return "new PolarCamera( new PVector(" + m_camPos.x +", "
          +  m_camPos.y +", " + m_camPos.z + "), "
          + m_CamAngleX + ", " +  m_CamAngleY + ") ";
  }
  PolarCamera( float d, float cax, float cay, float cd )
  {
    m_camD= d;
    m_CamAngleX = cax;
    m_CamAngleY = cay;
     m_camDelta = cd;
    update( 0,0);
  }
  void update(float dy, float dz)
  {
     m_CamAngleX += dy;
     m_CamAngleY += -dz;
    rotate(m_CamAngleX, m_CamAngleY);              
  }
  void forward(float v )
  {
    m_camD +=v*0.25* m_camDelta;
     rotate(m_CamAngleX, m_CamAngleY);              
  }
   void rotate(float ang, float angy )
   {
     m_camDir = new PVector();
     m_camDir.x = sin(ang)*cos(angy);
     m_camDir.z = cos(ang)*cos(angy);
     m_camDir.y = sin(angy);
     m_camPos = new PVector(0.0,0.0f,0.0);
     m_camPos.x = -m_camDir.x*m_camD;
     m_camPos.z = -m_camDir.z*m_camD;     
     m_camPos.y =-m_camDir.y*m_camD +.25f;
     m_camDir.normalize();
     
   }
  
  void side(float v )
  {
    m_camD +=(v*0.25* m_camDelta);
   rotate(m_CamAngleX, m_CamAngleY);              
  }
}
PVector lerp( PVector a, PVector b, float t) {
  return new PVector( lerp(a.x,b.x,t),lerp(a.y,b.y,t),lerp(a.z,b.z,t));
}
class Ray
{
  public PVector origin;
  public PVector direction;
  Ray() {
    origin =new PVector();
    direction = new PVector();
  }
  Ray( PVector o, PVector d)
  {
    origin=o;
    direction=d;
  }
  void Lerp( Ray or, float t)
  {
    origin = lerp( origin, or.origin,t);
    direction = lerp( direction, or.direction,t);
    direction.normalize();
  }
}

class Camera
{
  PVector position;
  PVector lower_left_corner;
  PVector uvw_u;
  PVector uvw_v;
  PVector uvw_w;

  public Camera(PVector eye, PVector up, PVector gaze,
  float resX, float resY, float d)
  {
    position = eye;
    uvw_v = up;
    uvw_w = gaze;
    uvw_u = uvw_v.cross(uvw_w);
    uvw_u.normalize();
    
    uvw_v = uvw_w.cross(uvw_u );
    uvw_v.normalize();
    
    uvw_w.normalize();
    
    float sX = -resX/2;
    float sY = -resY/2;
    float eX = resX/2;
    float eY = resY/2;
    
    lower_left_corner = new PVector();
    PVector t1= new PVector();
    PVector t2= new PVector();
    t1.set( uvw_w);
    t1.mult(d);
    t2.set(uvw_v);
    t2.mult(sY);
    lower_left_corner.set( uvw_u);
    lower_left_corner.mult(sX);
    lower_left_corner.add(t1);
    lower_left_corner.add(t2);
        
    //uvw_u.mult(resX);
    //uvw_v.mult( resY);
  }

  void generateRay( Ray ray, float screenCoordX, float screenCoordY )
  {
    ray.direction.set( lower_left_corner );
    ray.direction.add( PVector.mult(uvw_v,screenCoordY));
    ray.direction.add(PVector.mult(uvw_u,screenCoordX));
    ray.direction.normalize();
    ray.origin.set(position);
    return;
  }
  Ray generateRay( float screenCoordX, float screenCoordY )
  {
    PVector origin =new PVector();
    PVector up =new PVector();
    PVector acc =new PVector();
    PVector direction = new PVector();
    direction.set( lower_left_corner );
    up.set( uvw_v);
    up.mult( screenCoordY);
    acc.set(uvw_u);
    acc.mult( screenCoordX);
    direction.add(up);
    direction.add(acc);
    direction.normalize();
    origin.set(position);
    return new Ray( origin, direction);
  }
  float[] generateScreen( Ray ray)
  {
    float[] r = new float[2];
    r[0]=-1.;
    r[1]=-1.;
    
    // find intersection with screen plane
    /*float vd = ray.direction.dot(uvw_w);
    if ( abs(vd)<0.0001)
      return r;
      
    float v0 = -(ray.origin.dot(n)+d);
    float t =  v0/vd;
    if ( t < 0.)
      return r;
    */  
    // find hitpoint andreturn it
    return r;
  }
};


