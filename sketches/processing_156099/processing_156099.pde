
int limit=900;
float rlim=2;
float phi= (1+sqrt(5))/2;
float e=exp(1);
 
float rota;
int cn=0;
float cx=0,cy=0,cz=0;

boolean paused = false;
boolean camstat=true;
boolean camreset=false;


float ScaleFactor=1;


void setup()
{
  size(800,600,P3D);
  smooth();
  frameRate(60);
  rectMode(CENTER);
}
void draw()
{
  
  if(!paused)
 { 
    background(255);
  
   float t=millis()/6000;
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
  
  rlim=3*sin(t/2)*cos(t)+rlim*sin(t/2)*cos(t); 
  for (int i=1; i < limit ; i++ ) 
 {
  int j;  
  for (j=2; j<i; j++) 
  {
    int n = i%j;
    if (n==0) 
    break;
   }

  if (i == j) 
  plot(i,rlim,t);
   
}}
 
  
}
void plot(int i,float rlim,float t)
{
    pushMatrix();
    float phi= (1+sqrt(5))/2;
    float imap=map(i,0,limit, 50,width-200);
    translate(imap,height/2);
    float ht=map(i,0,limit,0,height/3);
    float alph=map(i,0,limit,120,255);
    float ifc= map(i,0,limit,0,2*PI);
    rota=map(i,0,limit,0,rlim*ifc);
    float rotmap=map(mouseX,0,width,0,2*PI);
    
    
   rotateZ(rota);
   rotateX(rota/phi);
   rotateY(rotmap);
   
   scale(ScaleFactor);
   noFill();
   stroke(69,178,157,alph);
   strokeWeight(0.5);
   box(ht,ht,ht);
 

   stroke(#FF785D);
   strokeWeight(1);
   line(0,0,ht/2,ht/2);
    
   popMatrix();
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


