

int modelo = 3;
int modeloAmort = 0;
boolean amort = true;
final int NMUELLES = 4;

Extremo[] vExtr = new Extremo[NMUELLES+1];
Muelle[] vMuelles = new Muelle[NMUELLES];
final int Tam_Vent_X = 630, Tam_Vent_Y = 100;
float[] vE = new float[Tam_Vent_X]; // Energia del sistema (t)
			
int lmuelle = 60; // Longitud del muelles						
int t = 0;
float maximo = 0;


void setup() {
  size(800, 600);
  // Create objects at starting location
  // Note third argument in Spring constructor is "rest length"
  
  //Inicializa las posiciones iniciales
  for (int i = 0; i < vExtr.length; i++) {
    vExtr[i] = new Extremo(width*0.5 + i*lmuelle, height*0.3);
  }
  //Establece los objetos muelle
  for (int i = 0; i < vMuelles.length; i++) {
    vMuelles[i] = new Muelle(vExtr[i], vExtr[i+1],lmuelle);
  }
}


void keyPressed(){ 
  
  if(key == '0'){ //EULER
     modelo = 0;
     modeloAmort = 0;
     amort = true;
     setup();
  }
     
  if(key == '1'){ //EULER_SEMI
     modelo = 1;
     modeloAmort = 0;
     amort = true;
     setup();
  }
  if(key == '2'){ //RK2
     modelo = 2;
     modeloAmort = 0;
     amort = true;
     setup();
  }
     
  if(key == '3'){ //HEUN
     modelo = 3;
     modeloAmort = 0;
     amort = true;
     setup();
  }
  
  //SIN AMORTIGUACIÓN
  if(key == 'a'){ //EULER
     modelo = 0;
     modeloAmort = 4;
     amort = false;
     setup();
  }
     
  if(key == 'b'){ //EULER_SEMI
     modelo = 1;
     modeloAmort = 5;
     amort = false;
     setup();
  }
  if(key == 'c'){ //RK2
     modelo = 2;
     modeloAmort = 6;
     amort = false;
     setup();
  }
     
  if(key == 'd'){ //HEUN
     modelo = 3;
     modeloAmort = 7;
     amort = false;
     setup();
  }
}



void draw() {
  background(255); 
  float Etotal = 0;
  float vSuma = 0;
  
  for (Muelle s : vMuelles) {
    s.update();
    s.display();
  }
 
  for (int i = 1; i < vExtr.length; i++){ //el extremo 1 es fijo, por ello i=1
    //Modificamos la variable que le pasamos al update() según queramos EULER, EULER_SEMI, HEUN o RK2. Dependerá de qué tecla presionemos
    vExtr[i].update(modelo);
    vExtr[i].display();
    vExtr[i].drag(mouseX, mouseY);
    
    //Recogemos la E.Cinetica de cada extremo
    Etotal += vExtr[i].Ecinetica;
    /*vSuma += vExtr[i].velocity.mag() * vExtr[i].velocity.mag();
    Etotal = (vSuma/2) * masa;*/
    
    if(maximo < Etotal)
       maximo = Etotal;
  }
  
  vE[t] = Etotal;
  text(" Maxima Energia:" + maximo , 560, 540);
  text(" Energia: " + vE[t], 560, 560);
  
  text("Leyenda teclado:", 50, 200);
  text("-Con amortiguación-", 80, 220);
  text("'0' - Euler", 100, 240);
  text("'1' - Euler Semi", 100, 260);
  text("'2' - RK2", 100, 280);
  text("'3' - Heuler", 100, 300);
  text("-Sin amortiguación-", 80, 340);
  text("'a' - Euler", 100, 360);
  text("'b' - Euler Semi", 100, 380);
  text("'c' - RK2", 100, 400);
  text("'d' - Heun", 100, 420);

  
  if(modelo == 0){
     if(modeloAmort == 4) 
        text("Modelo EULER (Sin amortiguación)", 50, 580);
     else
        text("Modelo EULER", 50, 580);
  }
  if(modelo == 1){
     if(modeloAmort == 5) 
        text("Modelo EULER_SEMI (Sin amortiguación)", 50, 580);
     else
        text("Modelo EULER_SEMI", 50, 580);
  }
  if(modelo == 2){
    if(modeloAmort == 6)
       text("Modelo RK2 (Sin amortiguación)", 50, 580); 
    else
       text("Modelo RK2", 50, 580);
  }
  if(modelo == 3){
    if(modeloAmort == 7)
        text("Modelo HEUN (Sin amortiguación)", 50, 580);
    else
        text("Modelo HEUN", 50, 580);
  }
  
  /*if(modeloAmort == 4) 
  text("Modelo EULER (Sin amortiguación)", 50, 580);
  if((modeloAmort == 5) && (modelo == 1))
  text("Modelo EULER_SEMI (Sin amortiguación)", 50, 580);
  if((modeloAmort == 6) && (modelo == 2))
  text("Modelo RK2 (Sin amortiguación)", 50, 580);
  if((modeloAmort == 7) && (modelo == 3))
  text("Modelo HEUN (Sin amortiguación)", 50, 580);*/
  
  
 //Sacar los puntos para hacer las gráficas:
   plot_func(t, 5, 5, Tam_Vent_X, Tam_Vent_Y);
   t = (t + 1)%Tam_Vent_X;
}

//Funciones del mouse para hacer el drag:
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

void plot_func(int time, int cx, int cy, int rx, int ry)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(153);
  rect(cx, cy, rx, ry);
  stroke(200, 210, 0);
  
  
  strokeWeight(1);
  stroke(255);
 
  for(int i=0;i<time;i++)
   point (i, Tam_Vent_Y - (vE[i]/maximo)*Tam_Vent_Y*0.9) ;
  
 }

