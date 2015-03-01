
/*
 * Red Snake (Serpiente Roja)
 *
 * Programa para crear una serpiente roja moviendose por la pantalla
 *
 * Paso 6:
 *  - cambia el tamaño del circulo en funcion del tiempo
 *  - al igual que antes, necesitaras crear una variable
 *    para almacenar el valor del tamaño
 *  - puedes usar la misma funcion que para el color, pero
 *    cambiando la frecuencia
 *  - para mejor efecto visual, añade transparencia al color
 *
 * (c) 2013 D. Cuartielles, Arduino Verkstad, Suecia
 */
 
int rojo = 255;
int tiempo = 0;
int diametro = 20;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;    
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));
  diametro = int(20 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Modifica el diametro del circulo con el paso del tiempo
   
  noStroke();            
  fill(rojo, 0, rojo, 50);  // Añade un 50% de transparencia al color
  ellipse(mouseX, mouseY, diametro, diametro);
}
