
int x=25;
int y=24;
int bandera=1;
int bandera1=1;

void setup () {
size (800,400);
smooth();
fill (0,255,255);
}
void draw () {
  background (255);
ellipse(x,y,50,50);
if(x<= width-25){
  if(bandera==1){
  x=x+1;
}
}
//aqui la pelota ya se fue a la derecha
else{
bandera=0;
}
if( bandera==0) {
  y=y+1;
  if (y==375){
  bandera=2;
}
}
//aqui la pelota ya bajo

if(bandera==2){
  x=x-1;
  if(x==25){
    bandera=3;
    }
  }
  //aqui la pelota ya se fue a la izquierda
if(bandera==3){
  y=y-1;
  if(y==25){
    bandera=4;
    }
  }
if(bandera==4){
  x=x+1;
  if(x==25){
    bandera=5;
    }
  }
}
