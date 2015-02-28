
class Body
{
  float mass;
  float radius;
  color col;
  float xvel;
  float yvel;
  float zvel;
  float x,y,z;
  float G = .00005;
 
  Body(float X, float Y, float Z, float m, float xv, float yv, float zv, color c)
  {
    x = X;
    y = Y;
    z = Z;
    mass = m;
    col = c;
    xvel = xv;
    yvel = yv;
    zvel = zv;
    radius = mass/100000;
  }
 
  Body move(ArrayList l, float sunRadius)
  {
    if(sqrt(pow(width/2 - this.getX() + random(-1,1),2) 
          + pow(height/2 - this.getY() + random(-1,1),2)
          + pow(0 - this.getZ() + random(-1,1),2))  < sunRadius - 10){
      return null;     
    }
    float tx=0;
    float ty=0;
    float tz=0;
    for(int i = 0;i<l.size();i++)
    {
      Body tb = (Body)l.get(i);
      if(abs(tb.getX() - this.getX()) > 1 || abs(tb.getY() - this.getY()) > 1 || abs(tb.getZ() - this.getZ()) > 1)
      {
        float rad =
            pow(tb.getX() - this.getX() + random(-1,1),2) +
            pow(tb.getY() - this.getY() + random(-1,1),2) +
            pow(tb.getZ() - this.getZ() + random(-1,1),2);
        float tempx = G * this.getMass() * tb.getMass() / rad;
        float tempy = G * this.getMass() * tb.getMass() / rad;
        float tempz = G * this.getMass() * tb.getMass() / rad;
        if(tb.getX() - this.getX() < 0) tempx *= -1;
        if(tb.getY() - this.getY() < 0) tempy *= -1;
        if(tb.getZ() - this.getZ() < 0) tempz *= -1;
        if(abs(tempx) < 10000) tx += tempx;
        else tx += (abs(tempx) / tempx) * 1000;
        if(abs(tempy) < 10000) ty += tempy;
        else ty += (abs(tempy) / tempy) * 1000;
        if(abs(tempz) < 10000) tz += tempz;
        else tz += (abs(tempz) / tempz) * 1000;
         
      }
    }
    xvel += tx / this.getMass();
    yvel += ty / this.getMass();
    zvel += tz / this.getMass();
    x+=xvel;
    y+=yvel;
    z+=zvel;
    return new Body(x,y,z,mass,xvel,yvel,zvel,col);
  }
  void display()
  {
    noStroke();
    fill(col);
    translate(x,y,z);
    sphere(radius*1.5);
    translate(-x,-y,-z);
  }
 
  float getMass()
  {
    return mass;
  }
  color getColor()
  {
    return col;
  }
  float getXVel()
  {
    return xvel;
  }
  float getYVel()
  {
    return yvel;
  }
  float getX()
  {
    return x;
  }
  float getY()
  {
    return y;
  }
  float getZ()
  {
    return z;
  }
  float getRadius()
  {
    return radius;
  }
  boolean isSun()
  {
    return false;
  }
}

