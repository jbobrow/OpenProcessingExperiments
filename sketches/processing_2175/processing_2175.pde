
/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: pelota donde quiere
 Nombre: Andrea Farina
 Fecha:  25/05/09
 Lugar: Idep
 Objetivo: modificacion de un sketch mediante la técnica skratch
 */
//


float posx= 100; // posicion de mi pelota
float posy;
float tam =200;

float inc = 0.0;//incremento de angulo

void setup(){
  smooth();
  size (400,400);
  cursor(CROSS); //modifica el puntero de raton a una cruz
  background(255);
  iniciar(0,random(height));
  smooth();
}
void dibujaPelota(){
  inc += 0.3;
  fill(color(random(255),0,0));
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc);
  float tamanio =map(angle,-1,2,10,tam);
  ellipse (posx,posy,tamanio,tamanio);
}
void render(){

  posx = posx + 2;
  posy = posy + 1;
  if ( posx > width ) iniciar(0,posy);
}
void iniciar(float xy, float yx){
  posx =random (0, 400);
  posy = random(20,400);
  tam = random(20,200);
}
void draw(){
  // background(0);
  render();
  dibujaPelota();
}
void mousePressed(){

  iniciar(mouseX,mouseY);
}

void keyPressed() {

  if(key=='+') {
    tam++;
  }  
  if(key=='-') {
    tam--;
  }  
  if (key == 's' || key == 'S') {
    saveFrame("imaginarioscirculares-####.png");
    println("GRABAMOS:");
  }
}






