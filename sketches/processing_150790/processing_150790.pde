
// Ejercicio: Plano Inclinado 
//
// Controles
//
// Al pulsar la tecla x se aumentan los grados de inclinación del plano
// Al pulsar la tecla z se reducen los grados de inclinación del plano
// Al pulsar la tecla m se aumenta la masa de los objetos
// Al pulsar la tecla n se reduce la masa de los objetos
// Al pulsar la tecla r se reinicia la velocidad y posiciones
// Al pulsar la barra espaceadora se intercambian los distintos tipos de integradores
//

// Paso de tiempo (dt)
float dt = 0.1;

// Masa de las pelotas a lanzar
float m = 2.0;

// Constante de rozamiento
float Kr = 0.1;

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

// Angulo del plano inclinado
float ang = 30.0;

// Variable para el tipo de integrador
String modo = "Todos";

void setup() {
  size(700,600);
  stroke(0,0,0);
  strokeWeight(2);
  smooth();
}

PVector FuerzasProducidas(PVector VEL) {
  
  // Fuerza tangencial
  float Ftangencial = 0;
  
  // Vector para las fuerzas producidas
  PVector Ftan = new PVector(0,0);
  PVector Ft = new PVector(0,0);
  PVector Fr = new PVector(0,0);
  
  // Vector aceleracion resultante 
  PVector aceleracion = new PVector(0,0);
  
  // Módulo de la fuerza tangencial
  Ftangencial = g * m * sin(radians(ang));

  Ftan.x = Ftangencial * cos(radians(ang));  
  Ftan.y = Ftangencial * sin(radians(ang));
  
  // Fuerza de rozamiento
  Fr.x = -Kr * VEL.x;
  Fr.y = -Kr * VEL.y;
  
  // Suma de fuerzas
  Ft.x = Ftan.x + Fr.x;
  Ft.y = Ftan.y + Fr.y;
  
  // Aceleración
  aceleracion.x = Ft.x / m;
  aceleracion.y = Ft.y / m;
  
  return aceleracion;
}

void draw() {
  background(160);
  
  fill(50,50,100);
  
  // Al pulsar la tecla x se aumentan los grados de inclinación del plano
// Al pulsar la tecla z se reducen los grados de inclinación del plano
// Al pulsar la tecla m se aumenta la masa de los objetos
// Al pulsar la tecla n se reduce la masa de los objetos
// Al pulsar la tecla r se reinicia la velocidad y posiciones
// Al pulsar la barra espaceadora se intercambian los distintos tipos de integradores
  
  text("El 'espacio' cambia el tipo de integrador", 10, 80);
  text("La tecla x aumenta los grados de inclinación del plano", 10, 95);
  text("La tecla z reduce los grados de inclinación del plano", 10, 110);
  text("La tecla m aumenta la masa de los objetos", 10, 125);
  text("La tecla n reduce la masa de los objetos", 10, 140);
  text("La tecla r reinicia la velocidad y posiciones", 10, 155);
  
  text("pos_euler = "+ pos_euler, 10, 20);
  text("pos_heun = "+ pos_heun, 10, 35);
  text("pos_rk2 = "+ pos_rk2, 10, 50);
  text("Masa: "+m, 400, 20);
  text("Ángulo: "+ang, 400, 35);
  text("K rozamiento: "+Kr, 400, 50);
  text("Integrador: "+modo, 570, 40);
  
  fill(210,80,80);
  text("EULER", 570, 20);
  fill(80,210,80);
  text("HEUN", 620, 20);
  fill(80,80,210);
  text("RK2", 670, 20);
  
  if (modo == "Euler" || modo == "Todos")
  {
    // Aceleración producida
    a_euler = FuerzasProducidas(vel_euler);
    
    // Inegrador del método de Euler explicito
    
    // Calculo de la posición utilizando la velocidad actual
    pos_euler.x = pos_euler.x + vel_euler.x * dt; 
    pos_euler.y = pos_euler.y + vel_euler.y * dt; 
      
    // Calculo de la velocidad para el siguiente punto 
    vel_euler.x = vel_euler.x + a_euler.x * dt;
    vel_euler.y = vel_euler.y + a_euler.y * dt;

  }
  
  if (modo == "Heun" || modo == "Todos")
  {
    // Aceleración producida
    a_heun = FuerzasProducidas(vel_heun);
    
    // Integrador del método de Heun
      
    // Calculo de la velocidad actual
    vel_heun.x = vel_heun.x + a_heun.x * dt;
    vel_heun.y = vel_heun.y + a_heun.y * dt;
       
    // Ahora se hace la media entre la velocidad anterior y la actual para el calculo
    pos_heun.x = pos_heun.x + ((vel_heun.x+vel_ant_heun.x)/2.0) * dt;
    pos_heun.y = pos_heun.y + ((vel_heun.y+vel_ant_heun.y)/2.0) * dt; 
   
    // Se guarda la velocidad anterior para el calculo siguiente
    vel_ant_heun.x = vel_heun.x;
    vel_ant_heun.y = vel_heun.y;
  } 
  
  if (modo == "RK2" || modo == "Todos")
  {
    // Aceleración producida
    a_rk2 = FuerzasProducidas(vel_rk2);
    
    // Integrador del método de RK2
      
    // Velocidad en el punto medio
    vel_rk2_medio.x = vel_rk2.x + a_rk2.x * (dt/2.0);
    vel_rk2_medio.y = vel_rk2.y + a_rk2.y * (dt/2.0);
    
    // Aceleracion para el punto medio entre la 
    // posición actual y la siguiente 
    a_rk2_medio = FuerzasProducidas(vel_rk2_medio);
    
    // Se calcula la velocidad en el punto actual con la 
    // aceleración del punto medio
    vel_rk2.x = vel_rk2.x + a_rk2_medio.x * dt;
    vel_rk2.y = vel_rk2.y + a_rk2_medio.y * dt;
    
    // Se calcula la posición en el punto actual con la 
    // velocidad del punto medio
    pos_rk2.x = pos_rk2.x + vel_rk2_medio.x * dt; 
    pos_rk2.y = pos_rk2.y + vel_rk2_medio.y * dt; 
  }
  
  // Método para que los objetos siempre aparezcan en la pantalla 
  if (pos_euler.x < -400 || pos_euler.x > 400 || pos_euler.y < -400 || pos_euler.y > 400) {
    pos_euler.x = -pos_euler.x;
    pos_euler.y = -pos_euler.y;
  }
  if (pos_heun.x < -400 || pos_heun.x > 400 || pos_heun.y < -400 || pos_heun.y > 400) {
    pos_heun.x = -pos_heun.x;
    pos_heun.y = -pos_heun.y;
  }
  if (pos_rk2.x < -400 || pos_rk2.x > 400 || pos_rk2.y < -400 || pos_rk2.y > 400) {
    pos_rk2.x = -pos_rk2.x;
    pos_rk2.y = -pos_rk2.y;
  }
  
  // Plano inclinado
  pushMatrix();
    translate(width/2,height/2);
    rotate(radians(-ang));
    line(-1400,0,1400,0);
  popMatrix();
    
    
  //Color de la pelota y posición en el plano inclinado segun el integrador
  if (modo == "Euler" || modo == "Todos") {
    pushMatrix();
      translate(width/2,height/2);
      fill(210,80,80);
      translate(pos_euler.x,-pos_euler.y);
      ellipse(0,0,m*10,m*10);
   popMatrix();
  } 
    
  if (modo == "Heun" || modo == "Todos") {
    pushMatrix();
      translate(width/2,height/2);
      fill(80,210,80);
      translate(pos_heun.x,-pos_heun.y);
      ellipse(0,0,m*10,m*10);
    popMatrix();
  } 
    
  if (modo == "RK2" || modo == "Todos"){
    pushMatrix();
      translate(width/2,height/2);
      fill(80,80,210);
      translate(pos_rk2.x,-pos_rk2.y);
      ellipse(0,0,m*10,m*10);
    popMatrix();
  } 
}

