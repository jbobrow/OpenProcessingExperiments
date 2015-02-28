
class Particle //class = composite of data; Particle = name of class    
{
  float w; //radius1
  float h; //radius2
  Vec pos = new Vec(0,0,0); //center
  float accel = 1; //particle acceleratioin
  float r;  //rotation      
  float xp, yp;// to help determine the ellipse last location
  float t=0;  //start
  float sinTranslatecount=0;
  float curveTranslateCount=0; // global called in order to start the count...
  float colorT=0;
  
  color c= color(255,0);
  color c1=color(#CEA9A9);
  color c2=color(#00AFD8);
  int colorCount=0;

  Vec v= new Vec(5,5,0);
  Vec ppos;

  float inc1 = 0.1;  // 
  float n1 = 0.09;  // speed of vibration
  float inc2 = .1;  //
  float n2 = 0.09;  // speed of vibration

////////////////////////////////////////////////////////////////
  Particle(float X, float Y, float W, float H, float R)
  {
    pos.x=X; //definition
    pos.y=Y; //definition
    w=W; //definition
    h=H; //definition
    r=R; //definition
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  void inflate(float rate) // first function
  {
    w=w*rate; 
    h=h*rate;
  } 

  ////////////////////////////////////////////////////////////////////////////////////////////////////  
  void attract(Vec [] a)
  {
    for(int i=0; i <a.length; i++)
    {
      float d =pos.distance(a[i]);

      if (d < 10)
      {
        v.x += accel * (a[i].x - pos.x) / pos.distance(a[i]);
        v.y += accel * (a[i].y - pos.y) / pos.distance(a[i]); 
      }
      else
      {
        v.x += accel * (a[i].x - pos.x) / pos.distance(a[i])/10;
        v.y += accel * (a[i].y - pos.y) / pos.distance(a[i])/10; 
      }


      if (d <2) accel=.995;//look here....................................
      else accel=1.02;
    }

    v.multiply(.98);

  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  void checkColor(color c1, color c2) //c1 temp colour, c2 default colour
  {
    if(c != color (255))
    {
      colorCount++;
    }
    if (colorCount>60)
    {
      c=c2; //make it it's default color
      colorCount=0;
    }
    if (colorT<0) colorT=0;    
    if (colorT>1) colorT=1;        
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  void sinTranslate(float xt, float yt, float rt) //future locations are xt, yt; rt future rotate
  {
    pos.x=(1-t)*xp+t*xt;
    pos.y=(1-t)*yp+t*yt;
    t=t+.01;
    t= sin(sinTranslatecount);
    sinTranslatecount= sinTranslatecount+0.1; //.01 is the speed. bigger number means faster
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  void translate(float xt, float yt, float rt) //future locations are xt, yt; rt future rotate
  {
    if(t<=1)
    {
      pos.x=(1-t)*xp+t*xt;
      pos.y=(1-t)*yp+t*yt;
      t=t+1;    
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  //courveTranslate (center x, center y, curve deviation x, curve deviation y, radius x, radius y, motion speed)
  void curveTranslate(float xx, float yy, float sx, float sy, float rx, float ry, float speed)
  {
    curveTranslateCount+=speed; 
    pos.x = xx+(cos(curveTranslateCount*sx)* rx); //multiply the angle to get motion..
    pos.y = yy+(sin(curveTranslateCount*sy)* ry);
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  void drawParticle() // rotate function
  {
    checkColor(color(255,0,0), color(255));
    float s= 20/(w+h);

    pos.add(v);
    /////////////////////////////////////////////////////////////////    
    strokeWeight(1); 
    float y1 = (noise(n1) - 0.5) * 55.0;  // values -15 to 15
    float y2 = (noise(n2) - 0.5) * 55.0;  // values -15 to 15
    line(pos.x-10, pos.y + y1, pos.x, pos.y);  // line(x1, y1, x2, y2)
    line(pos.x+10, pos.y + y2, pos.x, pos.y);  // line (x3, y3, x4, y4)      
    n1 += inc1;
    n2 += inc2;      
    /////////////////////////////////////////////////////////////////  
    stroke(lerpColor(c1,c2,constrain(colorT,0,1)));

  }
}

