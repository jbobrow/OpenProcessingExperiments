
float b;
float c; 
float d;
float e; 
int f=#4A2ADD;
float g;
float h;
float i;
float j;
int k= #3EF721;
float l;
float m;
float n;
float u;
int v= #F6DD14;
float p;
float q;
float r;
float s;
int t= #F97318;

void setup()
{
  size(600,600);
  background( #FC0B36);
  fill( #000000);
  stroke(0);
  rect(300,0,300,300);
  rect(0,300,300,300);
}
void draw()
{
  strokeWeight(5);
  stroke(f);
  f=f+1;
  noFill();
  rect(b,c,d,e);
  b=random(300,600);
  c=random(0,300);
  d=random(15,10);
  e=random(15,10);
  stroke(k);
  k=k+1;
  rect(g,h,i,j);
  g=random(0,300);
  h=random(300,600);
  i=random(15,10);
  j=random(15,10);
  
  
  stroke(v);
  
  v=v+1;
  ellipse(l,m,n,u);
  l=random(0,300);
  m=random(0,300);
  n=random(15,10);
  u=random(15,10);
  stroke(t);
  t=t+1;
  ellipse(p,q,r,s);
  p=random(300,600);
  q=random(300,600);
  s=random(15,10);
  r=random(15,10);
  
}

void mousePressed()
{

  fill( #000000);
  stroke(0);
  rect(300,0,300,300);
  rect(0,300,300,300);
  ellipse(l,m,n,u);
  l=random(0,300);
  m=random(0,300);
  n=random(15,10);
  u=random(15,10);
  stroke(t);
  t=t+1;
  ellipse(p,q,r,s);
  l=random(300,600);
  m=random(300,600);
  n=random(15,10);
  u=random(15,10);
  
}
