
/* 
Joan Soler-Adillon
Realitat Virtual || Realidad Virtual - Processing
Màster en Arts Digitals, UPF
http://www.joan.cat/

Basado en:
 http://www.fundacionmaturen.com/images/tira gris.gif 
*/
 

//posicion, velocidad con PVector
PVector pos, vel;
//... y tamaño con int
int sz = 40;

void setup(){
  size(500,200);
  //inicializamos los PVector:
  pos = new PVector(width/2, height/2);
  vel = new PVector(5,0);
}

void draw(){

  //dibujamos el fondo
  colorMode(RGB, width);
  for(int i=0;i<width;i++){
    stroke(i);
    line(i,0,i,width); 
  }

  //actualizamos posición
  pos.add(vel);
  //esto es equivalente a: pos.x = pos.x+vel.x;
  
  //dibujo
  noStroke();
  fill(width/2);
  ellipse(pos.x,pos.y,sz,sz);

  //comprobamos límites y invertimos velocidad si hace falta:
  if((pos.x<0)||(pos.x>width)){
    vel.x = -vel.x;
  } 
}



