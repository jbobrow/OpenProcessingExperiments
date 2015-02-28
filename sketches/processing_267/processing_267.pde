
class Particle //global varibales   
{
  float w; //radius1
  float h; //radius2
  float startX;
  float startY;
  
  float accel= 1;
  //float x,y; //center
  float r;  //rotation
  float xp, yp;// starting postions
  float t=0;  //start..smooth it out
  float sinTranslatecount=0;
  float curveTranslatecount=0;
  color c= color(255); //color of the particle
  int colorCount=0;
  float colorT=0;
  color c1=color(246,31,160);//shifts between two colors
  color c2=color(122,186,221);

Vec pos= new Vec(0,0,0);// pos is defined, to put into the x in the vauble x
Vec v = new Vec(0,0,0);//for its current vector
Vec ppose;// for its previous defines it is orevious postion

  
 /////////////////////////////////////////////////////////////////////////////////////// 
  Particle(float X, float Y, float W, float H, float R)
  {
    pos.x=X;
    pos.y=Y;
    w=W;
    h=H;
    r=R;
    startX=X;
    startY=Y;
  }
  /////////////////////////////////////////////////////////////////////////////////////////
  void inflate(float rate)
  {

    w=w*rate*sin(5+rate);
    h=h*rate*cos(8);

  }

///////////////////////////////////////////////////////////////////////////////////////////
  void translate(float xt, float yt, float rt) 
  {

    if(t<=1){
      pos.x=(1-t)*xp+t*xt;
      pos.y=(1-t)*yp+t*yt;
      t=t+.01; 
 
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////
  void checkColor(color c1, color c2)
  {
    if (c != c2)
  {
    ///start counting if color is not white
  colorCount++;
  
      }
      //after number of seconds return to defualt color
      if (colorCount>50)
    {
    c=c2;
    colorCount=0;
    }
    if (colorT<0) colorT=0;
    if (colorT>1) colorT=1;
    }
  /////////////////////////////////////////////////////////////////////////////////////////
  //curvetranslate(center x,center y, curve deviation x, deviation y, radius x, radius y,motion speed)///                              
  void curveTranslate(float xx, float yy, float sx, float sy, float rx, float ry,float speed)
  {
      
    curveTranslatecount += speed;
    // xx is the center of the radius
    pos.x = xx + ( cos(curveTranslatecount * sx) *1.5 * rx/2);
    pos.y = yy + ( sin(curveTranslatecount * sy) *1.5 *ry/2);
  
  }
 ///////////////////////////////////////////////////////////////////////////////////////// 
void sintranslate(float xt, float yt, float rt) 
 {

 
      pos.x=(1-t)*xp+t*xt;
      pos.y=(1-t)*yp+t*yt;
      t= sin(sinTranslatecount);   
      sinTranslatecount= sinTranslatecount+.1;

  

  }
////////////////////////////////////////////////////////////////////////////////////////
void startPosition()
{


    pos.x = startX;
    pos.y = startY;

  
}
void attract(Vec [] a)
{
  for (int i=0; i< attractorCount; i++)//for every attractor CALCULATE THE  distance  
{
  float d=pos.distance(a[i]);
  if (d<10)
  {
  v.x += accel * (a[i].x - pos.x ) / d;
  v.y += accel * (a[i].y - pos.y ) / d;
  }
  else
  {
  v.x += accel * (a[i].x - pos.x ) / pos.distance(a[i])/a.length;
  v.y += accel * (a[i].y - pos.y ) / pos.distance(a[i])/a.length;
  }
  if ( d < 10) accel=.98;
  else accel=1.01;
  //accel*= .98;
}
  

  v.multiply(.994);
  
}

//////////////////////////////////////////////////////////////////////////////////////////
  void drawParticle()
  {
  
    checkColor(color(255,0,0), color(255) );
  
     float s= (20/w+h)/2;//makes the particles come together in the center then explodes
    
    pos.add(v);//currently add to that vector at its current postion
    
    for( float t=0; t<=360; t=t+s)
    {
      float a=pos.x+w/2 * cos( radians(t))* cos( radians(r))-h/5*sin( radians(t))*sin(radians(r));
      float b=pos.y+h/2 * sin( radians(t))* cos( radians(r))-h/5*cos( radians(t))*sin(radians(r));
      //float a = pos.x + w/2 * cos( radians(t));
      //float b = pos.y + h/2 * sin( radians(t));
      // strokeWeight(t/90);
      //stroke(t);
      
      
      
      
      stroke(lerpColor(c1,c2,colorT));//sets the stroke to white
      point(a,b);
    }
  }
}



