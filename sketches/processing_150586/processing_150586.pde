
/* CRISTOBAL BELDA PEREZ */
/* Tarea 2: Physics Background */

//EJERCICIO DEL MOVIMIENTO PARABÃ�LICO DE UNA PARTÃ�CULA

int Color = 30;
float dt = 0.4;
float m = 1.0;

PVector g = new PVector(0, 9.8);
PVector f = new PVector(0,0);

//Vectores para Euler:
PVector rE = new PVector(0, 0);
PVector vE = new PVector(40, -80);

//Vectores para Heun:
PVector rH = new PVector(0, 0);
PVector vH = new PVector(40, -80);
PVector vH0 = new PVector(0,0);

//Vectores para Runge-Kutta2:
PVector rRK = new PVector();
PVector vRK = new PVector(40, -80);

void setup(){
  size(635,500);
  noStroke();
  background(0);
  //se actualiza el valor de la fuerza de la gravedad: F=ma;
  f.x = g.x*m;
  f.y = g.y*m;
  fill(255,255,255);
  text("METHODS:", width/2-width/8, height/1.5);
  fill(255,0,0);
  text("EULER", width/2-width/8, height/1.5+height*0.04);
  fill(0,0,255);
  text("HEUN", width/2-width/8, height/1.5+height*0.08);
  fill(0,200,0);
  text("RUNGE-KUTTA 2", width/2-width/8, height/1.5+height*0.12);
}

void draw(){
  //background(200);
  //se actualiza el valor de la fuerza de la gravedad: F=ma;
  f.x = g.x*m;
  f.y = g.y*m;
  if(Color == 255){
    Color--;
  }
  else{
    Color+=3;
  }
  
  
  /******** EULER *********/
  //1) Calculo de la Velocidad:
  vE.x += f.x*dt;
  vE.y += f.y*dt;
  //2) Calculo de la PosiciÃ³n:
  rE.x += vE.x*dt;
  rE.y += vE.y*dt;
 
 
  /******** HEUN *********/
  //1) Calculo de la Velocidad:
  vH.x += f.x*dt;
  vH.y += f.y*dt;
  //2) Calculo de la Posicion:
  rH.x += 0.5*(vH.x + vH0.x)*dt;
  rH.y += 0.5*(vH.y + vH0.y)*dt;
  //3) Se actualiza el valor de la Velocidad anterior:
  vH0.x = vH.x;
  vH0.y = vH.y;
  
  /******** RK-2 ********/
  //1) Calculo de la Velocidad:
  vRK.x += f.x*dt*0.5;
  vRK.y += f.y*dt*0.5;
  //2) Calculo de la PosiciÃ³n:
  rRK.x += vRK.x*dt*0.5;
  rRK.y += vRK.y*dt*0.5;
  
  //Dibujar EULER
  pushMatrix();
    translate(rE.x, rE.y);
    fill(Color,0,0);
    ellipse(0, height,10,10);
  popMatrix();
  
  //Dibujar HEUN
  pushMatrix();
    translate(rH.x, rH.y);
    fill(0, 0,Color);
    ellipse(0, height, 10,10);
  popMatrix();
  
  //Dibujar RUNGE-KUTTA 2
  pushMatrix();
    translate(rRK.x, rRK.y);
    fill(0,Color,0);
    ellipse(0, height, 10, 10);
  popMatrix();
  
}






