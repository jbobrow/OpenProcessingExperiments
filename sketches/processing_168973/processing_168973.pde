
int t=0;
int q=0;
int c=10;
int d=10;
int x=300;
float z;
float v;
float n;
void setup()
{size(300,300);
background(255);}
void draw(){
  z=random(255);
  v=random(255);
  n=random(255);
  fill(z,v,n);
  rect(t,q,c,d);
  t=t+10;
  if(t > width ){
    t=-10;
    t=t+10;
    q=q+10;}
}
