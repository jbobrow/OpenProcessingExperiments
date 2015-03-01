
float dt = 1/60.0;

// Radio
float r = 100.0;

// Ángulo
float ang = -HALF_PI;

PVector p1, p2;
PVector pos = new PVector(-900, -900);
PVector vel = new PVector();

// Lista de colores que podrán tener las burbujas
color[] colores = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};

void setup() {
  size(600, 600);
  
  p1 = new PVector(0, 0);
  p2 = new PVector();
}

void draw() {
  background(200);
  
  translate(width/2, height);
  
  p2.x = r * cos(ang);
  p2.y = r * sin(ang);
  
  stroke(0);
  strokeWeight(5);
  line(p1.x, p1.y, p2.x, p2.y);
  
  pos = PVector.add(PVector.mult(vel, dt), pos);
  
  noStroke();
  ellipse(pos.x, pos.y, 40, 40);
}

void keyPressed() {
  // Mover en sentido antihorario
  if (keyCode == LEFT) {
    // Impedir que se apunte hacia abajo
    if (ang > -PI ) {
      ang -= 0.01;
    }
  }
  
  // Mover en sentido horario
  if (keyCode == RIGHT) {
    // Impedir que se apunte hacia abajo
    if (ang < 0) {
      ang += 0.01;
    }
  }
  
  // Lanzar burbuja
  if (keyCode == UP || key == ' ') {
    // Impedir lanzar una bola si aún hay otra en pantalla
    if (pos.x < 0-width/2 || pos.x > width/2 || pos.y < -height) {
      pos = new PVector(p2.x, p2.y);
      
      // Se selecciona un color aleatoriamente
      fill(colores[(int) random(colores.length)]);
      
      vel = PVector.sub(p2, p1);
      vel.normalize();
      vel.mult(200);
    }
  }
}


