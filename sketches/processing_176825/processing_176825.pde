
float angulo = 0;

void setup() {
  size(800, 800);
  strokeWeight(9); 
 
}

void draw() {
  
  background(0);
  noFill();
  // con el rectMode se dibujan los cuadrados en el centro
  rectMode(CENTER);
 
  // Establecer el modo de color HSB 
  // Ahora en adelante se especifica en el tono(hue), la saturación(saturation) y el brillo(brightness)
  colorMode(HSB);
  // con translate movemos el origen hasta el centro de la ventana
  translate(width/2,height/2);
  
  int contador = 0;
  // veces que el bucle ronda 
  while(contador<60) {
    
    //con mouseX y mouseY hacemos que cuando se pase el ratón por encima, cambie de color
    //añadiendo +contador en stroke hacemos que cuanto mas al centro vaya cambiando de color
   stroke(mouseX+contador,mouseY,255);
    
   
    triangle(-190, -295, 0, 0, -216, -175);
    triangle(190, 295, 0, 0, 216, 175);
    rect(0,0,800,800);
    ellipse(260,260,100,100);
    ellipse(-260,-260,100,100);
    
    // con rotate hacemos girar el sistema de coordenadas por el valor almacenada en la variable angulo
    rotate(radians(angulo));
    // con scale aumenta o disminuye el tamaño de una forma de expansión y contracción de los vértices.
    scale(0.90,0.90);
     
    // se le suma uno al contador
    contador++;
  }
 
 // Aumentar el ángulo 0,1 grados cada figula 
 // Es lo que crea la animación
  angulo += 0.1; 
 
}



