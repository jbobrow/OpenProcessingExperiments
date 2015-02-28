

//Definiendo la Clase de nuestro Gusano.............................................

class Worms { 
  /*Se definen los ints y floats del objeto, es decir, se define si son enteros y 
   decimales.*/
  float x;  
  float y; 
  int seedX; 
  int seedY; 
  int diameter; 
  float noiseInput; 
  float amp;
  float move; 
  float dSeed; 

  Worms( int x, int y) { 
    this.x = x; 
    this.y = y; 
    seedX = (int)random(1000); 
    seedY = (int)random(1000); 
    diameter = 26; 
    noiseInput = 1.00; 
    dSeed = .01; 
    amp = (float)diameter; 
    move = 0; 
  } 

  void update() { 
    ellipse(x,y,diameter,diameter); 
    fill(mouseY, mouseX, 255, random(0,255));
    /*El color de cada elipse está definido por la posición de x e y, con el 255 de 
     base para la parte Azul y un fill aleatorio. */
    noiseInput += dSeed; 
    noiseSeed(seedX); 
    move = amp*noise(noiseInput) - (amp/2); 
    x += move; 
    noiseSeed(seedY); 
    move = amp*noise(noiseInput) - (amp/2); 
    y += move;  
  } 
}


