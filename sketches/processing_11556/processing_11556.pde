
//contador aumenta en 1 cada loop
int counter = 9;
//determina cuatos niveles mas abajo deberan contarse antes de dibujar el otro rect
int repeat = 6;
//posicion x de rect
int x = 0;
//posicion y de rect
int y = 0;
//ancho de rect
int rectWidth = 30;
//alto de rect
int rectHeight = 50;
 
 
void setup(){
 size(400, 200);
background(96, 5, 245);
frameRate(30);
}
 
void draw(){
  //usa modulo para crear un loop repetitivo de numeros
  //cambia repetir para hacer mas filas de rects
  int multNumber = modulo(counter, repeat);
  moveRect(multNumber);
  //dibuja rect
  fill (242,229,83);
  rect(x, y, rectWidth, rectHeight);
  fill (137,240,119);
  ellipse(x, y, rectWidth, rectHeight);
  
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
void moveRect(int multNumber){
   //coloca el siguiente rect justo abajo del ultimo
  y = rectHeight * multNumber;
    //mueve el siguiente rect a la derecha del ultimo rect
  x += rectWidth;
}
 
void increaseCounter(){
   //aumenta contador. Este puede aumentar lo que quiera, y
  //modulo siempre sera un ciclo arriba para repetir el valor
  counter ++;
}
 
void resetValues(){
   background(96, 5, 245);
   x = mouseY;
   y = mouseX;
}

