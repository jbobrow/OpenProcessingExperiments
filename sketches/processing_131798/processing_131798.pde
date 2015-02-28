
void setup() {
  //Damos valores para el color de fondo y el tamaÃ±o
  size(300, 300);
  background(0);
 }
void draw() {  //Crea el campo de juego en funcion del ancho(width) y el alto de la pantalla (height)
  stroke(255);  //Color del campo
  strokeWeight(1);  //TamaÃ±o de la linea del campo
  line(width/3, 0, width/3, height);
  line(width*2/3, 0, width*2/3, height);
  line(0, height/3, width, height/3);
  line(0, height*2/3, width, height*2/3);
  if (mousePressed && (mouseButton == LEFT)) {  //Comando para crear cruces segun que casilla pulsemos
     stroke(#00FF00); //Color de las cruces
     strokeWeight(3);
    //Casilla 1-1
    if (mouseX<width/3 && mouseY<height/3) {
      line(10, 10, (width/3)-10, (height/3)-10);
      line(10, (height/3)-10, (width/3)-10, 10 );
    }
    //Casilla 1-2
    if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/3) {
      line((width/3)+10, 10, (width*2/3)-10, (height/3)-10);
      line((width/3)+10, (height/3)-10, (width*2/3)-10, 10);
    }
    //Casilla 1-3
    if (mouseX>width*2/3 && mouseY<height/3) {
      line(((width)-width/3)+10, 10, width-10, (height/3)-10);
      line(((width)-width/3)+10, (height/3)-10, width-10, 10);
    }
    //Casilla 2-1
    if (mouseX<width/3 && mouseY>height/3 && mouseY<height*2/3) {
      line(10, (height/3)+10, (width/3)-10, (height*2/3)-10);
      line(10, (height*2/3)-10, (width/3)-10, (height/3)+10 );
    }
    //casilla 2-2
    if (mouseX>width/3 && mouseX<width*2/3 && mouseY>height/3 && mouseY<height*2/3) {
      line((width/3)+10, (height/3)+10, (width*2/3)-10, (height*2/3)-10);
      line((width/3)+10, (height*2/3)-10, (width*2/3)-10, (height/3)+10);
    }
    //Casilla 2-3
    if (mouseX>width*2/3 && mouseY>height/3 && mouseY<height*2/3) {
      line((width*2/3)+10, (height/3)+10, width-10, (height*2/3)-10);
      line((width*2/3)+10, (height*2/3)-10, width-10, (height/3)+10);
    }
    //Casilla 3-1
    if (mouseX<width/3 && mouseY>height*2/3 ) {
      line(10, (height*2/3)+10, (width/3)-10, height-10);
      line(10, height-10, (width/3)-10, (height*2/3)+10);
    }
    //Casilla 3-2
    if (mouseX>width/3 && mouseX<width*2/3 && mouseY>height*2/3) {
      line((width/3)+10, (height*2/3)+10, (width*2/3)-10, height-10);
      line((width/3)+10, height-10, (width*2/3)-10, (height*2/3)+10);
    }
    //Casilla 3-3
    if (mouseX>width*2/3 && mouseY>height*2/3) {
      line((width*2/3)+10, (height*2/3)+10, width-10, height-10);
      line((width*2/3)+10, height-10, width-10, (height*2/3)+10);
    }
  }
 
  if (mousePressed && (mouseButton == RIGHT)) {   //Comando para crear circunferencias segun que casilla pulsemos
    stroke(#0000FF); //Color de las circunferencias
    strokeWeight(5); //TamaÃ±o de la linea de la circunferencia
    fill(0);  //Color interno de la circunferencia
    //Casilla 1-1
    if (mouseX<width/3 && mouseY<height/3) {
      ellipse(width/6, height/6, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 1-2
    if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/3) {
      ellipse(width/2, height/6, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 1-3
    if (mouseX>width*2/3 && mouseY<height/3) {
      ellipse(width-width/6, height/6, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 2-1
    if (mouseX>width*2/3 && mouseY>height/3 && mouseY<height*2/3) {
      ellipse(width-width/6, height/2, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 2-2
    if (mouseX>width/3 && mouseX<width*2/3 && mouseY>height/3 && mouseY<height*2/3) {
      ellipse(width/2, height/2, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 2-3
    if (mouseX<width/3 && mouseY>height/3 && mouseY<height*2/3) {
 
      ellipse(width/6, height/2, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 3-1
    if (mouseX<width/3 && mouseY>height*2/3) {
      ellipse(width/6, height-height/6, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 3-2
    if (mouseX>width/3 && mouseX<width*2/3 && mouseY>height*2/3) {
      ellipse(width/2, height-height/6, (width/3.5)-5, (height/3.5)-5);
    }
    //Casilla 3-3
    if (mouseX>width*2/3 && mouseY>height*2/3) {
      ellipse(width-width/6, height-height/6, (width/3.5)-5, (height/3.5)-5);
    }
  }
  //Juego nuevo pulsando 'n' o 'N' y vuelta a la funcion Draw
  if (keyPressed) {
  if (key == 'n' || key == 'N')
 background(0); 
  return;
  }
}

