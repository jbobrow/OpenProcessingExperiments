
   int azul = 255;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;     
  azul = int(130 * (1 + sin(tiempo * 2 * PI / frameRate / 20))); 
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();             
  fill(90, 20, azul, 255);  // AÃ±ade un 50% de transparencia al color
  ellipse(mouseX, mouseY, 50, 30); 
}
