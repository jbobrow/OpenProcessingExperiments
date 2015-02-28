
int x = 0;
int speed = 1;
int y = 0;
int alt = 6;
int a = 0;
int b = 0;
int blocka = 8;
int blockb = 7;
void setup(){
  background(0);
  size(400,400);
  noStroke();
  smooth();
  
}
void draw(){
frameRate(30);
background(0);
noStroke();
fill(255);
rect(x+15,y,10,10);
x=x+speed;
y=y+alt;
if((x<0)||(x>=375)){
speed=speed*-1;
}
if((y<0)||(y>=400))
{
  alt=alt*-1;
}
rect(0,a,15,50);
rect(385,b,15,50);
a=a+blocka;
b=b+blockb;
if((a<0)||(a>=350))
{
  blocka=blocka*-1;
}
if((b<0)||(b>=350))
{
  blockb=blockb*-1;
}
fill(255,255,255,150);
for (int j = 0; j <= 400; j +=15)
  {
    rect(195,j,10,10);
  }
strokeWeight(10);
stroke(255);
noFill();
rect(160,10,20,40);
rect(220,10,20,40);
}
