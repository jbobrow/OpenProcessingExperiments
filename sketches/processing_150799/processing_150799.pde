
// Práctica 1 de Simulación
// Autor: Pablo Casanova Salas y Juan Carlos Leal de la Rosa
// Curso 13-14

int MODE= 4;
// Extremos 
Extremo[] vExtr = new Extremo[5];
Muelle[] vMuelles = new Muelle[4];
final int Tam_Vent_X = 790, Tam_Vent_Y = 100;
float[] vE = new float[Tam_Vent_X];
  
  // Arbitrary damping to simulate friction / drag 
float damping = 0.0;
int lmuelle = 20;
int t = 0;
float max = 0;
 
void setup() {
  size(800, 500);
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
    //vExtr[i].update(EULER);
    //vExtr[i].update(EULER_SEMI);
    //vExtr[i].update(HEUN);
    vExtr[i].update(MODE);
    vExtr[i].display();
    vExtr[i].drag(mouseX, mouseY);
    Etotal+= vExtr[i].Ec ;
    if(max < Etotal)
     max = Etotal;
  }
  
  vE[t] = Etotal;
  plot_func(t);
  text("Max: "+max+" Energía: "+vE[t], 10, 490);
  t = (t + 1)%Tam_Vent_X;
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
void keyPressed() {
  if (key== '1')
    MODE=1;
  if (key== '2')
    MODE=2;
  if (key== '3')
    MODE=3;
  if (key== '4')
    MODE=4;
  if (key=='r')
  {
      for (int i = 0; i < vExtr.length; i++) {
    vExtr[i] = new Extremo(width*0.5 + i*lmuelle, lmuelle);
  }
  for (int i = 0; i < vMuelles.length; i++) {
    vMuelles[i] = new Muelle(vExtr[i], vExtr[i+1], lmuelle);
  }
  }
      if (key=='k')
    {
      if(damping<=0)
        damping=0.2;
      else
        damping=0.0;
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

class Extremo { 
  PVector location;
  PVector velocity;
  PVector old_velocity;
  PVector vel_half;
  PVector acceleration;
  float mass = 20, dt = 0.5;
  PVector gravity;
  float Ec;


  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Extremo(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    old_velocity = new PVector(0,0);
    vel_half = new PVector (0,0);
    acceleration = new PVector();
    dragOffset = new PVector();
    gravity = new PVector(0, 9.8);
  } 

  // Metodos de integracion
  void update(int mode) { 
    
    applyForce(gravity);
   
   if(mode==1)
   {
     //Euler Explícito
     location.add(PVector.mult(velocity,dt));
     velocity.add(PVector.mult(acceleration,dt));
     text("Integrador: EULER", 400, 490);
   }
   
   else if(mode==2)
   {
     //Euler Semi
     velocity.add(PVector.mult(acceleration,dt));
     location.add(PVector.mult(velocity,dt));
     text("Integrador: EULER (SEMI)", 400, 490);
   }
   else if(mode==3)
   {
     //Heun 
    
     velocity.add(PVector.mult(acceleration,dt));
     location.add(PVector.mult(PVector.div(PVector.add(velocity,old_velocity),2),dt));
     old_velocity = velocity;
     text("Integrador: HEUN", 400, 490);
     
   }
   else if(mode==4)
   {
     //RK2
     
     velocity.add(PVector.mult(acceleration,dt*0.5));
    
    vel_half = PVector.add(velocity,PVector.mult(acceleration,dt*0.5));
     
    location = PVector.add(location,PVector.mult(vel_half,dt));
     
     
     text("Integrador: RK2", 400, 490);
     
   }
   acceleration= new PVector(0,0);
   float modV = velocity.mag()*velocity.mag();
   Ec = 0.5 * mass * modV;

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
    if (damping>0)
      text("Damping: ON", 700, 490);
    else
      text("Damping: OFF", 700, 490);
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


class Muelle { 

  // Desplazamiento
  PVector anchor = new PVector(0,0);
  
  //Fuerzas Muelle1 y Muelle2;
  PVector fM1 = new PVector(0,0);
  PVector fM2 = new PVector(0,0);

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
   anchor = PVector.sub(b.location,a.location);
   float modAnchor = anchor.mag();
   anchor.normalize();
   //Ley de Hooke
   fM1 = PVector.mult(anchor,k* (modAnchor-len));
   fM2 = PVector.mult(anchor,-k* (modAnchor-len));
   //Damper
   fM1.sub(PVector.mult(a.velocity,damping));
   fM2.sub(PVector.mult(b.velocity,damping));
   a.applyForce(fM1);
   b.applyForce(fM2);
   
  }


  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}



