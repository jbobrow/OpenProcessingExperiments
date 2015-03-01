
int n=45;
float e=exp(1);
float phi=(1+sqrt(5))/2;

int f0=0,f1=1,f2=1;;
int result;
float fib;
float rlim=0;

float xpos=0,ypos=0;
float ScaleFactor=1;
boolean paused=false;
boolean camstat=true;
boolean camreset=false;
float cx=0,cy=0,cz=0;

void setup()
{
  size(800,600,P3D);
  frameRate(60);
  smooth();

} 

void draw()
{
   if(!paused)
 { 
  background(0);
  float x,y,t,fmax;
  
  t=millis()/3000;
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
 
  rlim=5*sin(t/2)*cos(t)+rlim*sin(t)*cos(t/2);
  fmax=(pow(phi,n+1)/sqrt(5));

  
  
  for (int i = 0; i < n;  i++)
  {
      fib= (nextFib());
      pushMatrix();
 
      x=map(fib, 0, fmax,50,width-100);
      translate(x,height/2);
      
      float rf=map(fib,0,fmax,0,4*PI);       
      float ang=map(fib,0,fmax,0,rlim*rf);
      float sz=map(fib,0,fmax,0,300);
      float alph= 255*sin(rf);
      float el=map(fib,0,fmax,0,20);
     
      scale(ScaleFactor);
      
      stroke(#FA6E56);
      strokeWeight(0.5);
      line(0,-x/2,0,x/2);
      fill(#FC5D36);
      noStroke();
      ellipse(0,-x/2,el,el);
      ellipse(0,x/2,el,el);
      fill(255);
      ellipse(0,0,sz/10,sz/10);
      
      rotateX(ang/phi);
      rotateY(ang/e);
      rotateZ(t*e);
      
      stroke(263,70,63);
      strokeWeight(0.8);
      noFill();
      box(sz,sz,sz);
      rotateX(ang/10);
      rotateZ(ang/10);
      rotateY(ang/10);
      box(sz/10,sz/10,sz/10);
      popMatrix();
   
    
}

 reset();
 }
}

int nextFib()
{
   result = f2;
   f0 = f1;
   f1 = f2;
   f2 = f0 + f1;
   return result;
} 


void reset()
{
  fib=0;
  f0=0;
  f1=1;
  f2=1;
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


