
int a=130;
int b=90;
int c=110;
int d=70;
int e=50;
int f=30;
int g=80;
int h=55;
int i=170;
int j=150;
int k=180;
int l=145;
int m=140;
int n=160;
int o=177;
int p=100;
void setup()
{
    size(700,300);
}
void draw()
  {
   background(0);
  stroke(#DBFC08);
  fill(#6DFC08);
  rect(a,80,50,10);
  rect(a,40,50,20);
  rect(a,30,20,20);
  triangle(a,30,a,90,b,60);
  fill(#08EAFC);
  triangle(c,30,c,90,d,60);
  fill(#FC6A08);
  triangle(b,30,b,90,e,60);
  fill(#6DFC08);
  triangle(f,55,g,55,h,95);
  fill(#08EAFC);
  triangle(f,80,g,80,h,130);
  fill(#FC6A08);
  triangle(f,105,g,105,h,145);
  fill(#08EAFC);
  rect(h,150,40,30);
  fill(#6DFC08);
  triangle(f,130,g,130,h,170);
  fill(#FC6A08);
  rect(b,150,40,30);
  fill(#6DFC08);
  triangle(a,150,a,180,i,165);
  fill(#08EAFC);
  triangle(j,150,j,180,k,165);
  fill(#3E3A37);
  ellipse(l,45,10,15);
  noStroke();
  fill(250);
  ellipse(l,45,5,8);
  stroke(#0A10FF);
  line(a,80,m,60);
  line(m,60,j,80);
  line(j,80,n,60);
  line(n,60,i,80);
  line(i,80,o,60);
  fill(#F70788);
  stroke(#9A07F7);
  triangle(n,90,j,120,m,90);
  triangle(m,90,a,90,a,120);
  triangle(a,90,a,70,p,80);
  triangle(a,70,a,50,p,60);
  triangle(a,50,a,30,p,40);
  triangle(a,30,j,30,m,10);
  a=a+1;
  b=b+1;
  c=c+1;
  d=d+1;
  e=e+1;
  f=f+1;
  g=g+1;
  h=h+1;
  i=i+1;
  j=j+1;
  k=k+1;
  l=l+1;
  m=m+1;
  n=n+1;
  o=o+1;
  p=p+1; 
}
