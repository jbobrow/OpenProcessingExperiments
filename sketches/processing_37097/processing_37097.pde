
 void setup() {
size(320, 400); // acá defino el tamaño
smooth();
background(0); // fondo blanco
smooth();
fill(200, 150);
ellipse(width/2, height/2, 300, 100);   // Middle
ellipse(width/2, height/2, 100, 300);
mouseX=width/2;
mouseY=height/2;
}

void draw() {
strokeWeight(3); // Thicker
stroke(0 , 250, 500, 20); // un negro transparente
/* nota: para hacer un comentario de más de una línea
de largo, se puede hacer de esta forma */

line(width/2, height/2, mouseX, mouseY); // línea desde el centro al mouse
}
      
