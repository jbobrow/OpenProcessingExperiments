
class Particle
{  
  color c1,c2;
  float w,h; // radii
  float x,y; // center point
  float r;   // rotation
  float t=0; // 
  float xP, yP;  // start position 
  float xS, yS; // splode position
  float sinTransCount=0; 
  float curveTransCount=0;
  color c=c2;
  int colorCount=0;
  float colorT=0; // change in color over time
  float strokeSize=1;
  float easing=0;
  float inflateCount;
  boolean toDraw = true;
  boolean activated = false;
  float accel=1; // acceleration value
  float maxAccel=6;
  float minAccel=.7;

int numSplodes=6;
  Splode[] splodes = new Splode[numSplodes];



  Particle(float X, float Y, float W, float H, float R, color C1, color C2) //constructor
  {
    x=X;
    y=Y;
    w=W;
    h=H;
    r=R;
    c1=C1;
    c2=C2;
  }

  ////////////////////////////////////////////////////////////
  // checkColor ( wanted color , original color)
  void checkColor(color cc1, color cc2)
  {
    if(colorCount>60)
    {
      c=c2; 
      colorCount=0;
    }

    if(c != c2)
    {
      colorCount++;
    } 

    if(colorT<0) colorT=0;
    if(colorT>1) colorT=1; 
  }

  ////////////////////////////////////////////////////////////
  void fillPart(color cFill, float trans)
  {
    noStroke();
    fill(cFill, trans);
    ellipse(x,y,w-2,h-2) ;
  }

  ////////////////////////////////////////////////////////////
  void inflate(float rate)
  {
    w *= rate;
    h *= rate;
    strokeSize*=rate;
  }

  ////////////////////////////////////////////////////////////
  void attract(float rate)
  {
    activated=true;
    x+=accel*(mouseX-x) / distance(mouseX,mouseY,x,y);
    y+=accel*(mouseY-y) / distance(mouseX,mouseY,x,y);

    if(accel<maxAccel) accel=1+rate/1.5; // allows acceleration up to some value
    else accel=maxAccel;
  }

  /////////////////////////////////////////////////////////////
  void detract(float rate)
  {
    activated=true;
    x-=accel*(mouseX-x) / distance(mouseX,mouseY,x,y);
    y-=accel*(mouseY-y) / distance(mouseX,mouseY,x,y);

    if(accel<maxAccel) accel=1+rate; // allows acceleration up to some value
    else if(accel>maxAccel) accel=maxAccel;
  }

  ////////////////////////////////////////////////////////////
  // attract (attractor X/Y)
  void attractHome(float homeDist)
  {
    if(distance(xP,yP,x,y)>2)
    {
      x+=accel*(xP-x) / distance(xP,yP,x,y);
      y+=accel*(yP-y) / distance(xP,yP,x,y);

      if(distance(xP,yP,x,y) > homeDist*.6)
      {
        accel*=1.1;
        if(accel>maxAccel) accel=maxAccel;
      }
      //if(distance(xP,yP,x,y) < homeDist*.5) 
      else
      {
        accel*=.95;
        if(accel<minAccel) accel=minAccel;
      }

    }
    // hack to stop particle from perpetually vibrating when at start position
    else if(distance(xP,yP,x,y)<2)
    {
      x=xP;
      y=yP;
    }
  }



  //////////////////////////////////////////////////////////////
  //distance (from one point, to another point)
  float distance(float x1, float y1, float x2, float y2)
  {
    float d= sqrt(pow(x2-x1,2) + pow(y2-y1,2)) ;
    return d;
  }



  ////////////////////////////////////////////////////////////
  // magnetTrans (mouse x, mouse y, particle x, particle y)
  void magnetTrans(float mx, float my, float dis)
  {
    if(mouseButton==LEFT)
    {
      easing=1/dis;
      x -= (mx-x)*easing;
      y -= (my-y)*easing;
    }
    else if(mouseButton==RIGHT)
    {
      easing=1/dis;
      x += (mx-x)*easing;
      y += (my-y)*easing;
    }
  }

  ////////////////////////////////////////////////////////////
  void returnTrans()
  {
    easing = .03;
    x += (xP-x)*easing;
    y += (yP-y)*easing; 
  }

  ////////////////////////////////////////////////////////////
  // curveTrans( deviation x, deviation y, radius x, radius y, center x, center y, motion speed)
  void curveTrans(float sx, float sy, float rx, float ry, float xx, float yy, float speed)
  { 
    curveTransCount+=speed;
    x=xx+(cos(curveTransCount*sx)*rx);
    y=yy+(sin(curveTransCount*sy)*ry); 
  }

  ////////////////////////////////////////////////////////////
  void transParticle(float xT, float yT)
  {  
    if(t<=1)
    {
      x = (1-t)*xP+t*xT;
      y = (1-t)*yP+t*yT;
      t+=.01;
    }
  }

  ////////////////////////////////////////////////////////////
  void sinTrans(float xT, float yT)
  {
    x = (1-t)*xP+t*xT;
    y = (1-t)*yP+t*yT;
    t=sin(sinTransCount);
    sinTransCount+=.04;
  }

  /////////////////////////////////////////////////////////////
  void drawParticle()
  {
    checkColor(c1, c2);
    for(float t=0; t<=360; t+=13)
    {
      float a= x + w/2 * cos(radians(t))*cos(radians(r))-h/2*sin(radians(t))*sin(radians(r));
      float b= y + h/2 * sin(radians(t))*cos(radians(r))+w/2*cos(radians(t))*sin(radians(r));
      strokeWeight(strokeSize);
      stroke(lerpColor(c1,c2,colorT));
      point(a,b);
    }
  } 

  /////////////////////////////////////////////////////////////
  void prepSplode()
  {
    xS=x;
    yS=y;
    for (int i = 0; i < numSplodes; i++)
    {
      splodes[i] = new Splode(xS+random(-10,10), yS+random(-10,10), 9, i, splodes);
    } 
  }

  /////////////////////////////////////////////////////////////
  void drawSplode()
  {
    for (int i = 0; i < numSplodes; i++)
    {
      splodes[i].collide(numSplodes);
      splodes[i].move();
      splodes[i].display(); 
    }
  }

}

