
//Ejercicio: Tiro parabólico. Tiro mediante los 3 integradores dados.

float dt = 0.2;
float m = 2.0;

PVector g = new PVector(0, 9.8);//Vector gravedad
PVector f = new PVector(0,0);//Vector fuerzas

//Vectores Euler:
PVector posE = new PVector(0, 0);
PVector vE = new PVector(60, -100);

//Vectores Heun:
PVector posH = new PVector(0, 0);
PVector vH = new PVector(60, -100);
PVector vH0 = new PVector(0,0);

//Vectores Runge-Kutta2:
PVector posRK = new PVector(0,0);
PVector vRK = new PVector(60, -100);
PVector vRKm = new PVector(0,0);


void setup(){
  size(670,480);
  background(0);
  noStroke();
  fuerzaGravedad();
  
  
}

void fuerzaGravedad() {//Actualiza el valor de la gravedad F=m*a
  f.x = g.x * m;
  f.y = g.y * m;
}

void update(){
  update();
  draw();
}
void draw(){
  
  fill(255);
  text("METODOS DE INTEGRACION", width/10, height/7);
  fill(255,255,0);
  text("Euler", width/10, height/7+height*0.03);
  fill(0,255,255);
  text("Heun", width/10, height/7+height*0.06);
  fill(255,0,255);
  text("Runge-Kutta 2", width/10, height/7+height*0.09);
 
   //background(0); //si queremos que se actualice la posicion 
  //Euler (Calculamos pos mediante v actual y calculamos v siguiente
  posE.x += vE.x*dt;
  posE.y += vE.y*dt;
  
  vE.x += f.x*dt;
  vE.y += f.y*dt;

 
  //Heun
  posH.x += (vH.x + vH0.x)/2.0*dt;
  posH.y += (vH.y + vH0.y)/2.0*dt;
  
  vH.x += f.x*dt;
  vH.y += f.y*dt;
  
  vH0.x = vH.x;//Actualiza v anterior
  vH0.y = vH.y;
  

  //RK2
  vRKm.x = vRK.x + f.x * (dt/2.0);
  vRKm.y = vRK.y + f.y * (dt/2.0);
      
  vRK.x += f.x * dt;
  vRK.y += f.y * dt;
      
  // Se calcula con la velocidad en el punto medio entre las 
  // posiciones actual y siguiente
  posRK.x = posRK.x + vRKm.x * dt; 
  posRK.y = posRK.y + vRKm.y * dt;
  
  //Dibujar
  //Euler
  pushMatrix();
    translate(posE.x, posE.y);
    fill(255,255,0);
    ellipse(0, height,10,10);
  popMatrix();
  
  //Heun
  pushMatrix();
    translate(posH.x, posH.y);
    fill(0, 255,255);
    ellipse(0, height, 10,10);
  popMatrix();
  
  //RK2
  pushMatrix();
    translate(posRK.x, posRK.y);
    fill(255,0,255);
    ellipse(0, height, 10, 10);
  popMatrix();
  
}

void keyPressed() {
  
  if(key == ' ') {
    //Se inicializan todos los vectores de nuevo
   
    vE = new PVector(60,-100);
    posE = new PVector(0,0);
    vH = new PVector(60,-100);
    vH0 = new PVector(0,0);
    posH = new PVector(0,0);
    vRK = new PVector(60,-100);
    vRKm = new PVector(0,0);
    posRK = new PVector(0,0);
    background(0);
    update();
  }
}




