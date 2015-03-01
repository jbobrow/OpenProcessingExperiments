
background(100); 
int red = 0;
int tiempo = 9;
int diametro = 0;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  red = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(0,red,red,50);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
