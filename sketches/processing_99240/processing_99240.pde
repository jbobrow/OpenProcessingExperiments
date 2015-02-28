
void setup(){
size(400,400);
}
int x = 0;
int a = 400;
int j = 0;
int b = 400;
int speedx = 10;
int speeda = -10;
void draw(){
background(25,25,112);
Cone(0,0);
frameRate(30);
fill(255,69,0,j/2);
noStroke();
ellipse(x,x,j,j);
fill(255,255,0,j/2);
ellipse(a,a,b,b);
x=x+speedx;
a=a+speeda;
if (x<400){
j=j+10;
}
if (x>400){
  x=0;
  j=0;
}
if (a>0){
b=b-10;
}
if (a<0){
  a=400;
  b=400;
}
}
void Cone(int x, int y){
  smooth();
  noFill();
strokeWeight(1);
stroke(218,165,32);
  int i = 0;
for(i=0; i<400; i=i+10)
{
if (i<400){
ellipse(i,i,i,i);
}
else{
ellipse(i,i,(400-i),(400-i));
}
}
}
