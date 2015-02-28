
void setup(){
background (#60C7E3);
size(200,200);
}
int a = 53;

void draw(){
     
  background(#3DD4E0);
fill(#FCB0F5);
 strokeWeight(3);

 int x =100;
int y=0;
int dtx=12;
int dty =20;
int ptx=10;
int pty =22;




 triangle(13,200,100,1,192,200);
for(int i=0;i<10;i++)
{
  stroke(#7C4036);
  line(x,y,x+dtx,y+dty);
  x+= ptx;
  y+= pty;
}

x =100;
 y=0;
dtx=12;
dty =-20;
ptx=-10;
pty =22;

for(int i=0;i<10;i++)
{
  line(x,y,x+dtx,y+dty);
  x+= ptx;
  y+= pty;
}
 strokeWeight(1);
for(int i=0;i<7;i++)
for(int j=0; j<7 ;j++)
{
 
  strokeWeight(1);
  rect(87+i*5,159+j*2,5,5);
    rect(92,176,25,30);
 rect(73+i*8,85+j*2,10,10);
 rect(73,100,58,20);
 rect(53+i*2,141+j*2,5,5);
 rect(53,150,17,13);
 rect(139+i*2,141+j*2,5,5);
 rect(139,150,17,13);
 rect(57,193,10,7);

}

x =60;
 y=182;
dtx=3;
dty =-2;
ptx=-1;
pty =2;

for(int i=0;i<10;i++)
{
  line(x,y,x+dtx,y+dty);
  x+= ptx;
  y+= pty;
}

x =60;
 y=180;
dtx=3;
dty =2;
ptx=1;
pty =2;

for(int i=0;i<10;i++)
{
  line(x,y,x+dtx,y+dty);
  x+= ptx;
  y+= pty;
}
animal();
}
void animal(){

  fill(255,0,0);
  ellipse(a,198,7,7);
  fill(#F5E74F);
  rect(a+20,188,7,30);
   ellipse(a+24,185,7,7);



  line(a,194,a+20,192);
  a++;
  if(a==155){
    noLoop();
  }
}
 



