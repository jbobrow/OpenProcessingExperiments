
int X;
int Y;
int cambioX;
int cambioY;
int X2;
int Y2;
int cambioX2;
int cambioY2;

void setup(){
size(400,300);
background(11,84,194);
X=200;
Y=150;
cambioX=1;
cambioY=1;

X2=200;
Y2=150;
cambioX2=-1;
cambioY2=-1;
}

void draw(){
  
if(Y>300){
  cambioY=-1;
}

if(X>400){
  cambioX=-1;
}

if(Y<0){
  cambioY=1;
}

if(X<0){
cambioX=1;
}
  
X=X+cambioX;
Y=Y+cambioY;
fill (131,212,219,50);
stroke(255,255,255,50);
ellipse(X,Y,10,10);

if(Y2>300){
  cambioY2=-1;
}

if(X2>400){
  cambioX2=-1;
}

if(Y2<0){
  cambioY2=1;
}

if(X2<0){
cambioX2=1;
}
  
X2=X2+cambioX2;
Y2=Y2+cambioY2;
fill (229,230,179,50);
stroke(255,255,255,50);
ellipse(X2,Y2,10,10);



}
