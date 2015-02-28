
int radius=40;
float x= 110;
float speed =2.5; //desplazamiento horizontal
int direction =1; //factor que determina si va a la derecha o izquierda
float boca1 = 0.52; //abajo1
float boca2 = 5.76; //arriba1
float boca3 = 3.67; //arriba2
float boca4 =8.9; //abajo2
float abrir = 0.1; //factor que modifica el valor de los radianes para que el arco se agrande o achique

void setup(){
  size(500,120);
  ellipseMode(RADIUS);
}


void draw(){
  background(0);
  x +=speed *direction;
 boca1 = boca1 +abrir;
 boca2 =boca2 -abrir;
 boca3 =boca3 -abrir;
 boca4 = boca4 +abrir;
 
  //cambio de direccion
  if ((x > width - radius) || (x < radius)) {
 direction= -direction;
}

//si va hacia la derecha, dibuja un arco hacia la derecha, si no,mirando a la izquierda 
if (direction ==1){
  fill (255,255,0);
  arc(x,60,radius,radius,boca1,boca2);
} else {
  arc(x,60,radius,radius,boca3,boca4);
 
}

 if((boca1 < 0-0.31)||(boca2 > TWO_PI+0.31)){
    abrir=-abrir;  
  }
  if((boca1 > 1.26)||(boca2 < 5.03)){
    abrir=-abrir;  
  }
  
   if((boca3 <3.14)||(boca4 > 3.14)){
    abrir=-abrir;  
  }
  if((boca3 > 1.26)||(boca4 < 5.03)){
    abrir=-abrir;  
  }


}
