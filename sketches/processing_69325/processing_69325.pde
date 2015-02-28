
int x=45;
int y=50;
int a=30;
int b=30;
int c=10;
int d=80;
int e=10;
int f=150;
int g=35;
int h=150;
int i=65;
int j=150;
int k=90;
int l=150;
int m=40;
int n=20;
int o=70;
int p=20;
void setup(){
size(600,400);
smooth();
noStroke();
noFill();
strokeWeight(1);
background(255);
}
void draw(){
  background(255);
  fill(13,78,160);
  strokeWeight(1.5);
  rect(x,y,20,30);
  x=x+1;
  y=y+1;
  stroke(116,117,118);
  rect(a,b,50,20);
  a=a+1;
  b=b+1;
  rect(c,d,80,60);
  c=c+1;
  d=d+1;
  ellipse(e,f,20,20);
  e=e+1;
  f=f+1;
  ellipse(g,h,20,20);
  g=g+1;
  h=h+1;
  ellipse(i,j,20,20);
  i=i+1;
  j=j+1;
  ellipse(k,l,20,20);
  k=k+1;
  l=l+1;
  fill(247,142,2);
  ellipse(m,n,15,15);
  m=m+1;
  n=n+1;
  ellipse(o,p,15,15);
  o=o+1;
  p=p+1;
}

