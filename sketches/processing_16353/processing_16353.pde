
 int x=0;
 int y=0;
 int direccion =1;
void setup(){
size(900,900);
}
void draw(){
  background(390);
  
  autito(x,y,200);
  autito(x,100,y);
movimiento();
  regreso();
}
void autito(int x,int y,int tamanio){//completo aqui y luego en draw//
int zona;
zona=tamanio/4;
   
rectMode(CENTER);
fill(random(0,255),random(0,0),random(34));
ellipse(x,y,tamanio,tamanio/2);
fill(234,64,96,200);
ellipse(x-zona,y-zona,tamanio/4,tamanio/8);
ellipse(x+zona,y-zona,tamanio/4,tamanio/8);
ellipse(x-zona,y+zona,tamanio/4,tamanio/8);
ellipse(x+zona,y+zona,tamanio/4,tamanio/8);
fill(45,78,90,87);
triangle(x,y+zona,98,90,45,78);
triangle(x,y-zona,98,90,45,78);
}//toda funcion habre poarentesis y corchete//
void movimiento(){
 
x =x+direccion;
y=y+direccion;
}

void regreso(){

if(x>600|| x<=0|| y>600||y<=0){
  direccion=direccion*-1;}
  
}



