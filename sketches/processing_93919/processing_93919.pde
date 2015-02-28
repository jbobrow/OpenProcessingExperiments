
/* 
Joan Soler-Adillon
Realitat Virtual || Realidad Virtual - Processing
Màster en Arts Digitals, UPF
http://www.joan.cat/

Basado en:
 http://www.fundacionmaturen.com/images/tira gris.gif 
*/
 

//posicion, velocidad y tamaño
int pos, vel;
int sz = 40;

void setup(){
  size(500,200);
  pos = width/2;
  vel = 5;
}

void draw(){

  //dibujamos el fondo
  colorMode(RGB, width);
  for(int i=0;i<width;i++){
    stroke(i);
    line(i,0,i,width); 
  }

  //actualitzem posició
  pos = pos+vel;

  //dibujo
  noStroke();
  fill(width/2);
  ellipse(pos,height/2,sz,sz);

  //comprobamos límites y invertimos velocidad si hace falta:
  if((pos<0)||(pos>width)){
    vel = -vel;
  } 
}



