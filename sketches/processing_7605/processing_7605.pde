
import peasy.*;
PeasyCam camera;

float y=0;
float z=0;
int v[][] = new int[2][3];
float rotX;
float rotY;
float rotZ;
int ani=0;
int len=200;
float trans=2000;

void setup(){ 
  size(900, 600, P3D); 
  colorMode(HSB, 255);
  noStroke(); 
  camera = new PeasyCam(this, 0, 0, 0, 2000);
  newV();
  newV();
} 

void newV()
{
  int diff;
  for (int i=0;i<3;i++)
  {
    v[0][i]=v[1][i];
  }  
  do{
    diff=0;
    for (int i=0;i<3;i++)
    {
      v[1][i]=round(random(1,5));
      diff+=abs(v[1][0]-v[0][0]);
    }
  }
  while ((diff<1)||(diff>3));
}

void draw(){
  ani++;
  if (ani>=trans){
    ani=0;
    newV();
  } 
  y= (y<1)? y+(40/trans) : y-1;
  background(100); 
  directionalLight(240,100,255, 0, 0, -1);
  for (int x=0;x<len;x++)
  {
    pushMatrix(); 
    z=x+y;
    rotX=(v[0][0]+(v[1][0]-v[0][0])/trans*ani)/len;
    rotY=(v[0][1]+(v[1][1]-v[0][1])/trans*ani)/len;
    rotZ=(v[0][2]+(v[1][2]-v[0][2])/trans*ani)/len;
    rotateX(z*TWO_PI*rotX); 
    rotateY(z*TWO_PI*rotY); 
    translate(500+abs(sin(z*TWO_PI*rotZ))*700,0,0); 
    fill(x%256,250,255);
    box(500,60,40); 
    popMatrix(); 
  } 
} 

void keyPressed()
{
  if (key==' '){
  newV();
  ani=0;
  }
  if (key=='.') if (trans>200) trans=int(trans*0.7);
  if (key==',') if (trans<2500) trans=int(trans*1.5);
    
}










