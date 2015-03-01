
int azul = 255;
int tiempo = 0;
int diametro = 50;
int rojo = 255;
int verde = 255;
void setup() {
  size(500, 500);
}
 
void draw() {
  tiempo = tiempo + 1;    
  azul = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  verde = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(rojo,0,azul, 90);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
