
int cambioX;
int cambioY;
int X;
int Y;
int cambioX2;
int cambioY2;
int X2;
int Y2;
int cambioX3;
int cambioY3;
int X3;
int Y3;

void setup(){
  size(400,300);
  cambioX=1;
  cambioY=1;
  X=1;
  Y=1;
  cambioX2=3;
  cambioY2=3;
  X2=400;
  Y2=300;
    cambioX3=5;
  cambioY3=5;
  X3=200;
  Y3=150;
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
  
  if(Y2>300){
    cambioY2=-3;
  }
  if(X2>400){
    cambioX2=-3;
  }
  if(Y2<0){
    cambioY2=3;
  }
  if(X2<0){
    cambioX2=3;
  }
  X2=X2+cambioX2;
  Y2=Y2+cambioY2;
  
    if(Y3>300){
    cambioY3=-3;
  }
  if(X3>400){
    cambioX3=-3;
  }
  if(Y3<0){
    cambioY3=3;
  }
  if(X3<0){
    cambioX3=3;
  }
  X3=X3+cambioX3;
  Y3=Y3+cambioY3;
  
  fill(0,0,255);
  ellipse(X,Y,25,25);
    fill(255,0,0);
  ellipse(X2,Y2,25,25);
      fill(0,255,0);
  ellipse(X3,Y3,25,25);
  
  line(X,Y,X3,Y3);
}

