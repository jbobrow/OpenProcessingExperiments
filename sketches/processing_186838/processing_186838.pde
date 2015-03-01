
float dt = 1/60.0;

// Radio inicial y radio
float rIni = 200.0;
float r;

// Frecuencia
float f = 0.5;

// Vueltas que da la espiral antes de llegar al centro
float vueltas = 3.0;

// Velocidad angular
float w = 0.0;

// Tiempo
float t;

PVector pos;

void setup() {
  size(600, 600);
  background(200);
  
  translate(width/2, height/2);
  
  // Ejes
  stroke(100);
  line(0, 0-rIni-50, 0, 0+rIni+50);
  line(0-rIni-50, 0, 0+rIni+50, 0);
  
  pos = new PVector(0, 0);
  r = rIni;
  t = 0.0;
}

void draw() {
  // Cuando llega a fin(0, 0), volver a empezar
  if (r <= 0) {
    background(200);
  
    translate(width/2, height/2);
    
    // Ejes
    stroke(100);
    line(0, 0-rIni-50, 0, 0+rIni+50);
    line(0-rIni-50, 0, 0+rIni+50, 0);
    
    pos = new PVector(0, 0);
    r = rIni;
    t = 0.0-dt;
  }
  
  translate(width/2, height/2);
  
  w = TWO_PI * f;
  
  r -= rIni/vueltas * f * dt;
  
  pos.x = r * cos(w * t);
  pos.y = r * sin(w * t);
  
  fill(0);
  noStroke();
  ellipse(pos.x, pos.y, 10, 10);
  
  t += dt;
}

void keyPressed() {
  // Convertir a float el código de la tecla.
  // Se le resta 48 debido a la codificación
  // de las teclas que usa JavaScript
  int num = parseInt(key) - 48;
  
  // Comprobar si se ha pulsado un número
  if (num >= 1 && num <= 9) {
    vueltas = num;
    r = 0;
  }
}


