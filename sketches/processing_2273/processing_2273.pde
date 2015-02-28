
/*
Alba G. Corral - 2009
 Titulo: oscilaciones matrix
 Descripción:
 este sketch nos sirve para ver otra utilizad de la pila de matrices:
 El uso conjunto de glPushMatrix y glPopMatrix permite almacenar estados 
 intermedios de la transformación en la pila y 
 recuperarlos posteriormente.
 
 La trigonometría nos sirve para oscilar entre varios valores. un seno o un coseno
 siempre oscilara entre valores decimales entre -1 y 1. Por ahora con esto nos basta para poder
 utilizarlo en el movimiento de la flor
 */
 float x = 250;   // x location of square
float y = 250;     // y location of square

float speed = 0;   // speed of square

// A new variable, for gravity (i.e. acceleration).   
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.   
// Try changing this number to 2.0 and see what happens.
float gravity = 0.1;
float inc = 0.0;//incremento de angulo
float dim = 50; //diametro de la ellipse central

boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 15;
int NUM_TALLOS = 16;
void setup() {
  size(500,500);

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(135);
  } //equivalente a  if ( isBackGround ){ background(255);}
  if (isFade) hazFade();
  inc += 0.015;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /15.0 ;
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla
  for (int i = 0; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio
    tail(5,dim/5, LONGITUD, angle); // llamamos a la funcion tal con 4 parametros
    rotate(PI*2/NUM_TALLOS); // rotamos nuestra pantalla PI/4
  }
  fill(45,255,24);
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, x);
  for (int i =0 ; i < units; i++) { // loop decreciente, 
    strokeWeight(i);
    stroke(3);//
    line(30, 0, 2, 4);
    strokeWeight(1);
    line(240,2,50,56);
    translate(5, 10); //translate(0, 4); interesante
    rotate(angle);
  }
  fill(255,0,0);
  ellipse(34,49,150,10);
  rect(y,x,32,6);
 
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(222,250);
  noStroke();
  rect(y,x,width,height);
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


