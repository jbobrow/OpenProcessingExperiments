
int rojo = 255;
int tiempo = 0;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;  // Incrementa el tiempo en una unidad
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));  // Cambia el rojo, repite el color cada 20s
   
  noStroke();             
  fill(rojo, 255, 50);          
  ellipse(mouseX, mouseY, 30, 30); 
}
