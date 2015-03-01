
int azul = 100;
int tiempo = 0;
int diametro = 10;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  azul = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(10 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(0, 0, azul, 50);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
