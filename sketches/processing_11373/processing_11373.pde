
/*
The star, meteoroid, and comet arrive at a special night.

Kuo-Ang(Allen) Huang
08.22.2010
*/

jetpoint[] meteor = new jetpoint[12];

starpoint[] star = new starpoint[300];

cometpoint comet;

int meteorN = 12;
int m_nums = 0;
int meteorTime = 0;
int m_time = 0;
int m_standby = 0;
int showTime = 3; //at least 3 sec

int starN = 300;

int scene = 1;

float x, y, v, deg, clr, sat, bri;


void setup()
{
 //size(1200, 675);
 size(900, 500);
 background(0);
 smooth();
 noStroke();
 
 for(int i = 0; i <starN; i++)
   s_reset(i, 1);
 
 meteorTime = meteorN*showTime*60;
 for(int i = 0; i <meteorN; i++)
   m_reset(i);
   
 comet = new cometpoint(900, 150, 20, 160, 210);

}


void draw()
{
 background(0);
 
 
 for(int i = 0; i <starN; i++)
 {
   if(!star[i].gone)
     star[i].go();
   else
     s_reset(i, 2);
 }
 
 if(scene ==1)
 {
   if(!comet.gone)
     comet.go();
   else
   {
     c_reset();
     scene =2; 
   }
 }
 
 if(scene ==2)
 {
   for(int i = 0; i <m_nums; i++)
   {
     if(!meteor[i].gone)
       meteor[i].go();
     else
     {
       if(m_time <meteorTime)
         m_reset(i);
       else
         m_standby++;
     }
   }
   if(m_time <meteorTime)
   {
     if(m_time%(3*60) == 0 && m_nums <meteorN)
       m_nums++;
     
     m_time++;
   }
   else
   {    
     if(m_standby >= meteorN)
     {
       m_time = 0;
       m_nums = 0;
       meteorN = round(random(3.0, 12.4));
       meteorTime = meteorN*showTime*60;
       scene =1;
     }
     
     m_standby = 0;
   }
 }
 
 
}


void m_reset(int i)
{
 x = random(width -400.0, width +200.0);
 y = random(0.0, height -200.0);
 v = random(300.0, 500.0);
 deg = random(155.0, 165.0);
 clr = random(0.0, 360.0);
 sat = random(0.0, 100.0);
 bri = random(80.0, 100.0);
 
 meteor[i] = new jetpoint(x, y, v, -80.0, deg, clr, sat, bri);
}


void s_reset(int i, int scene)
{ 
 y = random(50.0, height +50.0);
 clr = random(0.0, 360.0);
 sat = random(0.0, 100.0);
 bri = random(80.0, 100.0);
  
 if(scene ==1)
 {
   x = random(-5.0, width +5.0);
   star[i] = new starpoint(x, y, 5.0, clr, sat, bri);
 }
 else
   star[i] = new starpoint(-5.0, y, 5.0, clr, sat, bri);
}

void c_reset()
{
 x = random(width, width +20.0);
 y = random(-50.0, height -400.0);
 deg = random(155.0, 165.0);
 clr = random(0.0, 360.0);
 
 comet = new cometpoint(x, y, 20, deg, clr);
}


class jetpoint
{
  float ix = 0.0;
  float iy = 0.0;
  float tx = 0.0;
  float ty = 0.0;
  float X = 0.0;
  float Y = 0.0;
  
  float t = 0.0;
  float et = 0.0;
  float tail = 0.0;
  
  float vX = 0.0;
  float vY = 0.0;
  
  float aX = 0.0;
  float aY = 0.0;
  
  float meteosize = 0.0;
  
  float deg = 0.0;
  float clr = 0.0;
  float sat = 0.0;
  float bri = 0.0;
  
  boolean gone = false;
  
  jetpoint(float _x, float _y, float _v, float _a, float _deg, float _clr, float _sat, float _bri)
  {
    colorMode(HSB, 360, 100, 100, 255);
    ix = _x;
    iy = _y;
    deg = _deg;
    clr = _clr;
    sat = _sat;
    bri = _bri;
    
    vX = _v*cos(radians(_deg));
    vY = _v*sin(radians(_deg));
    
    aX = _a*cos(radians(_deg));
    aY = _a*sin(radians(_deg));
    
    et = abs(_v/_a);
    
    meteosize = random(1.0, 3.0);
    
    gone = false;
    
  }
  
