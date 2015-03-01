
// ALINA HONHALA - SIMULADOR COCHE //

//Posición Euler
PVector p_eu = new PVector(0,0);

//Potencia, Perdida de energía, Cte rozamiento, diferencial dt
float P = 100;
float Perd; // P = F*v = -k*v*v
float K = 0.1;
float dt = 0.2;

int ventanaX = 980, ventanaY = 100;
float [] aux = new float[ventanaX];
float max;
int t = 0;

//Objeto coche(masa,vel, energia cinetica)
Coche coche = new Coche(1,10,50);

void setup()
{
  size(1000,600);
  max = 0;
  smooth();
}

void draw()
{
  background(0);
  fill(55,224,243);
  textSize(20);
  text("Pulsa 'ESPACIO' para comenzar otra vez.", 20, 60);
  text("Pulsa 'a' para acelerar.", 20, 90);
  
  //Mediante euler semi-implícito (primero cálculo de la velocidad),
  //calculamos la posición en el eje 'x' del coche
  coche.updateVelo();
  p_eu.x = p_eu.x + coche.vel*dt;
  
  if(max < coche.vel)
     max = coche.vel;
     
  aux[t] = coche.vel;
  plot_func(t);
  t = (t+1) % ventanaX;
  
  coche.dibujoCoche();
  
  if(keyPressed)
  {
    if(key== 'a')
      coche.AplicarPotencia();
  }

}

void plot_func(int time)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(0,145,161);
  rectMode(CORNER);
  rect(5,height-105, ventanaX, ventanaY);
  stroke(200, 210, 0);
   
   
  strokeWeight(1);
  stroke(255);
  
  for(int i=8;i<time;i++)
   point (i, height-8 - (aux[i]/max)*ventanaY*0.9) ;
   
 }

void keyPressed(){
  if(key==' '){
    t = 0;
    coche = new Coche(1,10,50);
    aux = new float[ventanaX];
    p_eu = new PVector(0,0);
    setup();
  }
}

class Coche
{
  float masa, vel, energia;
  
  Coche(float m, float v, float en)
  {
    masa = m;
    vel = v;
    energia = en;
  }
  
  //Actualizar Energia Cinética
  void AplicarPotencia()
  {
    energia += P * dt;
  }
  
  //Actualizar la velocidad
  void updateVelo()
  {
    vel = sqrt(2*energia/masa);
    Perd = -K*vel*vel;
    energia = energia + (Perd*dt);
    //Cuanta más velocidad, más energía pierde y cuando la energía
    //llega a cero, no avanza el coche    
  }
  
  void dibujoCoche()
  {
    pushMatrix();
    translate(p_eu.x, 0);
    noStroke();
    fill(55,224,243);
    ellipse(120,250, 25, 25);
    ellipse(180,250, 25, 25);
    rect(100, 200, 100, 50);
    popMatrix();
  
  }
}


