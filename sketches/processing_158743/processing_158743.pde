
// Variables generales
  boolean sobreCuadrado = false;
  int tamVen=200;


// Función que ejecuta instrucciones al inicio de la ejecución
void setup() {
  size(tamVen, tamVen);
}

// Función que se ejecuta iterativamente hasta que
// termine el programa.
void draw() {
    update(mouseX, mouseY);
   
    // Variable booleana que permite rellenar el 
    // cuadrado
    if(sobreCuadrado){
      fill(128); 
  
    } else{
      fill(255);
      }
  
  rect(0, 0, tamVen, tamVen);
}


void update(int x, int y) {
  
if (sobreFigura(1, 1, 190, 190) ) {
    
    sobreCuadrado = true;
    
  } else {
     
    sobreCuadrado = false;
  }
  
}

boolean sobreFigura(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    
    return true;
  
  } else {
  
    return false;
  }
}

/* Referencia de apoyo
http://processing.org/examples/rollover.html
http://www.processing.org/tutorials/color/
*/
