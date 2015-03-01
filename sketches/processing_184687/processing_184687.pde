
int blue = 100;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(500, 500);
}
 
void draw() {
  tiempo = tiempo + 1;    
  blue = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(0, 50, 75, 25);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
