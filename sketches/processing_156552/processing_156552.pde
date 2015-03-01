
float x,y,xc=400,yc=40,rx,ry,rz,t,nx=0,ny=0,r=100,g=100,b=100,ract,gact,bact,colcounter=0,boxwid=100,nylast=0,alphlast,boxlast,alphbox=80,alphb=80;
float rota=PI;

float eventfact=1;
boolean counter=false;
PFont f;

void setup()
{
  size(800,600,P3D);
  background(255);
 smooth();
  frameRate(60);
  noCursor();
  f= createFont("Andale Mono",4,true);
}

void draw()
{
  background(10);
  boxbreak();
}
void boxbreak()
{
  t=millis();
  float tmod=t%8000;
  x=30*sin(t/1000);
  y=30*cos(t/1000);
  rx=map(tmod,0,8000,0,2*PI);
  ry=rx;
  rz=rx;
  if(keyPressed==true)
  {
    if(!counter)
    counter=true;
    else
    if(counter)
    counter=false;    
  }
  if(counter)
 {

ny=map(tmod,0,8000,0,height/2);
 }
   if(!counter)
   {
   nx=0;
   ny=0;
   }

if(mousePressed==true)
{
  ract=random(255);
  gact=random(255);
  bact=random(255);
}
  pushMatrix();
  translate(nx,ny-30,0);
 
 
 noStroke();
  fill(ract,gact,bact);
  ellipse(xc,yc,20,20); //moving nucleus
  
fill(#FA635B,120+135*sin(t/1000)*sin(t/1000));       //moving orbit circle
  ellipse(xc+x,yc+y,15,15);
    
  noFill();
  stroke(190);
  strokeWeight(0.3);
  ellipse(xc,yc,60,60); //moving fixed radius
  
  float cirvar=map(tmod,0,3000,20,100);

 stroke(255);
 ellipse(xc,yc,cirvar,cirvar);
  
   textFont(f,10);                
  fill(255,239,52);     
  text(ny-height/2,xc+40,yc);
  stroke(120);
  float xvarl=map(tmod,0,8000,0,width/2);
  float xvarl2=map(tmod,0,8000,width,width/2);
  float ycon=-ny+30;
  line(xvarl,ycon,xc,yc);
  line(xvarl2,ycon,xc,yc);
 
  
  popMatrix();


pushMatrix();
translate(width/2,height/2);
 

if(ny<height/2-100)
{
  nylast=ny;
  alphbox=80;
  boxwid=50+map(ny,0,200,10,100);
  boxlast=boxwid;
  alphlast=alphbox;
}
if(ny>height/2-100)
{
   float multir=100-map(ny,200,height/2,100,0);
  stroke(ract,gact,bact);
  noFill();
  for(int i=0;i<10;i++)
  ellipse(0,0,multir*i,multir*i/10);
  boxwid=map(ny,200,height/2,boxlast,10);
  alphbox=map(ny,nylast,height/2,alphlast,10);
}
noFill();
stroke(20,120+135*sin(t/1000)*sin(t/1000));
float radvar=t%200*0.0001;
ellipse(0,0,radvar,radvar);

rotateX(rx*ny/10000);
rotateY(rx);
rotateZ(rz);

stroke(255,alphbox);
box(boxwid,boxwid,boxwid);

popMatrix();  

}


