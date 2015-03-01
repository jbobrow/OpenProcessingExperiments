
//Ejercicio: Plano inclinado

float dt = 0.1;
float m = 2.0;
float ang = 25;
float K = 0.1;
float g = -9.8;

//Vectores Euler:
PVector posE = new PVector(0,0);
PVector vE = new PVector(0,0);
PVector aE = new PVector(0,0);

//Vectores Heun:
PVector posH = new PVector(0,0);
PVector vH = new PVector(0,0);
PVector vH0 = new PVector(0,0);
PVector aH = new PVector(0,0);

//Vectores Runge-Kutta2:
PVector posRK = new PVector(0,0);
PVector vRK = new PVector(0,0);
PVector vRKm = new PVector(0,0);
PVector aRK = new PVector(0,0);
PVector aRKm = new PVector(0,0);

void setup(){
  size(670,480);
  background(0);
  smooth();
  
  fill(255);
  text("METODOS DE INTEGRACION", width/10, height/7);
  fill(255,255,0);
  text("Euler", width/10, height/7+height*0.03);
  fill(0,255,255);
  text("Heun", width/10, height/7+height*0.06);
  fill(255,0,255);
  text("Runge-Kutta 2", width/10, height/7+height*0.09);
  
}

PVector Fuerzas(PVector V) {
  
  // Fuerza tangencial
  float fTang = 0;
  
  //Vectores de fuerzas
  PVector Ftan = new PVector(0,0);//F tangencial
  PVector Ft = new PVector(0,0);//F total
  PVector Fr = new PVector(0,0);// F rozamiento
  PVector acc = new PVector(0,0);//aceleracion
  
  //Módulo fuerza tangencial
  fTang = g * m * sin(radians(ang));

  Ftan.x = fTang*cos(radians(ang));  
  Ftan.y = fTang*sin(radians(ang));
  
  //Rozamiento
  Fr.x = -K * V.x;
  Fr.y = -K * V.y;
  
  //Suma de fuerzas
  Ft.x = Ftan.x + Fr.x;
  Ft.y = Ftan.y + Fr.y;
  
  //Aceleracion
  acc.x = Ft.x / m;
  acc.y = Ft.y / m;
  
  return acc;
}

void keyPressed() {
  // Al pulsar la tecla x se aumentan los grados de inclinación del plano
  if(key == 'x') {
    ang += 5;
    aE = new PVector(0,0);
    vE = new PVector(0,0);
    posE = new PVector(0,0);
    aH = new PVector(0,0);
    vH = new PVector(0,0);
    vH0 = new PVector(0,0);
    posH = new PVector(0,0);
    aRK = new PVector(0,0);
    vRK = new PVector(0,0);
    vRKm = new PVector(0,0);
    posRK = new PVector(0,0);
    aRKm = new PVector(0,0);
  }
  // Al pulsar la tecla x se reducen los grados de inclinación del plano
  else if(key == 'z') {
    ang -= 5;
    aE = new PVector(0,0);
    vE = new PVector(0,0);
    posE = new PVector(0,0);
    aH = new PVector(0,0);
    vH = new PVector(0,0);
    vH0 = new PVector(0,0);
    posH = new PVector(0,0);
    aRK = new PVector(0,0);
    vRK = new PVector(0,0);
    vRKm = new PVector(0,0);
    posRK = new PVector(0,0);
    aRKm = new PVector(0,0);
  }
}

void draw(){
   background(0);
   
  fill(255);
  text("METODOS DE INTEGRACION", width/10, height/7);
  fill(255,255,0);
  text("Euler", width/10, height/7+height*0.03);
  fill(0,255,255);
  text("Heun", width/10, height/7+height*0.06);
  fill(255,0,255);
  text("Runge-Kutta 2", width/10, height/7+height*0.09);
  
  //Euler (Calculamos pos mediante v actual y calculamos v siguiente
  aE = Fuerzas(aE);
  posE.x += vE.x*dt;
  posE.y += vE.y*dt;
  
  vE.x += aE.x*dt;
  vE.y += aE.y*dt;

 
  //Heun
  aH = Fuerzas(vH);
  
  posH.x += (vH.x + vH0.x)/2.0*dt;
  posH.y += (vH.y + vH0.y)/2.0*dt;
  
  vH.x += aH.x*dt;
  vH.y += aH.y*dt;
  
  vH0.x = vH.x;//Actualiza vel anterior
  vH0.y = vH.y;
  

  //RK2
  aRK = Fuerzas(vRK);
  
  vRKm.x = vRK.x + aRK.x * (dt/2.0);
  vRKm.y = vRK.y + aRK.y * (dt/2.0);
      
  vRK.x += aRK.x * dt;
  vRK.y += aRK.y * dt;
      
  // Se calcula la velocidad con la acc en el punto medio entre las 
  // posiciones actual y siguiente
  aRKm = Fuerzas(vRKm);
  
  posRK.x = posRK.x + vRKm.x * dt; 
  posRK.y = posRK.y + vRKm.y * dt;
  
  //Dibujar
  //Plano
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(-ang));//inclinacion del plano
    stroke(255);
    line(-1000,9,1000,9);
    
  popMatrix();
  
  //Euler
  pushMatrix();
    translate(width/2,height/2);
    translate(posE.x, -posE.y);
    fill(255,255,0);
    noStroke();
    rotate(radians(-ang));
    rect(0,0,20,10);
  popMatrix();
  
  //Heun
  pushMatrix();
    translate(width/2,height/2);
    fill(0, 255,255);
    translate(posH.x, -posH.y);
    rotate(radians(-ang));
    rect(0, 0, 20,10);
  popMatrix();
  
  //RK2
  pushMatrix();
    translate(width/2,height/2);
    fill(255,0,255);
    translate(posRK.x, -posRK.y);
    rotate(radians(-ang));
    rect(0, 0, 20, 10);
  popMatrix();
}






