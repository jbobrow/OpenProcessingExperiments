
//ejemplo de modulo con funciones
//chris kairalla

//contador aumenta en 1 cada loop
int counter = 0;
//determina cuatos niveles mas abajo deberan contarse antes de dibujar el otro rect 
int repeat = 3;
//posicion x de rect
int x = 0;
//posicion y de rect
int y = 0;
//ancho de rect
int lineWidth = 5;
//alto de rect
int lineHeight = 200;


void setup(){
 size(400, 400);
background(255); 
frameRate(20);
}

void draw(){  

  int multNumber = modulo(counter, repeat);
  moveLine(multNumber);
  //dibuja rect
  noStroke();
  fill(184,113,255);
  rect(x, y, lineWidth, lineHeight);
  fill(194,245,238);
ellipse(x,200,60,20);
 fill(250,146,234);
 
  ellipse(x,100,150,10);
  ellipse(x,300,150,10);
  fill(128,128,128);
  ellipse(x,150,120,5);
  ellipse(x,250,120,5);
  
 
  //resetea si la linea se queda en el ancho de la pantalla 
  
    if (x > width){
    resetValues();
  }
  increaseCounter();
}

//funcion que devuelve el modulo de dos numeros 
int modulo(int ctr, int _repeat){
 int m = ctr % _repeat;
 return m; 
}

//mueve el rect a la prox posicion 
void moveLine(int multNumber){
   //coloca el siguiente rect justo abajo del ultimo
  y = lineHeight * multNumber;
    //mueve el siguiente rect a la derecha del ultimo rect 
  x += lineWidth; 
}

void increaseCounter(){
   //aumenta contador. Este puede aumentar lo que quiera, y
  //modulo siempre sera un ciclo arriba para repetir el valor 
  counter ++; 
}

void resetValues(){
   background(255);
   x = 0;
   y = 0; 
}



