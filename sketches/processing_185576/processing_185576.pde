
int azul = 255;
int tiempo = 0;
int diametro = 55;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  azul = int(150 * (3 + sin(tiempo * 2 * PI / frameRate /1)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
   diametro = diametro + 5;
 
   if (diametro > 60) {
   
   fill(mouseX,mouseY,azul);
    ellipse(mouseX, mouseY, diametro, diametro);
  } else {
     stroke(mouseX, mouseY,azul);  // colorea borde
    ellipse(mouseX, mouseY, diametro, diametro);
  }
} 
