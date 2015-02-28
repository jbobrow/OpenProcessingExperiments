

class GazeControl
{
  float lx;
  float ly;
  
  GazeControl()
  {
    lx =0;
    ly = 0;
  }
  void update( float time )
  {
    float mx  = ((float)((float)mouseX/(float)width)* 2.-1.);
    float my = ( (float)((float)mouseY/(float)height)* 2.-1.);
    
    float x = 0.;
    float y =0.;
    
    if ( abs(mx)<0.95 && abs(my) <0.95)
    {
      x += mx;
      y += my;
    }
    else
    {
     x += constrain(noise( time*.2+1257.)*4.-2.,-1.,1.);
      y+= constrain(noise( time*.2+127.)*4.-2.,-1.,1.);
    }
    // blend with previous to stop pops
    lx = lerp(lx,x,0.1);
    ly = lerp(ly,y,0.1);    
  }
};

  
class Eyes
{  
  void Draw( GazeControl gaze, float time, float tickleChance )
  {
    PVector specDir = new PVector();
    if( g_drawLawn)
    {
      specDir.set(g_pushPoint);
      specDir.normalize();
    }
    else
      specDir.set(g_Light);
     // eyes -> add blinking     
    float pupilOffsetX = gaze.lx*7.;
    float pupilOffsetY =gaze.ly*10.;     
    float blinkAmount = constrain((noise( time*6.+1257.)-0.65 ) *1./0.2,0.,1.);
    
    float shockAmount = constrain((noise( time*3.+1257.)-0.35 ) *1./0.4,0.,1.);
    shockAmount *= tickleChance;
    float xeye = -20.;
    for (int i =0;i < 2; i++)
    {
      pushMatrix();
       translate(xeye,-30,80.);
       scale(1.,1.3,0.8);
       fill(~0);
        pushMatrix();
       scale(1.,1.-blinkAmount,1.);
       sphere(20.);
        
       // spec highlight
         pushMatrix();
      // translate(8.,-8.,20.);
        translate(specDir.x*6.,specDir.y*6.,22.);
       
       fill(~0);
       noLights();
       sphere(3.);
       lights();
       popMatrix();
        popMatrix();
       translate(pupilOffsetX,pupilOffsetY,15.);
       
       
       fill(0);
       scale(1.,1.1 + shockAmount*0.4,0.8);
       sphere(11.);
       
       // color part of eye
       /*
       translate(0.,-0.,1.);
       scale(1.,1.,0.6);
      fill(color(127,127,255));
       sphere(9.);
       */
      popMatrix();
      xeye = 20.;
    }    
  }
};


class Movement
{
  float y;
  float yvel;
  float ltime;
  Movement()
  {
    y = height*4.;
    yvel=0.;
    ltime =0.;
  }
  void Hit( float force)
  {
    yvel += force;
  }
  void Update( float time)
  {
    float gravity = -698.2f;
    float dt = time - ltime;
    yvel += gravity *dt;
     y += yvel*dt;
    if ( y <= 0.)
    {
      if ( yvel <= 0.)
      {
        if ( yvel > -80.)
          yvel = 0.f;
        yvel = -yvel*.6f;
      }
      y =0.0;
    }
    yvel *=0.97f;
    ltime = time;
  }
}

