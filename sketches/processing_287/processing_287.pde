
class Particle //class = composite of data; Particle = name of class    
{
  float w; //radius1
  float h; //radius2
  
  int polarity;
  float attractionForce;
  float accel = .5; //particle acceleratioin
  float r;  //rotation      
  float xp, yp;// to help determine the ellipse last location
  float t=0;  //start
  float sinTranslatecount=0;
  float curveTranslateCount=0; // global called in order to start the count...
  float colorT=0;
  float factor = 15.0;
 
 color baseColor;
color lerpToColor; 

  float prevX, prevY;
 
  Vec closestVec;
  Vec pos = new Vec(0,0,0); //center 
  Vec v= new Vec(0,0,0);

  Vec ppos;
  
    Particle(float X, float Y, float W, float H, float R,float gravityWeight, int Polarity , color BaseColor, color LerpToColor)
    {
      pos.x=X; //definition
      pos.y=Y; //definition
      w=W; //definition
      h=H; //definition
      r=R; //definition
      attractionForce = gravityWeight;
      polarity = Polarity;
      baseColor = BaseColor;
      lerpToColor = LerpToColor;
     }
 
  ///////////////////////////////////////////////////////////////////////////////////////////////////
 
  void newAttract(Particle[] a){
      for(int i=0; i <a.length; i++){
         float d =pos.distance(a[i].pos);
          
    if (a[i].polarity == 0)
    {
           if(d < 90){
              v.x -= accel * (a[i].pos.x - pos.x) / d;
              v.y -= accel * (a[i].pos.y - pos.y) / d;
              p[i].inflate(1.025);
            }
          
          else{
              v.x += (accel * (a[i].pos.x - pos.x) / d)/a.length;
              v.y += (accel * (a[i].pos.y - pos.y) / d)/a.length;
             
            }
            
         
            if (accel < .1) accel = .1;
            if (accel > 2) accel = 2;

            if (d<90) accel =.94; 
           else accel =1.001;
         
       }
      
       else{
           if(d > 90){
              v.x += accel * (a[i].pos.x - pos.x) / d;
              v.y += accel * (a[i].pos.y - pos.y) / d;
              p[i].inflate(.987);
              }          
          else{
              v.x -= (accel * (a[i].pos.x - pos.x) / d)/a.length;
              v.y -= (accel * (a[i].pos.y - pos.y) / d)/a.length;
               
              }
         
            if (accel < .1) accel = .1;
            if (accel > 2) accel = 2;
         
            //if(mousePressed == true && shOn== false) shOn = true;//accel*=.95; look here.............
            //if( mousePressed == true && shOn == true ) shOn = false;
            //if (shOn == true)accel*=.95;
            //if (shOn == false)accel*=1.01;
         
            if (d<10) accel =.995; 
            else accel =1.001;
          //else accel*=1.01;
            }
     v.multiply(attractionForce);
    }
  }
  
 ///////////////////////////////////////////////////////////////////////////////////////////////////////
 
  void inflate(float rate) // first function
  {
    w=w*rate; 
    h=h*rate;
    
    if (w>50) w = 50;
    if (h>50) h = 50;
  
} 

///////////////////////////////////////////////////////////////////////////////////////////////////////

void checkColor()
{

  //float shiftExtent = ((w+h)/2)*factor;
  float shiftExtent = 100;
  
  float closeDistance = pos.distance(closestVec);
  
  if (closeDistance < shiftExtent)
  {
    //colorT = 1 - (closeDistance/shiftExtent);
colorT += .1;

if (colorT > 1) colorT = 1.0;

}

  else
  {
    colorT -= .05;
    if (colorT < 0) colorT = 0;
  }
}
      
  void drawParticle(){ // rotate function
    //checkColor(color(255,0,0), color(255));
    float s= 60.0/((w+h)/2);
    pos.add(v);
   
    for (float t=0; t<=360; t=t+s)
    {
       float a = pos.x + w/2 * cos( radians(t))* cos( radians(r))-h/2*sin( radians(t))*sin(radians(r));
       float b = pos.y + h/2 * sin( radians(t))* cos( radians(r))-h/2*cos( radians(t))*sin(radians(r));
       stroke(lerpColor(baseColor,lerpToColor,colorT));
       point(a,b);
     }
  }
  
  void addLine()
  {
  
    checkColor();
    
   prevX = pos.x;
  prevY  = pos.y;
 
 pos.add(v);
  stroke(lerpColor(baseColor,lerpToColor,colorT));
  line(prevX,prevY,pos.x,pos.y);
 
  }
  
    void findClosestAttractor(Particle[] a)
  {
    closestVec = a[0].pos;
    
    float d1 = a[0].pos.distance(a[0].pos);

    for (int i = 1; i < a.length; i++)
    {
     
      float d2 = a[i].pos.distance(a[i].pos);

      if (d1 > d2)
      {
        closestVec = a[i].pos;
        d1 = d2; 
      }
    }
  }

}

