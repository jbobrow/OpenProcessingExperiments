
/*
 * Red Snake (Serpiente Roja)
 *
 * Programa para crear una serpiente roja moviendose por la pantalla
 *
 * Paso 5:
 *  - cambia la intensidad del rojo en funcion del tiempo
 *  - para un mejor efecto visual y evitar que el rojo cambie
 *    de forma brusca, utiliza una funcion matematica (por ejemplo
 *    el seno 'sin()')
 *  - necesitaras una variable para contar el paso del tiempo
 *  - el '20' en la ecuacion de calculo del rojo determina cada cuanto
 *    se repite un color
 *
 * Nota: la funcion 'sin()' devuelve un numero decimal ('float' o en coma flotante)
 *       y por eso hay que emplear la funcion 'int()' para poder asignarla a la
 *       variable que almacena el color rojo
 *
 * (c) 2013 D. Cuartielles, Arduino Verkstad, Suecia
 */
 
int rojo = 255;
int tiempo = 0;
  
void setup() {
  size(400, 400);
}
 
void draw() {
  tiempo = tiempo + 1;  // Incrementa el tiempo en una unidad
  rojo = int(128 * (1 + sin(tiempo * 2 * PI / frameRate / 20)));  // Cambia el rojo, repite el color cada 20s
   
  noStroke();            
  fill(rojo, 0, 0);         
  ellipse(mouseX, mouseY, 30, 30);
}
