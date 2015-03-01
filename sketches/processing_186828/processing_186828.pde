
float dt = 1/60.0;

// Variable para el muestreo de la función seno
float m = QUARTER_PI;

// Variable que indica el número de tramos
int nTramos = 60;

// Lista de puntos por los que pasa el objeto
ArrayList<PVector> puntos = new ArrayList<PVector>();

PVector p1, p2;
PVector pos = new PVector();
PVector vel = new PVector();

int tramoActual = 0;

void setup() {
  size(600, 600);
  
  p1 = new PVector(width/10, 0);
  p2 = new PVector();
  
  // Bucle que genera nTramos tramos rectos
  // Se almacena la posición de cada punto
  // No se dibuja aquí
  for (int i = 0; i < nTramos; i++) {
    p1 = new PVector(p1.x, p1.y);
    p2 = new PVector(p2.x, p2.y);
    
    if (i != 0) {
      p1.x += m * 10;
      p1.y = 0.5*sin(3*p1.x/8) + 0.5*sin(3.5*p1.x/8) * 100;
    }
    
    p2.x = p1.x + m * 10;
    p2.y = 0.5*sin(3*p2.x/8) + 0.5*sin(3.5*p2.x/8) * 100;
    
    // Se guarda cada punto diferente en la lista
    puntos.add(p1);
  }
  puntos.add(p2);
  
  // Ponemos como posición inicial el primer punto
  pos = puntos.get(0);
}

void draw() {
  background(200);
  
  translate(0, height/2);
  
  // Dibujar el camino
  for (int i = 0; i < nTramos; i++) {
    line(puntos.get(i).x, puntos.get(i).y, puntos.get(i+1).x, puntos.get(i+1).y);
  }
  
  // Calcular el tramo actual
  for (int i = 0; i < nTramos; i++) {
    if (pos.x < puntos.get(i + 1).x) {
      tramoActual = i;
      break;
    }
  }
  
  // Volver al inicio una vez alcanzado el final
  if (pos.x > puntos.get(nTramos).x) {
    pos = puntos.get(0);
    tramoActual = 0;
  }
  
  // Obtener los puntos que delimitan el tramo actual
  p1 = puntos.get(tramoActual);
  p2 = puntos.get(tramoActual + 1);
  
  vel = PVector.sub(p2, p1);
  vel.normalize();
  vel.mult(100);
  
  pos = PVector.add(PVector.mult(vel, dt), pos);
  
  ellipse(pos.x, pos.y, 10, 10);
}


