
boolean time = true;      // alternancia colores
int depth = 400;   // profundidad del rayo luminoso  
color beam;        // color del rayo
color back;        // color del fondo
PImage img;        // foto del personaje

void setup() {
  size(400, 400, P3D);
  frameRate(20);
  cursor(CROSS);      // cursor CRUZ
  noStroke();
  img = loadImage("caballe.png");
}

void draw () {
  
  // asignar colores en función de time
  // invertir el valor de time
  if( time == true ) {
    beam = #FF0000;
    back = #000000;
    time = false;
  } else if ( time == false ) {
    beam = #0000FF;
    back = #FFFFFF;
    time = true;
  }
  
  // dbujar color del fondo en función de lo anterior
  background(back);
  
  // dibujar imagen
  image(img,0,0);
  
  //asignar color del rayo en función de lo anterior
  fill(beam);
  
  // dibujar rayos
  beginShape(QUADS);
  
  //ojo izquierdo
  vertex(166, 117, 0);
  vertex(190, 117, 0);
  vertex(mouseX-45, mouseY-1, depth);
  vertex(mouseX-117, mouseY-7, depth);
  vertex(166, 117, 0);
  vertex(179, 108, 0);
  vertex(mouseX-78, mouseY-28, depth);
  vertex(mouseX-117, mouseY-7, depth);
  vertex(190, 117, 0);
  vertex(179, 108, 0);
  vertex(mouseX-78, mouseY-28, depth);
  vertex(mouseX-45, mouseY-1, depth);
  
  //ojo derecho
  vertex(220, 118, 0);
  vertex(239, 121, 0);
  vertex(mouseX+102, mouseY+11, depth);
  vertex(mouseX+45, mouseY+2, depth);
  vertex(220, 118, 0);
  vertex(234, 113, 0);
  vertex(mouseX+87, mouseY-13, depth);
  vertex(mouseX+45, mouseY+2, depth);
  vertex(239, 121, 0);
  vertex(234, 113, 0);
  vertex(mouseX+87, mouseY-13, depth);
  vertex(mouseX+102, mouseY+11, depth);
  
  endShape();
  
}


