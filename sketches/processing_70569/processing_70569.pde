
int x=30;
int y=30;
int bandera=1;
int bandera1=1;
 
void setup(){
size (600,400);
smooth();
fill (0,150,200);
}
void draw(){
  background (255);
ellipse(x,y,50,50);
if(x<= width-30){
  if(bandera==1){
  x=x+1;
}
}
//trayecto a la derecha
else{
bandera=0;
}
if( bandera==0) {
  y=y+1;
  if (y==370){
  bandera=2;
}
}
//trayecto abajo
 
if(bandera==2){
  x=x-1;
  if(x==30){
    bandera=3;
    }
  }
  //pelota regresando a la izquierda
if(bandera==3){
  y=y-1;
  if(y==30){
    bandera=4;
    }
  }
if(bandera==4){
  x=x+1;
  if(x==30){
    bandera=5;
    }
  }
}

