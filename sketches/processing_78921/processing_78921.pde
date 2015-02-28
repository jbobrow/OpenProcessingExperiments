

class Branch
{
  float posx,posy;
  int r,g,b,alp,strokeColor,offset;
  float rad,wid,hei;
  float t=0.01;
  float factor=1;
  color ballColor=color(0,0,0);
  boolean autoColor=true;
  Branch(float x, float y, float _rad, float _t)
  {
     
    posx=x;
    posy=y;
    rad=_rad;
    t=_t;
    DefaultSet();
  }
  Branch(int x, int y, float _rad, float _t)
  {
    posx=x;
    posy=y;
    rad=_rad;
    t=_t;
    DefaultSet();
  }
  
  void DefaultSet()
  {
    offset=30;
    alp=60;
    r=0;
    g=0;
    b=0;
    //if( (int)(random(0,10))<5) factor*=-1;
    factor=random(0.0005,0.009);
    wid=width;
    hei=height-rad;
    
  }
  
  public void SetColor(color _color)
  {
    ballColor=_color;
  }
  
  public void AutoColor(Boolean tof)
  {
    autoColor=tof;
  }
  
  public void Grow()
  { 
    float noiseX,noiseY;
   // noiseX= map(noise(t+random(0,1)),0., 1., 0, 5);
    
    noiseX= map(noise(t),0., 1., -offset, (float)wid+offset);
    noiseY= map(noise(t+random(0,5)),0., 1., 0, 1);
    //t=t+0.005;
    t+=factor;
    if(autoColor)
    {
      r=(int)(posy*200/hei)+100;
      g=(int)(random(0,250));
      b=(int)(random(0,255));
      //b=(int)(posx*200/wid)+100;
      ballColor=color(r,g,b,alp);
    }
    fill(ballColor);
    stroke(strokeColor,strokeColor,strokeColor,alp);
    ellipse(posx,posy,rad,rad);
    
    posx=noiseX;
    //posx+=noiseX*factor;
    posy=posy-(noiseY+factor*120);
    
    if(posy<0-rad) posy=height;
    //if(posx<0-rad) posx=width;
    //if(posx>width+rad) posx=0;
  }
  
  public float GetRad()
  {
    return rad;
  }
  
  public void LightUp(float x)
  {
    //strokeColor=(int)(1/x);
    //alp=2*x;
  }
  
  public void Offset(int branch_num)
  {
    offset=branch_num+(int)random(-branch_num/2,branch_num/2);
  }
}

