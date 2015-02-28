
/*
PROYECTO 01 SESION 3 : Controlando nuestro codigp
 
 T√≠tulo: FUNSHITONE
 Nombre: GERARDO BORGES
 Fecha:  3 DE JUNIO DE 2010
 Lugar: BARCELONA
 Objetivo: 
 Realizar un sketch que 
 
 -interaccione de alguna manera con el  mouse
 
 - que tenga eventos de teclado
 
 - El Sketch tiene que tener una sentencia condicional
 
 */
//
int x = 0;
int y = 150;
int rojo = 80;
int gerde = 120;
int bazul = 39;
int alfa = 10;
int velocidad = 20;
int talla = 10;

void salvar() { 
  println("SALVAMOS IMAGEN");
  saveFrame("out/funshitones-####.png");
}


void setup(){
  size(600, 255);
  frameRate(30);
  smooth();
  noStroke();
  background(200, 240, 190);
}

void draw(){
  muevete();
  retorno();
  perol();
  if (alfa > 255){
    alfa = 100;
  }
  println("talla: "+talla);
  println("rojo: "+rojo);
  println("X: "+x);
  println("Y: "+y);
}

// EL MOVIEMIENTO EN CUESTION
void muevete(){
  x = x + velocidad;
  talla = talla + 10;
  if (talla > 60){
    talla = -talla;
  }
}
// EL OBJETO EN CUESTION
void perol(){
  //EL COLOR EN CUESTION
  color tono = color(rojo, gerde, bazul, alfa);
  //
  fill(tono);
  rectMode(CENTER);
  rect(x, y, talla, talla);
}

//EL REGRESO EN CUESTION
void retorno(){
  if (x>width){
    x = 0;
    y = int(random(x, height));
    velocidad = int(random(2, 40));
    talla = 20;
    alfa = alfa + 4;
    rojo = 0;
  }
}


// LA INTERACCION EN CUESTION
void mouseReleased(){
  x = 0;
  y = mouseY;
  rojo = mouseY;
  gerde = int(random(0, 255));
  bazul = mouseY +100;
  alfa = alfa + 4;
  velocidad = int(random(20, 40));
  talla = 10;
}


void mouseDragged(){
  talla = talla - 100;
}  




void keyPressed() {
  switch(key) {
  case '1': 
    talla = 600;
    println("la talla ahora es 600");
    break;
  case '2': 
    talla = 100;
    println("la talla ahora es 100");
    break;
  case 's': 
    salvar();
    println("guardar");
    break;
  }
}

















