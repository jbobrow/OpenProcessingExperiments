
background(#404040);

int x1;
int y2;
int x2;
int y1;
int z1;
int z2;
size(400,400);

//Draw 20 Lines

x1=0;
x2=0;
y1=0;
y2=400;
z1=0;
z2=200;

for(int i=0; i < 21; i++){
 stroke(#FF0000);
  line(x1,0,200,y2);
  x1+=20;
  y2+=0;
 }
  for(int a=0; a < 21; a++){
 stroke(#009999);
  line(x1,200,0,y2);
  x1-=0;
  y2-=20;
 }
  for(int b=0; b < 21; b++){
 stroke(#00FF00);
  line(200,x2,y1,400);
  x2+=0;
  y1+=20;
 }
 for(int c=0; c < 21; c++){
 stroke(#990099);
  line(0,z2,z1,0);
  z2+=0;
  z1+=20;
 }
 



  


