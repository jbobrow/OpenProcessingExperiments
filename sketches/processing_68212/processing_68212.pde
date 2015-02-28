
class PolarCamera
{
  PVector  m_camPos = new PVector(1.3f,2.7f,-3.0f);
  float   m_CamAngleX = -0.4f;
  float   m_CamAngleY = -0.5f;
  PVector  m_camDir;
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
  PolarCamera( PVector cpos, float cax, float cay )
  {
    m_camPos= cpos;
    m_CamAngleX = cax;
    m_CamAngleY = cay;
    update( 0,0);
  }
  void update(float dy, float dz)
  {
     m_CamAngleX += dy;
     m_CamAngleY += -dz;
     m_camDir = new PVector(sin(m_CamAngleX)*cos(m_CamAngleY),
               sin(m_CamAngleY),cos(m_CamAngleX)*cos(m_CamAngleY));
  }
  void forward(float v )
  {
    PVector f =new PVector();
    f.set(m_camDir);
    f.mult(v*0.25);
    m_camPos.add(f);
  }
   void rotate(float ang )
   {
     m_camDir.x = sin(ang);
     m_camDir.z = cos(ang);
     m_camDir.y = -0.2f -  0.5*ang/PI;
     m_camPos.x = -m_camDir.x*(2.+ 0.5*ang/PI);
     m_camPos.z = -m_camDir.z*(2.+ 0.5*ang/PI);    
     m_camPos.y =1.0 + 1.5*ang/PI;
     m_camDir.normalize();
      
   }
   
  void side(float v )
  {
    PVector f =m_camDir.cross(new PVector(0,1,0));
    f.normalize();;
    f.mult(v*0.25);
    m_camPos.add(f);
  }
}
 
class Ray
{
  public PVector origin;
  public PVector direction;
  Ray( PVector o, PVector d)
  {
    origin=o;
    direction=d;
  }
  void Lerp( Ray or, float t)
  {
    origin = lerp( origin, or.origin,t);
    direction = lerp( direction, or.direction,t);
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
};
