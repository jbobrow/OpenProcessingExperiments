
/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: FOOTSTEPS
 Nombre: iNÊSantiago
 Fecha:  23.05.209
 Lugar: hangar - barcelona
 Objetivo: modificacion de un sketch mediante la técnica skratch

 La trigonometría nos sirve para oscilar entre varios valores. un seno o un coseno
 siempre oscilara entre valores decimales entre -1 y 1. Por ahora con esto nos basta para poder
 utilizarlo en el movimiento de la flor
 */
float inc = 0.0;//incremento de angulo
float dim = 30; //diametro de la ellipse central
boolean isBackGround = true; 
boolean isFade = false;
int LONGITUD = 100;
int NUM_TALLOS = 5;
void setup() {
  size(800,800);

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(#561c3d);
  } //equivalente a  if ( isBackGround ){ background(255);}
  if (isFade) hazFade();
  inc += 0.1;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /1.0 ;
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla
  for (int i = 0; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio
    tail(0,dim/2, LONGITUD, angle); // llamamos a la funcion tal con 4 parametros
    rotate(PI/NUM_TALLOS); // rotamos nuestra pantalla PI/4
  }

}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  for (int i =50 ; i < units; i++) { // loop decreciente, 
    strokeWeight(i);
 
    fill(250);
    rect(-10, -40, 0, -40);
    noStroke();
    line(0,0,5,0);
    translate(-5, 10); //translate(0, 4); interesante
    rotate(angle);
  }
  fill(#1ec04c);
  ellipse(0,0,50,100);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill (#c01e76);
  noStroke();
  rect(0,0,width,height);
}

void keyPressed() {
  switch(key) {
  case '+': 
    println("has pulsado la tecla +");
    break;
  case '-': 
    println("has pulsado la tecla -");
    break;

  case 'F': 
  case 'f':
    isFade = !isFade;
    break;
  case 's': 
  case 'S': 
    println("salvamos IMAGEN");
    save("out/filename-"+frameCount+".png");
    break;

  case 'b': 
  case 'B': 
    isBackGround =! isBackGround;

    break;
  }
}


