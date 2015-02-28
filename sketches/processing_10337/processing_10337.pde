
/*
PROYECTO 01 SESION 3 : Controlando nuestro codigp
 
 Título: Lineas a mouse
 Nombre: Juan Andres Castaño
 Fecha:  03/06/2010
 Lugar: Barcelona
 Objetivo: Realizar un Sketch que tenga interaccion con el mouse
 Realizar un sketch que 
 
 -interaccione de alguna manera con el  mouse
 
 - que tenga eventos de teclado
 
 - El Sketch tiene que tener una sentencia condicional
 
 */
//


//Establecer las medidas del fondo y el color
void setup() {
  size(800,800);
 smooth();
  background(255,255,255);
}
// Se dibujan lineas a partir de la posicion del mouse, hasta los puntos x y y.

void draw() {
  //background(0,0,0); //Activar en caso de que no se quiera mantener la linea dibujada anteriormente
  smooth();
  stroke(random (255),random(255),random(255)); //Cambiar color del trazo de linea
  for(int y=0; y<=800; y+=200){
    for(int x=0; x<=800; x+=200){
      line(y,x,mouseX,mouseY);
    }
  }
}

void keyPressed() {
  switch(key) {
  case 'q': 
    println("endRecord");
    endRecord();
    break;
  case 's': 
    println("BEGIN RECORD");
    beginRecord(PDF, "lineas_y_mouse.pdf"); 
    break;
  }
}

