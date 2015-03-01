

//MOUSE Puntero e interaccion

void setup() { 
  size(600,400);
}

void draw() {
  println(mouseX);//Donde se encuentra el puntero, dentro de la ventana, en el eje X
  //println(mouseY);
  ellipse(mouseX,mouseY,50,50);
}  
