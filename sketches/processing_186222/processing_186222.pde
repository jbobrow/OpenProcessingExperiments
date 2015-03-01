
int rojo = 255;
int tiempo = 0;
int diametro = 50;
void setup() {
 background(mouseX,mouseY,100);
  size(800, 800);
}
 
void draw() {
  tiempo = tiempo + 1;     
  rojo= int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20))); 
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  stroke(mouseX,50,mouseY);             
  fill(mouseX, mouseY, 50, 25);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro); 
}
