
// Ejercicio: Muelle
//
// Controles
//
// Al pulsar la barra espaceadora se cambia entre muelle 
// con y sin amortiguador
//

// Paso de tiempo (dt)
float dt = 0.1;

// Masa de las pelotas
float m = 2.0;

// L reposo
float Lreposo = 100;

// Constante de elasticidad del muelle
float Ks = -0.6;

// Constante amortiguación
float Kd = 0.2;

// Gravedad
float g = -9.8;

// Vectores para el método de Euler, aceleración, velocidad inicial y posición
PVector a_euler = new PVector(0,0);
PVector vel_euler = new PVector(0,0);
PVector pos_euler = new PVector(0,0);

// Vectores para el método de Heun, aceleración, velocidad inicial y posición
PVector a_heun = new PVector(0,0);
PVector vel_heun = new PVector(0,0);
PVector vel_ant_heun = new PVector(0,0);
PVector pos_heun = new PVector(0,0);

// Vectores para el método de RK2, aceleración, velocidad inicial y posición
PVector a_rk2 = new PVector(0,0);
PVector a_rk2_medio = new PVector(0,0);
PVector vel_rk2 = new PVector(0,0);
PVector vel_rk2_medio = new PVector(0,0);
PVector pos_rk2 = new PVector(0,0);
PVector pos_rk2_medio = new PVector(0,0);

void setup() {
  size(700,600);
  stroke(0,0,0);
  strokeWeight(2);
  smooth();
}

float LeyHookeDamper(float POS, float VEL) {
  
  // Vector para las fuerzas producidas
  PVector Fk = new PVector(0,0);
  PVector Fs = new PVector(0,0);
  PVector Fd = new PVector(0,0);
  PVector Ft = new PVector(0,0);
  
  // Variable para la aceleracion resultante del calculo
  float aceleracion = 0.0;
  
  // Fuerza proporcional al desplazamiento (Ley de Hooke)
  Fs.y = Ks * (POS - Lreposo);  
   
  // Amortiguador
  Fd.y = Kd * VEL;
    
  // Fuerza proporcional al desplazamiento (Ley de Hooke) con amortiguación
  Fk.y = Fs.y - Fd.y;
   
  // Suma de fuerzas con amortiguación
  Ft.y = Fk.y + (m*g);
    
  // Aceleración con amortiguación
  aceleracion = Ft.y / m;
  
  return aceleracion;
}

