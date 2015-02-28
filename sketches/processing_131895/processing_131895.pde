
size(400,400);
background(#7BF5E8);

float r=random(0, 400);
float m=random(200,400);

for(int i=10;i<=400;i+=20)
{
  for(int x=5;i<=400;i+=2)
  {
    stroke(#2E879B);
    line(r,m,x,i);
  }}
  for(int a=10;a<=400;a+=5)
 {
   stroke(255);
   line(a,r, a+250, m);
 }
 for(int b=50;b<=400;b+=10)
 {
   stroke(0);
   line(200, r, b+100, m);
 }
 
