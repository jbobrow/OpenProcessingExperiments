
int rojo = 100; //modificamos el grado de color
int tiempo = 5; //añadimos la fraccion de tiempo que deseamos
int diametro = 30; //modificamos el diametro del circulo
  
void setup() {
  size(600, 600); //cambiamos la medida de la pantalla
  background (60000); //cambiamos el color de fondo donde ira nuestro dibujo
}
 
void draw() {
  tiempo = tiempo + 2;     
  rojo = int(200 * (1 + sin(tiempo * 2 * PI / frameRate / 20))); 
  diametro = int(30 * (1 + sin( tiempo * 2 * PI / frameRate / 5))); // Se cambia el diametro del circulo con el paso del tiempo
   
  noStroke();             
  fill(rojo, 0, 0, 35);  // Añade un 35% a la mezcla de colores 
  
  
  ellipse(mouseX, mouseY, diametro, diametro); //el raton nos permite ir jugando con las figuras
}





