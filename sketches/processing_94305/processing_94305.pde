
int x=100;
int y=50;
int dtx=12;
int dty=10;
int ptx=10;
int pty=10;
size(200,200);
background(250);
for(int i=0;i<8;i++){
  line(x,y,x+dtx,y+dty);
  x+=ptx;
  y+=pty;
}
x=90;
y=60;
dtx=12;
dty=-10;
ptx=-10;
pty=10;
for(int i=0;i<8;i++){
  line(x,y,x+dtx,y+dty);
  x+=ptx;
  y+=pty;
}
line(28,200,28,125);
line(172,200,172,125);
rect(100,150,70,50);
rect(40,150,20,20);
rect(65,150,20,20);
rect(120,173,35,20);
rect(125,193,5,7);
rect(145,193,5,7);
