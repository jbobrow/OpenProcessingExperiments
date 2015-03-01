
void setup() {
size(500,500);//He cambiado el tamaño de la ventana a uno mayor
background(255);//He movido el comando "background" aquí para poner un fondo blanco

}
 
void draw() {
  if(mousePressed == true) { 
//He quitado el comando "background" de "void draw" para que las líneas se puedan dibujar
stroke(mouseX,mouseY,255);//He cambiado el color de la líneas.
line(0, 0, mouseX, mouseY);//esta línea sale de la esquina superior izquierda

stroke(mouseX,mouseY,0);
line(500,500,mouseX,mouseY);//esta línea sale de la esquina inferior derecha

stroke(mouseY,mouseX,255);
line(500,500,mouseX,mouseY);//esta línea sale de la esquina inferior derecha

stroke(mouseY,mouseX,0);
line(500,500,mouseX,mouseY);//esta línea sale de la esquina inferior derecha

  }

}