void draw() {
  background(160);
    
  fill(210,80,80);
  text("EULER", 35, 90);
  text("vel_euler.y = "+vel_euler.y, 1, 55);
  text("y_euler = "+pos_euler.y, 1, 70);
  
  fill(80,210,80);
  text("HEUN", 335, 90);
  text("vel_heun.y = "+vel_heun.y, 280, 55);
  text("y_heun = "+pos_heun.y, 280, 70);
  
  fill(80,80,210);
  text("RK2", 635, 90);
  text("vel_rk2.y = "+vel_rk2.y, 570, 55);
  text("y_rk2 = "+pos_rk2.y, 580, 70);
  
  fill(20,20,20);
  text("Masa = "+m+"\t\t Ks = "+Ks+"\t\t Kd = "+Kd, 10, 590);
  text("Al pulsar la barra espaceadora se cambia entre muelle con y sin amortiguador", 245, 590);
  
  // Plano
  pushMatrix();
    translate(0,100);
    line(0,0,700,0);
  popMatrix();
 
       
  // EULER
  
    // Ley de Hooke con amortiguador
    a_euler.y = LeyHookeDamper(pos_euler.y, vel_euler.y);
    
    // Inegrador del método de Euler explicito
    // Calculo de la velocidad actual
    pos_euler.y = pos_euler.y + vel_euler.y * dt;
    vel_euler.y = vel_euler.y + a_euler.y * dt; 
    
    // Muelle
    pushMatrix();
      translate(width/2,0);
      line(-300, 100, -300, (height/2) + pos_euler.y);
    popMatrix();
    
    // Pelota
    pushMatrix();
      translate(width/2,height/2);
      translate(0,pos_euler.y);
      fill(210,80,80);
      ellipse(-300,0,30,30);
    popMatrix();
  
  // HEUN
  
    // Ley de Hooke con amortiguador
    a_heun.y = LeyHookeDamper(pos_heun.y, vel_heun.y);
        
    // Integrador del método de Heun
    // Calculo de la velocidad actual
    vel_heun.y = vel_heun.y + a_heun.y * dt;
       
    // Ahora se hace la media entre la velocidad anterior y la actual para el calculo
    pos_heun.y = pos_heun.y + ((vel_heun.y+vel_ant_heun.y)/2.0) * dt; 
   
    // Se guarda la velocidad anterior para el calculo siguiente
    vel_ant_heun.y = vel_heun.y;
    
    // Muelle
    pushMatrix();
      translate(width/2,0);
      line(0, 100, 0, (height/2) + pos_heun.y);
    popMatrix();
    
    // Pelota
    pushMatrix();
      translate(width/2,height/2);
      translate(0,pos_heun.y);
      fill(80,210,80);
      ellipse(0,0,30,30);
    popMatrix(); 
  
  // RK2
  
    // Integrador del método de RK2
  
    // Ley de Hooke con amortiguador para el punto actual
    a_rk2.y = LeyHookeDamper(pos_rk2.y, vel_rk2.y);
    
    // Velocidad en el punto medio
    vel_rk2_medio.x = vel_rk2.x + a_rk2.x * (dt/2.0);
    vel_rk2_medio.y = vel_rk2.y + a_rk2.y * (dt/2.0);
    
    // Se calcula el siguiente punto medio
    pos_rk2_medio.x = pos_rk2.x + vel_rk2.x * (dt/2.0); 
    pos_rk2_medio.y = pos_rk2.y + vel_rk2.y * (dt/2.0);
    
    // Ley de Hooke con amortiguador para el punto medio entre la 
    // posición actual y la siguiente 
    a_rk2_medio.y = LeyHookeDamper(pos_rk2_medio.y, vel_rk2_medio.y);
    
    // Se calcula la velocidad en el punto actual con la 
    // aceleración del punto medio
    vel_rk2.x = vel_rk2.x + a_rk2_medio.x * dt;
    vel_rk2.y = vel_rk2.y + a_rk2_medio.y * dt;
    
    // Se calcula la posición en el punto actual con la 
    // velocidad del punto medio
    pos_rk2.x = pos_rk2.x + vel_rk2_medio.x * dt; 
    pos_rk2.y = pos_rk2.y + vel_rk2_medio.y * dt;  
    
    
    
    // Muelle
    pushMatrix();
      translate(width/2,0);
      line(300, 100, 300, (height/2) + pos_rk2.y);
    popMatrix();
    
    // Pelota
    pushMatrix();
      translate(width/2,height/2);
      translate(0,pos_rk2.y);
      fill(80,80,210);
      ellipse(300,0,30,30);
    popMatrix();
}

void keyPressed() {
  
  // Al pulsar la barra espaceadora se cambia entre muelle 
  // con y sin amortiguador
  if(key == ' ') {
    // Se reinicializan los vectores
    a_euler = new PVector(0,0);
    vel_euler = new PVector(0,0);
    pos_euler = new PVector(0,0);
    a_heun = new PVector(0,0);
    vel_heun = new PVector(0,0);
    vel_ant_heun = new PVector(0,0);
    pos_heun = new PVector(0,0);
    a_rk2 = new PVector(0,0);
    a_rk2_medio = new PVector(0,0);
    vel_rk2 = new PVector(0,0);
    vel_rk2_medio = new PVector(0,0);
    pos_rk2 = new PVector(0,0);
    pos_rk2_medio = new PVector(0,0);
    
    if(Kd != 0) {
      Kd = 0;
    }
    else {
      Kd = 0.2;
    }
  }
}


