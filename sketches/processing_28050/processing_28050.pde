
/*
Alba G. Corral - 2009
 Titulo: oscilaciones matrix
 Descripción:
 este sketch nos sirve para ver otra utilizad de la pila de matrices:
 El uso conjunto de PushMatrix y PopMatrix permite almacenar estados 
 intermedios de la transformación en la pila y 
 recuperarlos posteriormente.
 
 La trigonometría nos sirve para oscilar entre varios valores. un seno o un coseno
 siempre oscilara entre valores decimales entre -1 y 1. Por ahora con esto nos basta para poder
 utilizarlo en el movimiento de la flor
 */
float inc = 0.0;//incremento de angulo
float dim = 50; //diametro de la ellipse central
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 130;
int NUM_TALLOS = 8;
void setup() {
  size(800,800);

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(255);
  } //equivalente a  if ( isBackGround ){ background(255);}
  if (isFade) hazFade();
  inc += 0.05;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /20.0 ;
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla
  for (int i = 0; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio
    tail(0,dim/2, LONGITUD, angle); // llamamos a la funcion tal con 4 parametros
    rotate(PI*2/NUM_TALLOS); // rotamos nuestra pantalla PI/4
  }
  fill(0,0,0);
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  
  for (int i = 0 ; i < units; i++) { // loop decreciente, 
    rotate(angle*2);
    translate(0, 5); //translate(0, 4); interesante
    strokeWeight(i);
    stroke(0);//
    line(0, 0, 20, -4);
    strokeWeight(1);
    line(0,0,20,10);
    
    
  }
  fill(255,255,0);
  ellipse(0,0,10,10);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(255,10);
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


