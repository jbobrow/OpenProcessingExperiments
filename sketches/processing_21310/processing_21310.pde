
void setup(){
  size(200,200); // crea una ventana de 200x200
 
}


void draw(){
  background(255); // rellena el fondo de color blanco 
  
  
  rectMode(CENTER);
  fill(0,255,255); //relleno color cyan
  
  //dibuja un cuadro siguiendo la posicion del mouse en X y Y
  rect(mouseX,mouseY,30,30); 
}


