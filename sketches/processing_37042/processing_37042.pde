
void setup() {
  size(500, 500);     // acá defino el tamaño
  background(#5F61E8);    // fondo blanco
  mouseX=width/2;
  mouseY=height/2;
}

void draw() {
  stroke(#AFD3AD, #AFD3AD);      // un negro transparente
  /*  nota: para hacer un comentario de más de una línea
  de largo, se puede hacer de esta forma */
             
  line(width/2, height/2, mouseX, mouseY); // línea desde el centro al mouse
}


