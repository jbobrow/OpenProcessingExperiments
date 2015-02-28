
// camera.pde

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
    f.normalize();
    f.mult(v*0.25);
    m_camPos.add(f);
  }
}

class FlyByCamera
{
  Camera m_prevCamera=null;
  Camera m_currentCamera =null;
  PVector target;
  PVector sposition;
  PVector eposition;

  PVector centre;
  float   radius;

  float endTime;
  float startTime;

  float noiseTargetStrength=0;
  float noisePositionStrength=0;
  float noiseFreq=10.;
  float scimDist =0.75f;
  float flyLowDist=0.00f;

  FlyByCamera( PVector c, float r ) {
    centre = c;
    radius=r;
    endTime=-111000.f;
  }
  PVector noise4DV( PVector target,float  tv, float freq) {
    noiseDetail(1,0.55);
    float time = tv*freq;
    PVector t = PVector.mult(target,freq);
    t.add(13.178f,19.795f,156.95f);
    int it=(int)time;
    t.add(137.f*it,155.f*it,176.f*it);
    // 4D vector noise
    PVector nv0=new PVector( g_NoiseGen.Get(t.x,t.y,t.z),g_NoiseGen.Get(t.y,t.z,t.x),g_NoiseGen.Get(t.z,t.x,t.y) );

    t.add(137.f,155.f,176.f);
    PVector nv1=new PVector( g_NoiseGen.Get(t.x,t.y,t.z),g_NoiseGen.Get(t.y,t.z,t.x),g_NoiseGen.Get(t.z,t.x,t.y) );

    // blend on time
    float ft = time-it;
    PVector r= lerp(nv0,nv1,ft);

    //print(r);
    return r;
  }
  void minMag( PVector v, float mm)
  {
    v.mult( max(mm/v.mag(),1.));
  }

  void newCameraMove(PVector ldir, float time) {
    flyLowDist=random(1.)<.55 ? 0.: max( random(0.2f), random(0.65f));
    scimDist = random(0.5f, 1.1f);
    // add orbit cams ->
    // add sin wave cams??
    // add motion blur?
    sposition = new PVector( random(-5.,5.),
    random(-3.,3.),
    random(-5.,5.));
    minMag( sposition,1.1f);
    eposition = new PVector( random(-5.,5.),
    random(-3.,3.),
    random(-5.,5.));
    minMag( eposition,1.1f);

    float r=radius*.25f;

    // TODO : blend target position??
    target = new PVector( random(-r,r),
    random(-r,r),
    random(-r,r));

    if ( target.dot(ldir)<0 )
    {
      target.mult(-1.);
    }
    if ( eposition.dot(ldir)<0. && sposition.dot(ldir)<0. )
    {
      print("flip Pos");
      sposition.mult(-1.);
      assert( ( eposition.dot(ldir)>0. && sposition.dot(ldir)>0. ) ==false);
    }
    float handheldChance=.5;
    float stantionaryChance=0.5f;
    float closeUpChance=0.5f;
    if ( random(1.)<stantionaryChance)
    {
      target.normalize(); // look a surface    
      if ( random(1.) < closeUpChance ) {
        sposition.normalize();
        sposition.mult(random(1.1f,1.5f));
      }
      eposition.set(sposition);
      handheldChance=.8f;
    }

    if ( flyLowDist >0.00) {
      target.normalize();
      if ( target.dot(sposition)<0.) {
        target.mult(-1.);
      }
    }
    target.add(centre);
    endTime = random(4.,16.);
    startTime= time;
    endTime+=startTime;

    if ( random(1.)<handheldChance) // handheld
    {
      noiseTargetStrength=random(0.,.5);
      noisePositionStrength=random(0.,.25);
    }
    else
    {
      noiseTargetStrength=noisePositionStrength=0.;
    }
    if ( flyLowDist >0.00) {
      noiseTargetStrength*=0.1f;
      noisePositionStrength*=0.1f;
    }
  }
  Camera update( Sphere csphere, PVector ldir, int w, int h, float dz) {
    float time = millis()/1000.f;

    boolean iscut = false;
    if ( time > endTime) {
      newCameraMove(ldir,time);
      iscut = true;
    }

    // option for blending
    assert( time>=startTime && time <=endTime);
    float t =  smoothstep(startTime,endTime,time);

    PVector position=lerp( sposition, eposition, t);
    PVector nvp=noise4DV(position,t,noiseFreq*.15);

    PVector up= new PVector(0.,1.,0.);
    up.add( PVector.mult(nvp,noisePositionStrength));
    up.normalize();
    position.add( PVector.mult(nvp,noisePositionStrength));

    // add pushing
    float d = csphere.GetHieghtCubeMap( position);
    minMag( position,d+0.01);

    PVector nv=noise4DV(target,t,noiseFreq);
    PVector tgt=PVector.add(target, PVector.mult(nv,noiseTargetStrength));
    PVector gaze= PVector.sub(tgt,position);

    if ( flyLowDist>0. || position.mag() < d+0.002) {
      position.normalize();
      position.mult(d+flyLowDist);

      PVector gt = tgt.get();
      gt.normalize();
      up=position.get();
      up.normalize();
      PVector bnrm=gt.cross(position); 

      PVector ntgt=bnrm.cross(position);
      gaze =ntgt;
      //     gaze.normalize();
      gaze=tgt.get();
      gaze.sub(position);
      gaze.normalize();
      gaze.mult(scimDist);
      gt = ntgt.get();
      gt.normalize();
      gaze.add(gt);
      gaze.normalize();

      //up.add(PVector.mult(gaze,100.));
      // up=tgt.cross(bnrm);
      up.mult(-1.);
    }

    m_prevCamera =  m_currentCamera;
    m_currentCamera= new Camera(position,up, gaze, w,h,dz);
    if ( iscut || m_prevCamera==null)
      m_prevCamera = m_currentCamera;
    return m_currentCamera;
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
  PVector getOrigin() {
    return position.get();
  }
  PVector generateDirectionUnNorm( float screenCoordX, float screenCoordY )
  {
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
    return direction;
  }
  PVector generateDirection( float screenCoordX, float screenCoordY )
  {
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
    return direction;
  }
};


