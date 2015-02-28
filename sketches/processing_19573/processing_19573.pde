
size(250,250);
background (166,246,252);
smooth();
noStroke();

for(int y=20; y<250; y+=53)
for(int x=20; x<250; x+=53)
{ellipse(y,x,30,30);}


noStroke();
int m=100;
int n=50;
fill(252,166,167,140);
rect(m-25,m-25,n+50,n+50);
fill(255,82,85,160);
rect(m,m,n,n);
fill(255,82,85,90);
rect(m-50,m-50,n+100,n+100);
fill(255,82,85,70);
rect(m-75,m-75,n+150,n+150);
fill(255,82,85,50);
rect(m-100,m-100,n+200,n+200);

