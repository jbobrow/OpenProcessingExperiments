
final int AEULER_semi = 0;
final int AEULER=1;
final int AHEUN= 2;
final int ARK2 = 3;
float k = 0.52;//constante
int integrador=0;
//float damping;

// Extremos 
Extremo[] vExtr = new Extremo[5];
Muelle[] vMuelles = new Muelle[4];
final int Tam_Vent_X = 460, Tam_Vent_Y = 100;
float[] vE = new float[Tam_Vent_X];

int lmuelle = 20;
int t = 0;
float max = 0;
 
void setup() {
  size(460, 500);
  // CreaciÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¿Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³n de objetos
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
    //if(i!=vExtr.length-1){
    vExtr[i].update(integrador);
   //}
    vExtr[i].display();
    vExtr[i].drag(mouseX, mouseY);
    Etotal+= vExtr[i].Ec ;
    if(max < Etotal)
     max = Etotal;
  }
  
  vE[t] = Etotal;
  plot_func(t);
  text("Max: "+max+" Energia: "+vE[t], 10, height-5);
  t = (t + 1)%Tam_Vent_X;
  
  
  println("Max: "+max+" Energia: "+vE[t]);
  text("Presiona e para intergrador EULER",width-240, height-200);
  text("Presiona s para intergrador EULER-SEMI",width-240, height-170);
  text("Presiona h para intergrador HEUN",width-240, height-140);
  text("Presiona r para intergrador RK2",width-240, height-110);
  text("Incrementar (pulsa (+)) y decrementat (pulsa (-)) k " + k,10 ,height-20);
   if (integrador == 0){
    integrador = AEULER_semi;
    text("Integrador: EULER-SEMI", width-150, height-40);
  }
  else if (integrador == 1){
    integrador = AEULER;
    text("Integrador: EULER", width-150, height-40);
  }
  else if (integrador == 2){
    integrador = AHEUN;
    text("Integrador: HEUN", width-150, height-40);
  }
  else if (integrador == 3){
    integrador = ARK2;
    text("Integrador: RK2", width-150, height-40);
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
  if (key == 's'){
    integrador = 0; //EULER_semi
  }
  else if (key == 'e'){
   integrador  = 1; //EULER
  }
  else if (key == 'h'){
    integrador = 2; //HEUN
  }
  else if (key == 'r'){
    integrador = 3; //RK2
    
  }
   else if (key == '+'){
    k+=0.1;
    
  }
   else if (key == '-'){
     k-=0.1;
    
  }
  
 }


class Extremo {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 20, dt = 0.5;
  PVector gravity;
  float Ec;
  float velocityAnt;
  float Vmedia;
    
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.95;
  //float damping = 0;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Extremo(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
    gravity = new PVector(0, 9.8);
  } 

  // Metodos de integracion
  //donde tenemos que integrar
  void update(int mode) { 
    
    applyForce(gravity);
    
    if(mode==0){
      //EULER IMPLICITO/ semi  
      //primero vel y luego pos
    //velocidad
    velocity.y= velocity.y+acceleration.y*dt; 
    velocity.x= velocity.x+acceleration.x*dt;
    //Posicion
    location.y= location.y+velocity.y*dt;
    location.x= location.x+velocity.x*dt;
    
    acceleration = new PVector(0,0);
    }
    else  if(mode==1){
      //EULER Explicito 
      //explicito posicion velocidad
        //Posicion
    location.y= location.y+velocity.y*dt;
    location.x= location.x+velocity.x*dt;
    //velocidad
    velocity.y= velocity.y+acceleration.y*dt; 
    velocity.x= velocity.x+acceleration.x*dt;

    
    acceleration = new PVector(0,0);
    }
  else if( mode==2){
   //HEUN
    PVector velocityAnt = new PVector(0,0);
   //velocidad 
   velocity.x= velocity.x+acceleration.x*dt;
   velocity.y= velocity.y+acceleration.y*dt;
   //posicion
   location.x=location.x+((velocity.x+velocityAnt.x)/2)*dt;
   location.y=location.y+((velocity.y+velocityAnt.y)/2)*dt;
   //velocidad anterior
   velocityAnt.x=velocity.x;
   velocityAnt.y=velocity.y;
   
   acceleration = new PVector(0,0);
  }
    
    
   else if(mode==3){
     
     PVector Vmedia= new PVector(0,0);
     //RK2
    velocity.x= velocity.x+acceleration.x*dt; 
    velocity.y= velocity.y+acceleration.y*dt; 
    Vmedia.x= velocity.x+(dt/2);
    Vmedia.y= velocity.y+(dt/2);
    //Posicion
    location.x= location.x+((velocity.x+Vmedia.x)/2)*dt;
    location.y= location.y+((velocity.y+Vmedia.y)/2)*dt;
    acceleration = new PVector(0,0);
   }
        //EC=0.5 * Mass * Vel^2
      Ec=0.5*mass*pow(velocity.mag(),2);
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
    text("incremento de tiempo= "+dt, width-240, height-80);
    text("damping= "+damping, width-240, height-60);
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



class Muelle { 

  // Desplazamiento
  PVector anchor= new PVector();
  
  // longitud de reposo y constante del muelle
  float len;//reposo
  
  
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
    
    PVector F_muelle= new PVector(0,0);
    PVector F_muelle_k= new PVector(0,0); 
    PVector F_muelle1= new PVector(0,0);
    PVector F_muelle1_k= new PVector(0,0); 
    anchor= PVector.sub(b.location,a.location);
    
    //Ley HOOKE
    
    float mod_anchor= anchor.mag();
    
    float longi = mod_anchor-len;
    
    anchor.normalize();
    
    float muell_a= k*longi;
    float muell_b= -k*longi;
    //Extremo en A
    F_muelle= PVector.mult(anchor,muell_a);
    //Ley con amortiguador
    F_muelle_k=PVector.sub(F_muelle, PVector.mult(a.velocity,a.damping));
    
    //Extremo en A
    F_muelle1= PVector.mult(anchor,muell_b);
    //Ley con amortiguador
    F_muelle1_k=PVector.sub(F_muelle1, PVector.mult(b.velocity,b.damping));
    

    
    a.applyForce(F_muelle_k);
    b.applyForce(F_muelle1_k);
   
    
  }


  void display() {
    strokeWeight(2);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}
