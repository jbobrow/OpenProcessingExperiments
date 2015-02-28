
class Gota {

  float x,y;   // Variables de ubicacion de las gotas
  float velocidadY;
 float velocidadX; // velocidad
  color c;
  float r;     // el radio de la gota
  float d = 0.5;

  Gota() {
    r = 8;                 // todas las gotas son del mismo tamano
    x = random(width);     // epezar con una ubicacion 'random' dentro del 'width'
    y = -r*4;              // comenzar mas arriba de el campo
    velocidadY = random(1,10); 
    velocidadX = random(1,7);  // elegir una velocidad random entre 1 y 5
    c = color(236, 117, 252); // Color de las gotas
  }

  // mover la gota hacia abajo
  void llover() {
    // acelerar velocidad
    y += velocidadY; 
    x += velocidadX;//empujandolas un poco hacia la derecha
  }
  
  void rebotar(){

    if(y>= height){
      velocidadY = velocidadY*-1;
    }
    
    if(x>=width || x < 0){
      velocidadX = velocidadX*-1;
    }
      
    
    
  }

 // mostrar-dibujar las gotas
  void mostrar() {
   
    strokeWeight(3);
     stroke(250, 226, 3);
     point(x, y);
    strokeWeight(d);
    stroke(117, 252, 138);
    ellipseMode(CENTER);
 fill(220, 252, 117);
     rotate(PI/3.0);
      stroke(255);
      line(x-15, y ,x+15, y);
     line(x, y-15, x, y+15);
     
    
    
  }
  
  
}

