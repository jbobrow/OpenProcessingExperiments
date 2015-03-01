
// Ejercicio Vectores: Hacer un ’buble-shooter’ sencillo 
// (sólo lanzador de bolas)

// Vectores para el lanzador y para el disparo
PVector mouse;
PVector center;
PVector bala = new PVector(0,0);

// Variable para la velocidad
float v = 1.006;

// Variable para el efecto al disparar y mover el raton
float efecto = 0.03;

boolean disparo = false;

void setup() {
  size(700,600);
  stroke(190,190,0);
  strokeWeight(2);
  fill(127,80,200);
  smooth();
}

void draw() {
  background(70);
  
  // Vector con la localizacion del raton
  mouse = new PVector(mouseX,mouseY); 

  // Vector con los puntos del centro
  center = new PVector(10,590);

  // Se resta el vector center al vector mouse
  mouse.sub(center);
  
  // Se normaliza el vector
  mouse.normalize();
  
  // Se ecala para aumentar la longitud de la linea
  mouse.mult(75);
  
  // Se dibuja la linea
  translate(10,590);
  line(0,0,mouse.x,mouse.y);

  if (disparo != true) {
    bala.x = 1.5 * mouse.x;
    bala.y = 1.5 * mouse.y;
  }
  else {
    bala.x += v;
    bala.y -= v;
    
    bala.x += efecto * mouse.x;
    bala.y += efecto * mouse.y;
    
    if ( bala.x > width || -bala.y > height) {
      disparo = false;
    }
  }
  
  // Se dibuja la elipse
  ellipse(bala.x, bala.y, 50, 50);
  
  // Se dispara al pulsar el ratón, trackpad o barra espaceadora
  if(mousePressed) {
    disparo = true;
  }
}

void keyPressed() {
  // Disparo al pulsar la barra espaceadora
  if (key == ' ') {
    disparo = true;
  }
}


