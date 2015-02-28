
class PCamera{
  
  PVector position = new PVector(0,0,0);
  PVector look = new PVector(PI,PI);
  public int cx,cy,cz;
  float spd = 2;
  public PCamera(int x,int y,int z)
  {
    position = new PVector(x,y,z);
    cx=x; cy=y; cz =z;
    Update(g);
  }
  public PCamera(int x,int y,int z,float ax,float ay)
  {
    position = new PVector(x,y,z);
    cx=x; cy=y; cz =z;
    look = new PVector(ax,ay);
    Update(g);
  }
  public PCamera(int x,int y,int z,int lx,int ly, int lz)
  {
    position = new PVector(x,y,z);
    cx=x; cy=y; cz =z;
    look.x = PVector.angleBetween(new PVector(position.x,position.z),new PVector(lx,lz));
    Update(g);
  }
  public void Update(PVector position,PVector look,PGraphics g)
  {
    //input();
    g.beginCamera();
    g.pushMatrix();
    g.camera(position.x, position.y, position.z, position.x, position.y, position.z-1, 0, 1, 0 );
    if(mousePressed && mouseButton == RIGHT)
    {
    look.y += radians(dist1D(mouseX, pmouseX)*0.5);
    look.x += radians(dist1D(mouseY, pmouseY)*0.5);
    }
    cx=(int)position.x; cy=(int)position.y; cz =(int)position.z;
    g.rotateY(look.y);
    g.rotateX(look.x);
    g.popMatrix();
    g.endCamera();
  }
  
  public void UpdateMatrix(PGraphics g)
  {
    //input();
    g.beginCamera();
    g.pushMatrix();
    g.camera(position.x, position.y, position.z, position.x, position.y, position.z-1, 0, 1, 0 );
    g.rotateY(look.y);
    g.rotateX(look.x);
    g.popMatrix();
    g.endCamera();
  }
  
  public void UpdateMatrix(PVector position,PVector look,PGraphics g)
  {
    //input();
    g.beginCamera();
    g.pushMatrix();
    g.camera(position.x, position.y, position.z, position.x, position.y, position.z-1, 0, 1, 0 );
    g.rotateY(look.y);
    g.rotateX(look.x);
    g.popMatrix();
    g.endCamera();
  }
  
  public void Update(PGraphics g)
  {
    Update(position,look,g);
  }
  
  public void ResetMatrix()
  {
    beginCamera();
    camera();
    endCamera();
  } 

void input()
{
  if(keyPressed)
  {
    float sly = sin(look.y),
          cly = cos(look.y),
          clx = cos(look.x),
          clpx = cos(look.x-PI/2);
          
    if(key == 'w')
    {
      position.z += cly*spd*-clx;
      position.x += sly*spd*-clx;
      position.y += clpx*spd;
    }
    if(key == 's')
    {
      position.z -= cly*spd*-clx;
      position.x -= sly*spd*-clx;
      position.y -= clpx*spd;
    }
    
    if(key == 'a')
    {
      position.z += sly*spd;
      position.x -= cly*spd;
    }
    if(key == 'd')
    {
      position.z -= sly*spd;
      position.x += cly*spd;
    }
    
    if(key == ' ')
    {
      position.y += 1*spd;
    }
    if(keyCode == CONTROL)
    {
      position.y -= 1*spd;
    }
  }
}
}
float dist1D(float val, float val2)
{
  return(val - val2);
}