  void go()
  {   
   if(t < et)
   {
     X = ix + vX*t + 0.5*aX*pow(t, 2);
     Y = iy + vY*t + 0.5*aY*pow(t, 2);
     
     tail = 40*(-pow((t-et/2.0), 2) +pow((et/2.0), 2));
     
     for(float i = 0; i < tail; i++)
     {
       fill(clr, sat, bri, 255-(50*t+0.4*i));
       tx = i*cos(radians(deg));
       ty = i*sin(radians(deg));
       ellipse(X-tx, Y-ty, meteosize, meteosize);
       fill(0, 0, 100, 150-(50*t+0.4*i));
       ellipse(X-tx, Y-ty, meteosize *2, meteosize *2);
     }
     
     t += 1.0/30.0;
   }
   else
     gone = true;
  
  }  
}


class starpoint
{
  float ix = 0.0;
  float iy = 0.0;
  
  float X = 0.0;
  float Y = 0.0;
  
  float v = 0.0;
  float t = 0.0;
  float et = 0.0;
  
  float clr = 0.0;
  float sat = 0.0;
  float bri = 0.0;
  
  float starsize = 0.0;
  float flashsize = 0.0;
  float flash = 0.0;
  
  boolean gone = false;
  
  starpoint(float _ix, float _iy, float _v, float _clr, float _sat, float _bri)
  {
    ix = _ix;
    iy = _iy;
    v = _v;
    clr = _clr;
    sat = _sat;
    bri = _bri;
    et = ((width)/v);
    
    starsize = random(2.0, 5.0);
    flashsize = random(2.0, 5.0);
    if(flashsize <starsize)
      flashsize = starsize;
    
    gone = false;
    
  }
  
  void go()
  {
   if(X <width+5)
   {
     X = ix + v*t;
     Y = iy - (0.000013*et*(-pow((t-et/2.0), 2) + pow((et/2.0), 2)));
     flash = random(60.0, 120.0);
     
     fill(clr, sat, bri, 255);
     ellipse(X, Y, starsize, starsize);
     fill(0, 0, 100, flash);
     ellipse(X, Y, starsize +flashsize, starsize +flashsize);
   
     t += 1.0/30.0;
   }
   else
     gone = true;
    
  }
}


class cometpoint
{
 float ix = 0.0;
 float iy = 0.0;
 float tx = 0.0;
 float ty = 0.0;
 float X = 0.0;
 float Y = 0.0;
  
 float t = 0.0;
  
 float vX = 0.0;
 float vY = 0.0;
 
 float clr = 0.0;
 
 float v = 0.0;
 float deg = 0.0;
 float tdeg = 0.0;
 
 float cometsize = 15.0; //at least 15
 
 float c_tail = 0.0;
 float c_dust = 0.0;
 
 boolean gone = false;
 
 
 cometpoint(float _ix, float _iy, float _v, float _deg, float _clr)
 {
   ix = _ix;
   iy = _iy;
   v =_v;
   deg = _deg;
   clr = _clr;
   
   gone = false;
   
 }
 
 void go()
 {
  if(X >-400.0 && Y <height +300)
  {
    vX = v*cos(radians(deg));
    vY = v*sin(radians(deg));
    
    X = ix + vX*t;
    Y = iy + vY*t;
  
    cometail(0.0, 10.0);
    cometail(4.0, 12.0);
    cometail(-4.0, 12.0);
    cometail(8.0, 15.0);
    cometail(-8.0, 15.0);
  
    t += 1.0/30.0;
  }
  else
    gone = true;
   
 }
 
 void cometail(float tdeg, float tdegamp)
 {
  float d = 0.0;
  tdeg = tdeg*abs(cos(radians(tdegamp*t)));
  
  for(float i = 0; i < 100; i++)
  {
     float tamp = random(0.2, 0.3);
     d = d + (5 - 0.0004*pow(i, 2));
     fill(clr, 0 +6*i, 100, 255 -i*3);
     tx = d*cos(radians(deg +tdeg +tamp*i));
     ty = d*sin(radians(deg +tdeg +tamp*i));
     c_tail = cometsize -(cometsize-1)*0.01*i;
     ellipse(X-tx, Y-ty, c_tail, c_tail);
  }
 }
}

