
/*
PROYECTO 01 SESION 3 : Controlando nuestro codigp
 
 Título: titulo del sketch
 Nombre: Lluis Hernandez
 Fecha:  2/6/2010
 Lugar: in my desktop
 Objetivo: 
 Realizar un sketch que 
 
 -interaccione de alguna manera con el  mouse
 
 - que tenga eventos de teclado
 
 - El Sketch tiene que tener una sentencia condicional
 
 */
//

float inc = 0.0;//incremento de angulo
float dim = 10; //diametro de la ellipse central
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 70;
int NUM_TALLOS = 20;
void setup() {
  size(300,250);
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
 
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  
  for (int i =0 ; i < units; i++) { // loop decreciente, 
    rotate(angle);
    translate(0, 5); //translate(0, 4); interesante
    strokeWeight(i);
    stroke(0);//
    line(0, 0, 0, -4);
    strokeWeight(1);
    line(0,0,5,0);
    
    
  }
  fill(255,0,0);
  ellipse(0,0,10,10);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(255,10);
  noStroke();
  rect(0,23,width,height);
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




