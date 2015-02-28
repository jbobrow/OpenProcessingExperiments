
void setup() {
size(600, 300); // acá defino el tamaño
smooth();
background(0); // fondo blanco
mouseX=width/2;
mouseY=height/2;
}
 
void draw() {
strokeWeight(1); // Thicker
stroke(mouseX , 250, mouseY, 20); // un negro transparente
/* nota: para hacer un comentario de más de una línea
de largo, se puede hacer de esta forma */
noFill();
triangle(0, 0, 600, 0, mouseX, mouseY);
triangle(600, 300, 0, 300, mouseX, mouseY);// línea desde el centro al mouse
}


                
                
