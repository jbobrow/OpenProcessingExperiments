
float dt = 1/60.0;

// Variable para el muestreo de la función seno
float m = PI * 6.9;

// Variable que indica el número de tramos
int nTramos = 22;

// Lista de puntos por los que pasa el objeto
ArrayList<PVector> puntos = new ArrayList<PVector>();

PVector p1, p2;
PVector pos = new PVector();
PVector vel = new PVector();
PVector ac = new PVector();

float pendiente;

int tramoActual = -1;

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
      p1.x += m;
      p1.y = sin(p1.x);
    }
    
    p2.x = p1.x + m+2;
    p2.y = sin(p2.x);
    
    p1.y *= 100;
    p2.y *= 100;
    
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
  
  // Volver al inicio una vez alcanzado el final
  if (pos.x > puntos.get(nTramos).x) {
    pos = puntos.get(0);
    tramoActual = -1;
  }
  
  // Calcular el tramo actual
  for (int i = 0; i < nTramos; i++) {
    if (pos.x < puntos.get(i + 1).x) {
      // Si estamos cambiando de tramo
      if (tramoActual != i) {
        tramoActual = i;
        
        p1 = puntos.get(tramoActual);
        p2 = puntos.get(tramoActual + 1);
        
        vel = PVector.sub(p2, p1);
        vel.normalize();
        vel.mult(30);
        ac = PVector.div(vel, 1);
        pendiente = vel.y/vel.x;
      }      
      break;
    }
  }
  
  vel = PVector.add(PVector.mult(ac, dt), vel);
  
  // Para un comportamiento más realista,
  // modificar la velocidad según la pendiente.
  // Más despacio al subir que al bajar
  if (pendiente < 0) {
    // Sube
    vel = PVector.div(vel, 1.02);
  }
  
  pos = PVector.add(PVector.mult(vel, dt), pos);
  
  ellipse(pos.x, pos.y, 10, 10);
}


