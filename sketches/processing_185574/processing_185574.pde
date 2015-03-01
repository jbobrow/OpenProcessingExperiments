
int rojo = 255;
int tiempo = 0;
int diametro = 50;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(140 * (3 + sin(tiempo * 2 * PI / frameRate /1))); // modifica el color 
  diametro = int(50 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
   diametro = diametro + 5;
 
   if (diametro > 55) { // es un programa de condición de si el diametro supera 55 pasa de ellipse a rect(cuadrado)
  
   noStroke();
   fill(rojo,mouseX,mouseY,0);
    ellipse(mouseX, mouseY, diametro, diametro); // forma circulos
  } else {
     stroke(rojo, mouseX, mouseY);  
    rect(mouseX, mouseY, diametro, diametro); // forma cuadrados 
  }
}  