class Extremo { 
  PVector location;
  PVector velocity;
  PVector velocityMedia; //para RK2
  PVector velocityOld; //para Heun
  PVector acceleration; //Suma de tres aceleraciones
  float mass = 15, dt = 0.5;
  //Convergencia: Se demuestra que se reduce el error si los
  //incrementos de tiempo disminuyen.
  
  PVector gravity;
  float Ecinetica, Ep;
  
  // Arbitrary damping to simulate friction / drag 
  float damping;
  

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Extremo(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    velocityMedia = new PVector();
    velocityOld = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    gravity = new PVector(0, 9.8);
    
    if(amort==true)
     damping = 0.4;
    else
     damping = 0.0;
  } 

  // Métodos de integracion:: A completar por el alumn@
  void update(int mode) {
    applyForce(gravity);
    
    switch(mode)
    {
      //Caso0: Euler explicito. Primero cálculo de posicion y luego velocidad
      case 0:
      // R = R + V * d(t)
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt;
      
      // V = V + A * d(t)
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt;
      
      acceleration = new PVector(0,0); //Reseteamos las fuerzas a 0 para que no se acomulen las aceleraciones
      
      
      //Caso1: Euler semi-implicito. Primero cálculo de velocidad y luego posición
      case 1: 
      // V = V + A * d(t)
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt;
      
      // R = R + V * d(t)
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt;
      
      acceleration = new PVector(0,0);
      break;
      
      
      
      //Caso2: RK2. Derivada en pto medio
      case 2:
      /* f(pto medio) = f(xi, yi) + [f'(xi, yi)/2] * dt
         y(i+1) = yi + f(pto medio) * dt
      */  
      velocity.x = velocity.x + acceleration.x * dt;
      velocity.y = velocity.y + acceleration.y * dt;
      
      velocityMedia.x = velocity.x + (acceleration.x * dt) / 2.0;
      velocityMedia.y = velocity.y + (acceleration.y * dt) / 2.0;
      
      location.x = location.x + ((velocity.x+velocityMedia.x)/2.0) * dt;
      location.y = location.y + ((velocity.y+velocityMedia.y)/2.0) * dt;
      
      acceleration = new PVector(0,0);
      break;
      
      
      
      //Caso3: Heun. yº(i+1) = yi + f(xi, yi)*dt
      case 3:
      /*yº(i+1) = yi + Pendiente *dt
        Pendiente = [f(xi,yi) + f(xi+1. yi+1)] / 2
      */
      
      //PVector aux=acceleration;
      //aux.mult(dt);
      //velocity.add(acceleration*dt)
      velocity.x = ((velocityOld.x + velocity.x) / 2.0) + acceleration.x * dt;
      velocity.y = ((velocityOld.y + velocity.y) / 2.0) + acceleration.y * dt;
      
      location.x = location.x + velocity.x * dt;
      location.y = location.y + velocity.y * dt;
      
      velocityOld.x = velocity.x; //Guardamos la velocidad anterior
      velocityOld.y = velocity.y;
      
      acceleration = new PVector(0,0);
      break;
    
    }
    // Ec = 1/2 * (m * v * v)
    Ecinetica = (0.5) * mass * pow(velocity.mag(),2);
    
    
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) { //Carga en la aceleracion, la aceleracion correspondiente a cada una de las fuerzas
    PVector f = force.get();
    f.div(mass); //Divide la fuerza entre la masa = a
    acceleration.add(f);
  }


  // Draw 
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(255,0,0);
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


class Muelle { 

  // Location (direccion = x1 - x0, y1 - y0)
  PVector anchor = new PVector();

  // Rest length and spring constant
  float len;
  float k = 0.52; //elongacion
  float mod;
  
  Extremo a;
  Extremo b;

  // Constructor
  Muelle(Extremo a_, Extremo b_, int l) {
    a = a_;
    b = b_;
    len = l; //Longitud de reposo
  } 

  // Calcular la fuerza del muelle: A completar por el alumn@
  void update() { 

    anchor = PVector.sub(b.location, a.location);
    mod = anchor.mag();
    anchor.normalize();
    
    /*
    Fuerza proporcional al desplazamiento (ley de Hooke) -sin amortiguación:
    ->Fk = ks*(Lactual − Lreposo)
    Fk = k * anchor * (mod - len);
    
    Modelos con amortiguación (damper):
    ->Fk_amort = Fk − kd*vmuelle
    */
     PVector FuerzaMuelleA=new PVector(0,0);
     PVector FuerzaMuelleB=new PVector(0,0);
     
     PVector Fk = PVector.mult(anchor, k * (mod - len));
     PVector Fk_amort = PVector.mult(a.velocity, a.damping);
     FuerzaMuelleA = PVector.sub(Fk, Fk_amort);
     //FuerzaMuelleA = PVector.mult(anchor, k * (mod - len)) - PVector.mult(a.damping, a.velocity);
   
     PVector FkB = PVector.mult(anchor, (-k) * (mod - len));
     PVector Fk_amortB = PVector.mult(b.velocity, b.damping);
     FuerzaMuelleB = PVector.sub(FkB, Fk_amortB);
     //FuerzaMuelleB = PVector.mult(anchor, (-k) * (mod - len)) - PVector.mult(a.damping, a.velocity);
    
     a.applyForce(FuerzaMuelleA);
     b.applyForce(FuerzaMuelleB);
    
    
  }


  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}



