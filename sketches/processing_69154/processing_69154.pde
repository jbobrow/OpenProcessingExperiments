
int x=0;
int y=0;
int a=10;
int b=80;
int x2=65;
int y2=80;
int c=130;
int d=80;
int e=150;
int f=25;
int e2=210;
int f2=0;
int g=180;
int h=-15;

void setup(){
  size(500,500);
  smooth();
  background(255);
}

void draw(){
  background(255);
  stroke(255,230,0);
  
  //cuerpo
  stroke(48,39,49);
   strokeWeight(4);
  fill(108,39,113);
  rect(x,y,150,50);
  x=x+1;
  y=y+1;

  //rueda 1
  fill(0);
  stroke(48,39,49);
  strokeWeight(4);
 ellipse(a,b,70,60);
 a=a+1;
b=b+1; 

 //rueda 2
ellipse(x2,y2,70,60);
x2=x2+1;
y2=y2+1;
 
 //rueda 3
 ellipse(c,d,70,60);
c=c+1;
d=d+1;


  //antena
 stroke(48,39,49);
 strokeWeight(12);
 line(e,f,e2,f2);
 e=e+1;
 f=f+1;
 e2=e2+1;
 f2=f2+1;
 
 
 //cabeza
 stroke(48,39,49);
  strokeWeight(5);
fill(108,39,113);
rect(g,h,40,60);
g=g+1;
h=h+1;
}

