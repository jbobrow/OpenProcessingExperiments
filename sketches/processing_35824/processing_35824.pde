
class mcam
{
  PVector center;
  PVector eye;
  PVector look;
  mcam()
  {
    center = new PVector(0,0,0);
    eye = new PVector(300,300,300);
  }
  mcam(PVector ieye,PVector icenter)
  {
    eye = ieye;
    center = icenter;
  }
  void zoom(float delta)
  {
    cam.eye(PVector.mult(PVector.sub(eye,center),(delta)));
  }

  void rot()
  {
    PVector r = PVector.sub(eye,center);
    PVector n = new PVector(r.x,r.y,0);
    float theta;
    if(r.y < 0)
    {
      theta = atan(r.x/r.y);      
      theta = -PI+theta;
    }
    else
    {
      theta = atan(r.x/r.y);
    }
    float phi;
    if(r.z < 0)
    {
      phi = -acos(n.mag()/r.mag());
    }
    else
    {
      phi = acos(n.mag()/r.mag());
    }    
    float xm =  mouseX-pmouseX;
    float ym = mouseY-pmouseY;
    theta -= xm/100;
    phi += ym/100;
    cam.eye = new PVector(r.mag()*cos(phi)*sin(theta)+center.x,r.mag()*cos(phi)*cos(theta)+center.y,r.mag()*sin(phi)+center.z);
  }
  void mov()
  {
    PVector r = PVector.sub(eye,center);
    PVector n = new PVector(r.x,r.y,0);  
    n.normalize();
    r.normalize();
    float xm =  pmouseX-mouseX;
    float ym = pmouseY-mouseY;       
    cam.eye(PVector.add(PVector.mult(n.cross(r),xm/1),PVector.mult(n,ym/1)));
    cam.center(PVector.add(PVector.mult(n.cross(r),xm/1),PVector.mult(n,ym/1)));
  }
  void eye(PVector diff)
  {
    eye.add(diff);
  }
  void center(PVector diff)
  {
    center.add(diff);
  }
  void cam()
  {
    look = PVector.sub(center,eye);
    //  camera(eye.x+offset.x,eye.y+offset.y,eye.z+offset.z,center.x+offset.x,center.y+offset.y,center.z+offset.z,0,0,-1);    
    pg3.camera(eye.x,eye.y,eye.z,center.x,center.y,center.z,0,0,-1);  
    //  println(center);
    pg3.directionalLight(100,100,100,look.x,look.y,look.z);
  }

  void reset()
  {
    pg3.camera(width/2.0, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }
}


