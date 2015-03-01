
int limit=100;
float e=exp(1),phi=(1+sqrt(5))/2;

float tnum=0;
float rmap=0;

float cvx=0,cvy=0,cx=0,cy=0,cz=0;
boolean paused=false;
boolean camstat=true;
boolean camreset=false;

float ScaleFactor=1;


void setup()
{
  size(800,600,P3D);
  background(255);
  smooth();
  frameRate(60);
  camera();
}

void draw()
{
  
  if(!paused)
  {
  background(255);
  float t,tfin;
  
  t=millis()/1800;

    if(!camreset) 
{
float angx=map(mouseX,0,width,0,2*PI);
float angy=map(mouseY,0,height,0,2*PI);
cx=700*sin(angx);
cy=700*cos(angx);
cz=600*sin(angx);

   
}
  if(camstat) 
  camera(cx,cz,cy,width/2,height/2,0, 0,1,0);
  rmap=2*sin(t/3)*cos(t)+rmap*cos(t/2)*sin(t);
  tfin=limit*(limit+1)/2;
  
  for(int i=0;i<limit;i++)
  {
    tnum=i*(i+1)/2;
     
   
    float x=map(tnum,0,tfin,50,width-200);
    
    pushMatrix();
    translate(x,height/2);
    

    
    float sz=map(tnum,0,tfin,50,height/3);
    float anglt=i*PI*rmap/70;
    float rot=map(tnum,1,tfin,0,anglt);
    float alph=map(tnum,0,tfin,120,255);
    
      
    rotateX(rot/5);
    rotateY(rot/3);
    rotateZ(rot);
    scale(ScaleFactor);
    
    noFill();
    stroke(50,alph);
    strokeWeight(0.6);
    box(sz,sz,sz);
    
     stroke(#F54545,alph);
     strokeWeight(0.9);
     line(0,0,sz/2,sz/2);
    
    
    popMatrix();  
}
}
}

    
 void keyPressed() {
  if(key=='s')
  saveFrame("n-####");
  if(key=='d')
  {
    if(paused)
  paused = false;   
  else 
  paused = true; 
 }
 if(key=='c')
 {
   if(camstat)
   camstat=false;
   else
   camstat=true;
 }
 
 if(key=='r')
 {
   if(camreset==false)
   camreset=true;
   else
{   camreset=false;
cx=0;
cy=height*2/sqrt(3);
cz=0;}
  
}  }

void mouseWheel(MouseEvent e)
{
  ScaleFactor += e.getAmount()/100;
}


