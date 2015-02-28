
/*
PROYECTO 01 SESION 3: Controlando nuestro codigo

Titulo: Hoyo negro
Nombre: Wendy Cano
Fecha: 27-abril-2011
Lugar: Barcelona
Objetivo:  Realizar un sketch que 
 
 -interaccione de alguna manera con el  mouse
 
 - que tenga eventos de teclado
 
 - El Sketch tiene que tener una sentencia condicional
*/
float inc = 5.0;//incremento de angulo
float dim = 5; //diametro de la ellipse central
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 70;
int NUM_TALLOS = 30;
void setup() {
  size(500,500);

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(#9C00FF);
  } //equivalente a  if ( isBackGround ){ background(255);}
  if (isFade) hazFade();
  inc += 0.05;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /7.0 ;
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla
  for (int i = -2; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio
    tail(0,1, 50, angle); // llamamos a la funcion tal con 4 parametros
    rotate(PI*2/NUM_TALLOS); // rotamos nuestra pantalla PI/4
  }
  
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  
  for (int i =0 ; i < units; i++) { // loop decreciente, 
    rotate(angle);
    translate(2,3); //translate(0, 4); interesante
    strokeWeight(i);
    stroke(0);//
    line(0, 0, 0, 0);
    strokeWeight(0);
    line(0,0,0,0);
    
    
  }
  fill(#03FCC8);
  ellipse(0,0,20,20);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(155,10);
  noStroke();
  rect(0,0,width,5);
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


