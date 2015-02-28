
float x,y,vx,vy,rad;
float freq;
float drag;
giantcircle p;
giantcircle[] ps;



void setup()
{
  size(800,800,P3D);
  x=random(width);
  y=random(height);
  vx=random(-2,2);
  vy=random(-2,2);
  rad=random(20,35);
  drag=.97;
  freq=.01;


  p = new giantcircle();
 ps = new giantcircle[2];
 noStroke();
 background(255);

 
 for(int i = 0; i <ps.length; i++)
 {
   ps[i]=new giantcircle();
   
 }
 
}

void draw()
{


{
y=-rad;
}
     
    p.moveit();
   p.drawit();
   
   
    for(int i = 0; i <ps.length; i++)
 {
   ps[i].moveit();
   ps[i].drawit();
   
 }
 
   
}




class giantcircle
{
 
 float x,y,vx,vy,rad,drag,freq; 

 giantcircle()
  {
     size(800,800,P3D);
  x=random(width);
  y=random(height);
  vx=random(-2,2);
  vy=random(-2,2);
  rad=random(20,35);
  drag=.97;
  freq=.01;

   }
  

  
  void moveit()
   {
       x+=vx;
   y+=vy; 
   
   vx+=noise(x*freq,y*freq,frameCount*freq*30)-.5;
   vy+=noise(frameCount*freq,y*freq,x*freq)-.5;
   vx*=drag;
   vy*=drag;
   
   
 
   if(x<-rad)
   {
     x=width+rad;
   }
 
  if(x>width+rad)
  {
    x=-rad;
  }

  if(y<-rad)
  {
    y=height+rad;
  }

  if(y>height+rad)
{
y=-rad;
}
  
  }

  void drawit()
  { pushMatrix();
    fill(random(80,200),random(100,130),random(150,130),1);

     
   translate(x,y);
   box(100,100,100);
  pointLight(200,100,100,
            200,-150,255);



 
   popMatrix();
    
  }


}

