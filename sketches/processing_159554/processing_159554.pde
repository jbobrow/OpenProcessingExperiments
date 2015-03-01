
//MOUSE Puntero e interaccion

void setup() { 
  size(600,400);
  background(255);
}

void draw() {
  float colx = map(mouseX, 0, width,0, 255);
  float coly = map(mouseY, 0, height, 0, 255);
  println(mouseX);//Donde se encuentra el puntero, dentro de la ventana, en el eje X
  //println(mouseY);
  fill(colx, coly, 200);
  stroke(255);
  ellipse(mouseX,mouseY,50,50);
}  
