
/*
 * Red Snake (Serpiente Roja)
 *
 * Programa para crear una serpiente roja moviendose por la pantalla
 * 
 * Paso 2:
 *  - haz que el circulo se mueva en funcion de las coordenadas del
 *    raton (usa 'mouseX' y 'mouseY')
 *
 * (c) 2013 D. Cuartielles, Arduino Verkstad, Suecia 
 */
  
void setup() {
  size(400, 400);
}
 
void draw() {
  noStroke();             
  fill(255, 0, 0);          
  ellipse(mouseX, mouseY, 30, 30); // Circulo de en funcion de las coordenadas del raton
}
