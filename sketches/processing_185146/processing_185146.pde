
int rojo = 125;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(500, 500);
}
 
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 15)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 25))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(rojo, 140, 170, 50);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, 120, 70);
}
