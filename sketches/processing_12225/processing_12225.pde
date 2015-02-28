

class PolarCamera
{
  PVector  m_camPos = new PVector(0.0f,2.4f,0.0f);
  float   m_CamAngleX = 0.f;
  float   m_CamAngleY = -0.3f;
  PVector  m_camDir;
  
  PolarCamera(PVector cpos, float angX, float angY )
  {
    m_camPos =cpos;
    m_CamAngleX = angX;
    m_CamAngleY = angY;
    update(0,0);
  }
  PolarCamera()
  {
    update(0,0);
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
  void side(float v )
  {
    PVector f =m_camDir.cross(new PVector(0,1,0));
    f.normalize();;
    f.mult(v*0.25);
    m_camPos.add(f);
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


