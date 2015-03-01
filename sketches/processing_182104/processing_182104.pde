
size(500,800);
background(255,239,191);
noStroke();
for (int i=0; i<=250; i=i+10)
{
  if (i>70)
  {
    ellipse(50,50,i-20,i-20);
    fill(225,150,57,i-150);
  }
  if (i<70)
  {
    ellipse(50,50,i+10,i+10);
    fill(255,0,0,i+120);
  }
}
int x=50;
if (x<60)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(x,180,x,210);
  }
  else
  {
    ellipse(x,x,x,x);
  }
int y=180;
if (y>60)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(y,x,y+30,x);
  }
  else
  {
    ellipse(x,x,x,x);
  }
int a=140;
if (a>100)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(a,a,a+30,a+30);
  }
  else
  {
    ellipse(a,x,y,x);
  }
int b=140;
if (b>100)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(a,a,a+30,a+30);
  }
  else
  {
    ellipse(a,x,y,x);
  }
int c=100;
if (c<=100)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(c,170,c+20,200);
  }
  else
  {
    ellipse(a,x,y,x);
  }
for (int i=-20; i<500; i=5+i)//gras
{
  if (i<500)
  {
    
    strokeWeight(3);
    stroke(89,166,120,150);
    line(i,650,i+20,800);
  }
}
int d=100;
if (d<=100)
  {
    stroke(255,89,52,150);
    strokeWeight(5);
    line(170,d,200,d+15);
  }
  else
  {
    ellipse(a,x,d,x);
  }
int q=30;//feet
if (q<40)
  {
    noStroke();
    fill(110);
    ellipse(275,640,q,q*2);
    ellipse(300,660,q,q*2);
    ellipse(405,640,q,q*2);
    ellipse(380,660,q,q*2);
  }
  else
  {
    noStroke();
    fill(110);
    ellipse(275,640,q,q*5);
    ellipse(300,660,q,q*5);
    ellipse(405,660,q,q*5);
    ellipse(380,660,q,q*5);
  }
int w=20;
if (w<40)
  {
    noStroke();
    fill(130);
    ellipse(340,620,w*8,w*6);
  }
  else
  {
    line(w,x,y,a);
  }
int t=30;
if (t>20)
  {
    triangle(240,470,235,530,290,500);//ears
    triangle(360,470,310,520,368,520);
  }
  else
  {
    line(260,500,340,515);
  }
int f=150; // face
if (f<40)
  {
    ellipse(f,f,40,40);
  }
  else
  {
    noStroke();
    fill(150);
    ellipse(300,550,f,f);
  }
int m=110;
if (m>50)
{
  fill(100);
  ellipse(304,565,m+20,m);
  fill(150);
  ellipse(300,550,f-20,f-40);
}
else
  {
    line(a,b,m,f);
  }
for (int i=2;i<=4;i=i+2)
{
  if (i>2);
  {
    fill(0);
    ellipse(260,508,i*4,i*3);
    ellipse(340,521,i*4,i*3);
  }
  if (i<=2);
  {
    fill(255);
    ellipse(260,505,i*1.5,i*1.5);//eyes
    ellipse(340,518,i*1.5,i*1.5);
    fill(0);
    ellipse (290,520,i,i); //nose
  }
}
int u=290; //mouth1
if (u>280)
  {
    stroke(0);
    strokeWeight(1);
    line(u,520,u-10,550);
  }
  else
  {
    line(u,u*2,u*3,u*4);
  }
int p=280; //mouth2
if (p>=280)
  {
    stroke(0);
    strokeWeight(1);
    line(p,550,p-10,553);
    line(p,550,p+13,555);
  }
  else
  {
    line(u,p*2,p*3,u*4);
  } 
