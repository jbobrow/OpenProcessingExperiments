
/*
 * Red Snake (Serpiente Roja)
 *
 * Programa para crear una serpiente roja moviendose por la pantalla
 * 
 * Paso 3:
 *  - almacena la intesidad de rojo en una variable
 *
 * (veras como este programa no cambia en nada frente al Paso 2)
 *
 * (c) 2013 D. Cuartielles, Arduino Verkstad, Suecia 
 */
 
int rojo = 255;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  noStroke();             
  fill(rojo, 0, 0);          
  ellipse(mouseX, mouseY, 30, 30); // Circulo de en funcion de las coordenadas del raton
}
