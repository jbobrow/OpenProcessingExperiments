
// Ejercicio: Simulador coche


public float dt = 0.2;
public float P = 100;//potencia
public float Kr = 0.1;
public float Pr;// Potencia perdida por rozamiento

// Vectores para el mÃ©todo de euler, velocidad inicial y posiciÃ³n
PVector posE = new PVector(0,0);

// Objeto "coche" de la clase Coche
Coche coche;

void setup() {
  size(700,600);
  strokeWeight(2);
  smooth();
  
  coche = new Coche(1, 0, 0);
}

void draw() {
  background(150);
  //Utilizamos el metodo de Euler    
  //Calculo posicion con v actual
  posE.x = posE.x + coche.vel * dt; 
      
  //Calculo velocidad siguiente punto 
  coche.UpdateVelo();
  
  
  // Plano
  pushMatrix();
    stroke(1);
    translate(0,height/2);
    line(0,0,width,0);
  popMatrix();
      
  pushMatrix();
    translate(0,height/2);
    noStroke();
    fill(210,80,80);
    translate(posE.x,0);
    rect(-20,-10,90,-30);
    rect(10,-30,40,-40);
    
    fill(0);
    ellipse(0,-12,20,20);
    ellipse(50,-12,20,20);
 popMatrix();
 
 //Aplicamos potencia al coche
 if (keyPressed) {
   if(key == ' ') {
    coche.AplicarPotencia();
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
    Ec = P * dt;
  }

  void UpdateVelo() {
    vel = sqrt(Ec*2/masa);
    
    //Perdida por rozamiento
    Pr = -Kr*vel*vel;
    
    //A la energia cinÃ©tica le aplicamos la perdida por rozamiento
    Ec = Ec + (Pr*dt);
  }
}


