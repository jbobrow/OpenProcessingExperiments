
int d=0;
int d1=0;
int x=0;
int y=400;
int o=-13;
int o1=5;
int p=0;
void setup(){
  size(400,400);
  fill(0);
  frameRate(10);
  smooth();
}
 
void draw(){
  background(0); 
  if(d==0)
  {
  fill(255,255,0);
  arc(x,150,100,100,0.47,5.81);
  fill(0);
    arc(o+x,120,15,15,0,TWO_PI);
  x +=3;
  d=1;
  }
  else
  {
    fill(255,255,0);
   arc(x,150,100,100,0,TWO_PI);
    fill(0);
    arc(o+x,120,15,15,0,TWO_PI);
   x +=3;
   d=0;
  }
    if(d1==0)
  {
 fill(255,0,255);
  arc(y,250,100,100,0,2.67);
 fill(255,0,255);
  arc(y,250,100,100,3.61,7.15);
  fill(0);
  arc(o1+y,220,15,15,0,TWO_PI);
  y -=3;
  d1=1;
  }
  else
  {
    fill(255,0,255);
   arc(y,250,100,100,0,TWO_PI);
    fill(0);
    arc(o1+y,220,15,15,0,TWO_PI);
   y -=3;
   d1=0;
  }
  }
  

