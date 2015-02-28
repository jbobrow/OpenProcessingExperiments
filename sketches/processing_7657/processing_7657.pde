
import peasy.*;
PeasyCam camera;

int v[] = new int[3];
int len=2000;
float r=0;
float sz=10;
int c=0;
int pause=0;
void setup(){ 
  size(900, 600, P3D); 
  colorMode(HSB, 255);
  noStroke(); 
  camera = new PeasyCam(this, 0, 0, 0, 2000); 
  v[0]=1;
  v[1]=11;
  v[2]=11;
} 

void newV()
{
  c=0;
  v[0]=1;
  v[1]=int(random(1,25));
  v[2]=int(random(1,25));
}

void draw(){
  c++;
  if ((c>80)&&(pause==0)) newV();
  r=r+0.002;
  if (r>TWO_PI) r-=TWO_PI;
  background(100); 
  directionalLight(180,80,255, 0, 0, -1);
  for (int x=0;x<len;x++)
  {
    pushMatrix();
    rotateY((2*r)+TWO_PI*x*v[0]/len); 
    rotateZ((-r)+TWO_PI*x*v[1]/len); 
    translate(200+sq(sin((r*-3)+TWO_PI*x*v[2]/len))*1000,0,0); 
    fill((x*255*20/len)%255,250,255);
    box (int(4*sz),int(3*sz),int(3*sz)); 
    popMatrix(); 
  } 
} 

void keyPressed()
{
  if (key==' ') newV();  
  if (key=='q') len=max(int(len*0.7),50); 
  if (key=='w') len=min(int(len*1.4),8000);   
  if (key=='a') sz=max(sz*0.7,1); 
  if (key=='s') sz=min(sz*1.4,100);   
  if (key=='p') pause=(pause+1)%2;   
}













