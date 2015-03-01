

class Muelle { 

  // Desplazamiento
  PVector anchor = new PVector();

  // longitud de reposo y constante del muelle
  float len;
  float k = 0.52;
  
  Extremo a;
  Extremo b;

  // Constructor
  Muelle(Extremo a_, Extremo b_, int l) {
    a = a_;
    b = b_;
    len = l;
  } 

  // Calcular la fuerza del muelle y aplicarla a los extremos
  void update() {
    
    // Vectores para las fuerzas producidas
    PVector Fs_a = new PVector(0,0);
    PVector Fs_b = new PVector(0,0);
    PVector Fd_a = new PVector(0,0);
    PVector Fd_b = new PVector(0,0);
    PVector Fk_a = new PVector(0,0);
    PVector Fk_b = new PVector(0,0);
    
    anchor = PVector.sub(b.location, a.location);

    // Ley de Hooke 
        
    float mod_d = anchor.mag();
    
    float f = mod_d - len;
    
    anchor.normalize();
        
    // Extremo A
    Fs_a = PVector.mult(anchor, k*f);
    
    // Amortiguador
    Fd_a = PVector.mult(a.velocity, a.damping);
    
    // Ley de Hooke con amortiguación
    Fk_a = PVector.sub(Fs_a, Fd_a);
    
    
    // Extremo B
    Fs_b = PVector.mult(anchor, -k*f);
   
    // Amortiguador
    Fd_b = PVector.mult(b.velocity, b.damping);
    
    // Ley de Hooke con amortiguación
    Fk_b = PVector.sub(Fs_b, Fd_b);


    // Se aplica la fuerza a los extremos
    a.applyForce(Fk_a);
    b.applyForce(Fk_b);
    
  }
 
  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}

class Extremo { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector vel_ant_heun = new PVector(0,0);
  float mass = 20, dt = 0.5;
  PVector gravity;
  float Ec;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = 0;
  
  PVector dragOffset;
  boolean dragging = false;

  
  Extremo(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    gravity = new PVector(0, 9.8);
  } 

  
  void update(int mode) { 
    
    applyForce(gravity);
    
    if(mode == 0) {
      // Integrador del método de Euler explicito
      
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt;
        
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt; 
    }
    else if(mode == 1) {
      // Euler semi
      
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt;
      
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt; 
    }
    else if(mode == 2) {
      // Heun
      
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt;
      
      velocity.x = ((velocity.x+vel_ant_heun.x)/2.0) + acceleration.x * dt;
      velocity.y = ((velocity.y+vel_ant_heun.y)/2.0) + acceleration.y * dt;
      
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt;
      
      // Se guarda la velocidad anterior para el calculo siguiente
      vel_ant_heun.x = velocity.x;
      vel_ant_heun.y = velocity.y;
    }
    else if(mode == 3) {
      //bRK2
      
      velocity.x = velocity.x + acceleration.x * (dt/2.0);
      velocity.y = velocity.y + acceleration.y * (dt/2.0); 
      
      location.x = location.x + velocity.x * (dt/2.0);
      location.y = location.y + velocity.y * (dt/2.0);
      
    }
      
      // Reseteamos a 0 la acc
      acceleration.set(0,0);
      
    
    // Ec = M/2 * V^2
    Ec = 0.5 * mass * pow(velocity.mag(),2);

  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  // Draw
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175,120);
    if (dragging) {
      fill(50);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  }

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

// Práctica 1 - Muelles Eduardo Castellanos 

final int EULER = 0;
final int EULER_SEMI = 1;
final int HEUN = 2;
final int RK2 = 3;
int tipo = 1;

// Extremos 
Extremo[] vExtr = new Extremo[5];
Muelle[] vMuelles = new Muelle[4];
final int Tam_Vent_X = 630, Tam_Vent_Y = 100;
float[] vE = new float[Tam_Vent_X];

int lmuelle = 20;
int t = 0;
float max = 0;
 
void setup() {
  size(740, 600);
  // Creación de objetos
  // El tercer parametro es la longitud en reposo/equilibrio 
  for (int i = 0; i < vExtr.length; i++) {
    vExtr[i] = new Extremo(width*0.5 + i*lmuelle, lmuelle);
  }
  for (int i = 0; i < vMuelles.length; i++) {
    vMuelles[i] = new Muelle(vExtr[i], vExtr[i+1], lmuelle);
  }
}

void draw() {
  background(255); 

  for (Muelle s : vMuelles) {
    s.update();
    s.display();
  }
 
  float Etotal = 0;
  for (int i = 1; i < vExtr.length; i++){
    vExtr[i].update(tipo);
    vExtr[i].display();
    vExtr[i].drag(mouseX, mouseY);
    Etotal+= vExtr[i].Ec ;
    if(max < Etotal)
     max = Etotal;
  }
  
  vE[t] = Etotal;
  plot_func(t);
  fill(100,0,0);
  text("Energía: "+vE[t], 25, 550);
  text("Energía Máx: "+max, 25, 570);
  t = (t + 1)%Tam_Vent_X;
  
  if (tipo == 0){
    tipo = EULER;
    text("Integrador: EULER", 25, 590);
  }
  else if (tipo == 1){
    tipo = EULER_SEMI;
    text("Integrador: EULER SEMI", 25, 590);
  }
  else if (tipo == 2){
    tipo = HEUN;
    text("Integrador: HEUN", 25, 590);
  }
  else if (tipo == 3){
    tipo = RK2;
    text("Integrador: RK2",25, 590);
  }
}

void mousePressed() {
  for (Extremo b : vExtr) {
    b.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (Extremo b : vExtr) {
    b.stopDragging();
  }
}

void plot_func(int time)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(153);
  rect(5,5, Tam_Vent_X, Tam_Vent_Y);
  stroke(200, 210, 0);
  
  
  strokeWeight(1);
  stroke(255);
 
  for(int i=0;i<time;i++)
   point (i, Tam_Vent_Y - (vE[i]/max)*Tam_Vent_Y*0.9) ;
  
}
 
void keyPressed(){
  if (key == '1'){
    tipo = EULER;
  }
  else if (key == '2'){
    tipo = EULER_SEMI;
  }
  else if (key == '3'){
    tipo = HEUN;
  }
  else if (key == '4'){
    tipo = RK2;
  }
}


