
void setup() {
  size(700, 700);     // acá defino el tamaño
  background(200);    // fondo blanco
  mouseX=width/2;
  mouseY=height/2;
}

void draw() {
  stroke(0, 20);      // un negro transparente
  /*  nota: para hacer un comentario de más de una línea
  de largo, se puede hacer de esta forma */
             
  line(width/2, height/2, mouseX, mouseY); // línea desde el centro al mouse
}


