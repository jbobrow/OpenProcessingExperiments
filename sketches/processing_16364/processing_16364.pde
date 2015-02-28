
 int x=0;
 int y=0;
void setup(){
size(600,600);
}
void draw(){
  background(390);
  autito(x,y,200);
  autito(x,100,y);
movimiento();
  
}
void autito(int x,int y,int tamanio){//completo aqui y luego en draw//
int zona;
zona=tamanio/4;
rectMode(CENTER);
fill(245,256,165,100);
rect(x,y,tamanio,tamanio/2);
fill(234,64,96,200);
rect(x-zona,y-zona,tamanio/4,tamanio/8);
rect(x+zona,y-zona,tamanio/4,tamanio/8);
rect(x-zona,y+zona,tamanio/4,tamanio/8);
rect(x+zona,y+zona,tamanio/4,tamanio/8);
}//toda funcion habre poarentesis y corchete//
void movimiento(){
 
x =x+1;
y=y+1;
}

