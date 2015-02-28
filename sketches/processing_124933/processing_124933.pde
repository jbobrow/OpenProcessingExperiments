
/*En este ejercicio se dibujan unos puntos blancos y se dibuja un rectangulo
  que va haciendo desaparecer los puntos */



void setup() {
  size(400,300);
  background(0);
  noStroke();
}

void draw() {
  
  fill(0, 10);//0 es el color y al poner 10 hace el efecto de que desaparecen los puntos poco a poco
  rect(0, 0, width, height);
  
  fill(255);
  ellipse(random(width), random(height), 3, 3);
}



