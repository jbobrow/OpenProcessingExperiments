
// Ejercicio: Muelle

float dt = 0.1;
float m = 2.0;
float Lreposo = 100;
float Ks = -0.6;//cte elast
float Kd = 0.3;//cte amort
float g = -9.8;

//Euler
PVector aE = new PVector(0,0);
PVector vE = new PVector(0,0);
PVector posE = new PVector(0,0);

//Heun
PVector aH = new PVector(0,0);
PVector vH = new PVector(0,0);
PVector vH0 = new PVector(0,0);
PVector posH = new PVector(0,0);

//Rugen-Kutta 2
PVector aRK = new PVector(0,0);
PVector aRKm = new PVector(0,0);
PVector vRK = new PVector(0,0);
PVector vRKm = new PVector(0,0);
PVector posRK = new PVector(0,0);
PVector posRKm = new PVector(0,0);

void setup() {
  size(640,480);
  stroke(0,0,0);
  strokeWeight(2);
  smooth();
}

float Muelle(float posM, float vM) {
  
  //Fuerzas
  PVector Fk = new PVector(0,0);
  PVector Fs = new PVector(0,0);
  PVector Fd = new PVector(0,0);
  PVector Ft = new PVector(0,0);
  
  float acc = 0.0;//aceleracion
  
  //Ley de Hooke
  Fs.y = Ks * (posM - Lreposo);  
   
  //Amortiguador
  Fd.y = Kd * vM;
    
  // Fuerza en funcion del desplazamiento con amortiguacion
  Fk.y = Fs.y - Fd.y;
   
  //Fuerza total con amortiguacion
  Ft.y = Fk.y + (m*g);
    
  // Aceleración con amortiguacion
  acc = Ft.y / m;
  
  return acc;
}

void draw() {
  background(200);
    
  fill(50);
  text("METODOS DE INTEGRACION", width/10, height/10);
  fill(255,255,0);
  text("Euler", width/10, height/10+height*0.03);
  fill(0,255,255);
  text("Heun", width/10, height/10+height*0.06);
  fill(255,0,255);
  text("Runge-Kutta 2", width/10, height/10+height*0.09);
  
  // Plano
  pushMatrix();
    translate(0,100);
    line(50,0,600,0);
  popMatrix();
 
       
  
  //Euler
  //Ley de Hooke
  aE.y = Muelle(posE.y, vE.y);
    
  posE.y = posE.y + vE.y * dt;
  vE.y = vE.y + aE.y * dt; 
  
  //Heun
  //Ley de Hooke
  aH.y = Muelle(posH.y, vH.y);
        
  vH.y = vH.y + aH.y * dt;
       
  posH.y = posH.y + ((vH.y+vH0.y)/2.0) * dt; 
   
  vH.y = vH.y;
  
  //Rugen-Kutta 2
  //Ley de Hooke
  aRKm.y = Muelle(posRK.y, vRK.y);
    
  vRKm.x = vRK.x + aRK.x * (dt/2.0);
  vRKm.y = vRK.y + aRK.y * (dt/2.0);
    
  posRKm.x = posRK.x + vRK.x * (dt/2.0); 
  posRKm.y = posRK.y + vRK.y * (dt/2.0);
    
  // Ley de Hooke para el punto medio entre las 
  // posiciones actual y la siguiente 
  aRKm.y = Muelle(posRKm.y, vRKm.y);
    
  vRK.x = vRK.x + aRKm.x * dt;
  vRK.y = vRK.y + aRKm.y * dt;
    
  posRK.x = posRK.x + vRKm.x * dt; 
  posRK.y = posRK.y + vRKm.y * dt;  
    
    
  //Euler
  //Muelle
  pushMatrix();
    translate(width/2,0);
    line(0, 100, 0, (height/2) + posE.y);
  popMatrix();
    
  //Bola
  pushMatrix();
    translate(width/2,height/2);
    translate(0,posE.y);
    fill(255,255,0,75);
    ellipse(0,0,30,30);
  popMatrix();
    
    //Heun
    //Muelle
    pushMatrix();
      translate(width/2,0);
      line(0, 100, 0, (height/2) + posH.y);
    popMatrix();
    
    //Bola
    pushMatrix();
      translate(width/2,height/2);
      translate(0,posH.y);
      fill(0,255,255,75);
      ellipse(0,0,30,30);
    popMatrix(); 
    
    //Runge-Kutta2
    //Muelle
    pushMatrix();
      translate(width/2,0);
      line(0, 100, 0, (height/2) + posRK.y);
    popMatrix();
    
    //Bola
    pushMatrix();
      translate(width/2,height/2);
      translate(0,posRK.y);
      fill(255,0,255,75);
      ellipse(0,0,30,30);
    popMatrix();
}

void keyPressed() {
  
  if(key == ' ') {
    //Se inicializan todos los vectores de nuevo
    aE = new PVector(0,0);
    vE = new PVector(0,0);
    posE = new PVector(0,0);
    aH = new PVector(0,0);
    vH = new PVector(0,0);
    vH0 = new PVector(0,0);
    posH = new PVector(0,0);
    aRK = new PVector(0,0);
    aRKm = new PVector(0,0);
    vRK = new PVector(0,0);
    vRKm = new PVector(0,0);
    posRK = new PVector(0,0);
    posRKm = new PVector(0,0);
    
  }
  if(Kd != 0) {
      Kd = 0;
    }
    else {
      Kd = 0.3;
    }
}


