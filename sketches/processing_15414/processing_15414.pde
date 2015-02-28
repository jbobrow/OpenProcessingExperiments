
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
   
    
    strokeWeight(d);
    stroke(117, 252, 138);
    ellipseMode(CENTER);
    fill(220, 252, 117);
      ellipse(x, y, 20, 20);
       fill(c);
      ellipse(x-15, y-15, 20, 20);
      ellipse(x+15, y+15, 20, 20);
      ellipse(x+15, y-15, 20, 20);
      ellipse(x-15, y+15, 20, 20);
       noFill();
     arc(x, y, 30, 100,0, PI/2); 
      stroke(255);
      line(x-20, y ,x+20, y);
     line(x, y-20, x, y+20);
    
  }
  
  
}

