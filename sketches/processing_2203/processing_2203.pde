
/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: skratch 1
 Nombre: Rut Abradó
 Fecha:  26 mayo 2009
 Lugar: Blanes
 Objetivo: modificacion de un sketch mediante la técnica skratch
 */
 
float posx= 0; // posicion de mi pelota
float posy;
float tam =200;

float inc = 0.0;//incremento de angulo
 PImage hexagon;
boolean  iniciar;

void setup(){
 

  //noLoop();
  smooth();
  frameRate (50);
  size (500,500);
  cursor(CROSS); //modifica el puntero de raton a una cruz
  background(255);
  //iniciar(0,random(height)); //funció per saber on comença la rodona
iniciar=false;
//iniciar(mouseX,mouseY);

  smooth();
}
void mousePressed(){

  iniciar(mouseX,mouseY);
}
void dibujaPelota(){
  inc += 0.1;
  fill(color(random(255),255,0));
float angle = sin(inc) /2.0 ;
  
  float tamanio =map(angle,-1,1,50,tam);

stroke(255);
strokeWeight(2);
// Tint blue
tint(200,random(255),0); 

hexagon = loadImage("hex.png");
image(hexagon, posx+20, posy-25,tamanio/2,tamanio/2);
ellipse (posx,posy,tamanio,tamanio);
}
void render(){

 // posx = posx + 1;
    posx = posx + 5;
  posy = posy + 5;
  if ( posx > height ) iniciar(0,posy);
}





void iniciar(float xx, float yy){
  posx =xx;
  posy = yy;
  tam = random(10,100);
}





void draw(){
  // background(0);
  render();
  dibujaPelota();
}


void keyPressed() { 
  if (key == 's' || key == 'S') {
    saveFrame("imaginarioscirculares-####.png");
    println("GRABAMOS:");
  }
}






