
void setup()
{
size(400,400);
noFill();
}
float r = 0;
float g = 0;
float b = 0;
int j1=0, j2=200, j3=200, j4=200;
int k1=400, k2=200, k3=200, k4=210;
int m1=200, m2=0, m3=210, m4=200;
int n1=0, n2=200, n3=200, n4=210;
int p1=0, p2=0, p3=400, p4=400;
int q1=0, q2=0, q3=400, q4=400;
int c1=0, c2=0, c3=0, c4=0, c5=0, c6=0;
int rate=10;
void draw()
{
  
    if(c5<400){
      rate=20;
  stroke(r,g,b,30);
  line(p1,p2,p3,p4);
  p1=p1+1;
  p3=p3-1;
  c5=c5+1;
  r=r+1;
  g=g+0.5;}
  
  if(c6<400){
  stroke(r,g,b,30);
  line(q1,q2,q3,q4);
  q2=q2+1;
  q4=q4-1;
  r=r+1;
  g=g+0.5;
  c6=c6+1;}
  
  
  frameRate(rate);
  strokeWeight(2);
  if (c1<21){
  stroke(200,13,13);
  line(j1,j2,j3,j4);
  j1=j1+10;
  j4=j4-10;
  c1=c1+1;}
  
  if (c2<21){
  stroke(200,13,13);
  line(k1,k2,k3,k4);
  k1=k1-10;
  k4=k4+10;
  c2=c2+1;}
  
  if (c3<21){
  stroke(25,20,100);
  line(m1,m2,m3,m4);
  m2=m2+10;
  m3=m3+10;
  c3=c3+1;}
  
  if (c4<21){
  stroke(25,20,100);
  line(n1,n2,n3,n4);
  n1=n1+10;
  n4=n4+10;
  c4=c4+1;}
  
  
}