void ReiniciarVectores(){
  // Se reinician los vectores
  a_euler = new PVector(0,0);
  vel_euler = new PVector(0,0);
  pos_euler = new PVector(0,0);
  a_heun = new PVector(0,0);
  vel_heun = new PVector(0,0);
  vel_ant_heun = new PVector(0,0);
  pos_heun = new PVector(0,0);
  a_rk2 = new PVector(0,0);
  vel_rk2 = new PVector(0,0);
  vel_rk2_medio = new PVector(0,0);
  pos_rk2 = new PVector(0,0);
  a_rk2_medio = new PVector(0,0);
}

void keyPressed() {
  // Al pulsar la tecla x se aumentan los grados de inclinación del plano
  if(key == 'x') {
    // Se reinician los vectores
    ReiniciarVectores();
    ang += 5;
  }
  // Al pulsar la tecla x se reducen los grados de inclinación del plano
  else if(key == 'z') {
    // Se reinician los vectores
    ReiniciarVectores();
    ang -= 5;
  }
  // Al pulsar la tecla m se aumenta la masa de los objetos
  else if(key == 'm') {
    // Se reinician los vectores
    //ReiniciarVectores();
    m += 1;
  }
  // Al pulsar la tecla n se reduce la masa de los objetos
  else if(key == 'n') {
    // Se reinician los vectores
    //ReiniciarVectores();
    if((m-1) > 0) {
      m -= 1;
    }
  }
  // Al pulsar la tecla r se reinicia la velocidad y posiciones
  else if(key == 'r') {
    // Se reinician los vectores
    ReiniciarVectores();
  }
  // Al pulsar la barra espaceadora se intercambian los distintos tipos de integradores
  else if(key == ' ') {
    // Se reinician los vectores
    ReiniciarVectores();
        
    if(modo == "Euler") {
      modo = "Heun";
    }
    else if(modo == "Heun") {
      modo = "RK2";
    }
    else if(modo == "RK2") {
      modo = "Todos";
    }
    else if(modo == "Todos") {
      modo = "Euler";
    }
  }
}


