
// Ejercicio: Simulador de coche
//
// Controles
// Al pulsar la barra espaceadora se aplica una potencia
//

// Tiempo transcurrido
float tiempo;

// Paso del tiempo
float dt = 0.2;

// Potencia del coche
float P = 25;

// Constante de rozamiento
float Kr = 0.6;

// Pérdida de energía por el rozamiento
float Pr;

// Vector para la posición del coche
PVector pos_coche = new PVector(0,0);

// Objeto "coche" de la clase Coche
Coche coche;

// Objeto "grafica" de la clase Grafica para representar la curva velocidad - tiempo
Grafica grafica;

void setup() {
  size(700,600);
  stroke(0,0,0);
  strokeWeight(2);
  smooth();
  
  // Coche con parametros masa, velocidad y Energía Cinética
  coche = new Coche(5, 0, 0);
  
  // Se inicia el objeto de la clase grafica para representar la curva velocidad - tiempo
  grafica = new Grafica();
}

void draw() {
  background(160);
  
  fill(70,70,70);
  text("Al pulsar la barra espaceadora se aplica una potencia", 10, 320);
  
  text("Potencia: "+P, 10, 15);
  text("Constante de rozamiento (Kr): "+Kr, 10, 30);
  text("Posicion del coche: "+pos_coche.x, 10, 45);
  text("Velocidad del coche: "+coche.vel, 300, 15);
  text("Masa del coche: "+coche.masa, 300, 30);
  text("Energía cinética: "+coche.Ec, 300, 45);
  
  // Tiempo transcurrido en segundos desde el inicio del simulador
  tiempo = millis()/1000.0;
  
  text("Gráfica velocidad - tiempo", 10, 400);
  text("Tiempo: "+ tiempo, 10, 415);
  
  // Calculo de la velocidad para el siguiente punto 
  coche.UpdateVelo();
  
  // Calculo de la posición utilizando la velocidad actual
  pos_coche.x = pos_coche.x + coche.vel * dt; 
  
  // Plano
  pushMatrix();
    translate(0,height/2);
    line(0,0,width,0);
  popMatrix();
    
  // Coche  
  pushMatrix();
    translate(0,height/2);
    fill(210,80,80);
    translate(pos_coche.x,0);
    line(-20,-10,65,-10);
    line(-20,-38,56,-38);
    line(-20,-10,-20,-60);
    line(-20,-60,50,-60);
    line(50,-60,65,-10);
    ellipse(0,-12,20,20);
    ellipse(48,-12,20,20);
  popMatrix();
  
  // Se inserta un punto para pintar la curva velocidad - tiempo
  grafica.InsertarPunto(tiempo*100, -coche.vel*20);
  
  pushMatrix();
    translate(-100,height-15);
    // Se dibuja la gráfica velocidad - tiempo
    grafica.Dibujar();
  popMatrix();
  
 // Al pulsar la barra espaceadora se aplica una potencia
 if (keyPressed) {
   if(key == ' ') {
    coche.AplicarPotencia();
    
    fill(70,70,70);
    text("Acelerador pulsado", 580, 15);
  }
 }
}
class Coche {
  float masa;
  float vel;
  float Ec;
  
  Coche(float m, float v, float e) {
    masa = m;
    vel = v;
    Ec = e;
  }
  
  void AplicarPotencia() {
    Ec += P * dt;
  }

  void UpdateVelo() {
    vel = sqrt(2*Ec/masa);
    
    // Se calcula la pérdida de energía producida por el rozamiento
    // Fuerza de rozamiento = Fr = -Kr * vel
    // Pr = Fr * vel = -Kr * vel * vel
    Pr = -Kr * vel * vel;
    
    // Como Ec = P * dt, la energía producida por el rozamiento sera "Pr * dt"
    // Se aplica la pérdida de energía
    Ec = Ec + (Pr * dt);
  }
}
class Grafica {
 
  // Array de PVector's para almacenar puntos insertados
  PVector[] puntos = new PVector [500];
  
  // Total de puntos almacenados en el PVector
  int n;
  
  // Variable para refrescar el reptintado siempre en las coordenadas 
  // visibles por pantalla
  int x_max;
  
  Grafica() {
    n = 0;
    x_max = width+100;
  }
  
  void InsertarPunto(float x, float y) {
 
    // Si se ha alcanzado el final de la ventana se reinicia el PVector y se
    // vuelve a pintar dentro de la ventana de la aplicación
    if (x > x_max) {
      x_max += width+100;
      n = 0;
      PVector[] puntos = new PVector [1000];
    }
    
    // La primera vez que se pinta
    if (x < width+100) {
      puntos[n] = new PVector(x, y);
      n++;
    }
    // Las siguientes iteraciones
    else if (x < x_max){
      x -= x_max - (width+200);
      puntos[n] = new PVector(x, y);
      n++;
    }
  }

  void Dibujar() {
    noFill(); 
    stroke(0); 
    
    beginShape(); 
      for(int i = 0; i < n; i++) {
        curveVertex(puntos[i].x, puntos[i].y); 
      }
    endShape(); 
  }
}


