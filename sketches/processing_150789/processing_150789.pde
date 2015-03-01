
// Ejercicio: Tiro Parabólico 
// Se simula el mismo tiro con los tres integradores estudiados (Euler, Heun y RK2) 
//
// Controles
//
// Al pulsar la barra espaceadora se intercambian los distintos tipos de integradores
// Al pulsar la tecla b activamos el refresco del background
// Al pulsar la tecla v desactivamos el refresco del background
// Al pulsar la tecla m se aumenta la masa de las pelotas
// Al pulsar la tecla n se reduce la masa de las pelotas
//


// Vectores para el lanzador y para el disparo
PVector mouse;
PVector center;

// Paso de tiempo (dt)
float dt = 0.2;

// Masa de las pelotas a lanzar
float m = 1.0;

// Gravedad
PVector g = new PVector(0,9.8);

// Vector para la aceleración de la gravedad
PVector a_grav = new PVector(0,0);

// Vectores para el método de euler, velocidad inicial y posición
PVector vel_euler = new PVector(0,0);
PVector pos_euler = new PVector(0,0);

// Vectores para el método de heun, velocidad inicial y posición
PVector vel_heun = new PVector(0,0);
PVector vel_ant_heun = new PVector(0,0);
PVector pos_heun = new PVector(0,0);

// Vectores para el método de RK2, velocidad inicial y posición
PVector vel_rk2 = new PVector(0,0);
PVector vel_rk2_medio = new PVector(0,0);
PVector pos_rk2 = new PVector(0,0);

// Fuerza de disparo del lanzador
float f_disparo = 50;

// Variables para los diferentes estados
boolean disparo = false;
boolean actBackground = false;
String modo = "Todos";


void setup() {
  size(700,600);
  stroke(190,190,0);
  strokeWeight(0.9);
  smooth();
  
  masaGravedad();
}

void masaGravedad() {
  // F = m * G
  a_grav.x = g.x * m;
  a_grav.y = g.y * m;
}

void draw() {
  if(actBackground == true || disparo == false) {
    background(100);
    
    fill(190,190,0);
    text("Fuerza de disparo: "+f_disparo, 10, 15);
    text("Integrador usado: "+modo, 10, 30);
    text("F = m*G = "+m+" * " +g.y+" = "+a_grav.y, 10, 45);
    text("dt = "+dt, 10, 60);
    text("Refresco de background: "+actBackground, 10, 75);
    
    text("El 'espacio' cambia el tipo de integrador", 300, 15);
    text("La tecla b activa el refresco del background", 300, 30);
    text("La tecla v desactiva el refresco del background", 300, 45);
    text("La tecla m aumenta la masa de las pelotas", 300, 60);
    text("La tecla n reduce la masa de las pelotas", 300, 75);
    text("Se dispara con el mouse", 300, 90);
    
    fill(210,80,80);
    text("EULER", 570, 15);
    fill(80,210,80);
    text("HEUN", 620, 15);
    fill(80,80,210);
    text("RK2", 670, 15);
  }
    
  // Vector con la localizacion del raton
  mouse = new PVector(mouseX,mouseY); 

  // Vector con los puntos del centro
  center = new PVector(10,590);

  // Se resta el vector center al vector mouse
  mouse.sub(center);
  
  // Se normaliza el vector
  mouse.normalize();
  
  // Se modifica la fuerza del disparo de la pelota
  mouse.mult(f_disparo);
  
  translate(10,590);
  
  // Se dibuja la linea
  if(actBackground == true || disparo == false) {
    line(0,0,mouse.x,mouse.y);
  }
  
  /*
  *  EULER
  */
  if(modo == "Euler" || modo == "Todos") {
    if (disparo != true) {
      
      // Se inicializan las posiciones para situar la pelota en el lanzador
      pos_euler.x = mouse.x;
      pos_euler.y = mouse.y;
    
      // Se calcula la velocidad inicial para el momento del disparo
      // Como hemos modificado el vector mouse para una determinada fuerza, 
      // la velocidad inicial se basara en la suma de las fuerzas
      vel_euler.x = mouse.x + a_grav.x * dt;
      vel_euler.y = mouse.y + a_grav.x * dt;
     
    }
    else {
      // Integrador del metodo de euler explicito
      
      // Calculo de la posición utilizando la velocidad actual
      pos_euler.x = pos_euler.x + vel_euler.x * dt; 
      pos_euler.y = pos_euler.y + vel_euler.y * dt; 
      
      // Calculo de la velocidad para el siguiente punto 
      vel_euler.x = vel_euler.x + a_grav.x * dt;
      vel_euler.y = vel_euler.y + a_grav.y * dt;
    }
    
    pushMatrix();
      // Se dibuja la elipse
      translate(pos_euler.x, pos_euler.y);
      fill(210,80,80);
      ellipse(0, 0, 10*m, 10*m);
    popMatrix();
  }
 
  /*
  *  HEUN
  */
  if(modo == "Heun" || modo == "Todos") {
    if (disparo != true) {
      
      // Se inicializan las posiciones para situar la pelota en el lanzador
      pos_heun.x = mouse.x;
      pos_heun.y = mouse.y;
    
      // Se calcula la velocidad inicial para el momento del disparo
      // Como hemos modificado el vector mouse para una determinada fuerza, 
      // la velocidad inicial se basara en la suma de las fuerzas
      vel_heun.x = mouse.x + a_grav.x * dt;
      vel_heun.y = mouse.y + a_grav.x * dt;
     
    }
    else {
      // Integrador del metodo de heun
      
      // Calculo de la velocidad actual
      vel_heun.x = vel_heun.x + a_grav.x * dt;
      vel_heun.y = vel_heun.y + a_grav.y * dt;
      
      // Ahora se hace la media entre la velocidad anterior y la actual para el calculo
      pos_heun.x = pos_heun.x + ((vel_heun.x+vel_ant_heun.x)/2.0) * dt; 
      pos_heun.y = pos_heun.y + ((vel_heun.y+vel_ant_heun.y)/2.0) * dt; 
     
    }
    
    // Se guarda la velocidad anterior para el calculo siguiente
    vel_ant_heun.x = vel_heun.x;
    vel_ant_heun.y = vel_heun.y;
    
    pushMatrix();
      // Se dibuja la elipse
      translate(pos_heun.x, pos_heun.y);
      fill(80,210,80);
      ellipse(0, 0, 10*m, 10*m);
    popMatrix();
  }
  
  /*
  *  RK2
  */
  if(modo == "RK2" || modo == "Todos") {
    if (disparo != true) {
      
      // Se inicializan las posiciones para sintuar la pelota en el lanzador
      pos_rk2.x = mouse.x;
      pos_rk2.y = mouse.y;
    
      // Se calcula la velocidad inicial para el momento del disparo
      // Como hemos modificado el vector mouse para una determinada fuerza, 
      // la velocidad inicial se basara en la suma de las fuerzas
      vel_rk2.x = mouse.x + a_grav.x * dt;
      vel_rk2.y = mouse.y + a_grav.x * dt;
    }
    else {
      // Integrador del metodo de rk2
      
      // Calculo de la velocidad actual en el punto medio entre la 
      // posición actual y la siguiente
      vel_rk2_medio.x = vel_rk2.x + a_grav.x * (dt/2.0);
      vel_rk2_medio.y = vel_rk2.y + a_grav.y * (dt/2.0);
      
      vel_rk2.x = vel_rk2.x + a_grav.x * dt;
      vel_rk2.y = vel_rk2.y + a_grav.y * dt;
      
      // Se calcula tomando la velocidad en el punto medio entre la 
      // posición actual y la siguiente
      pos_rk2.x = pos_rk2.x + vel_rk2_medio.x * dt; 
      pos_rk2.y = pos_rk2.y + vel_rk2_medio.y * dt;

    }
    
    pushMatrix();
      // Se dibuja la elipse
      translate(pos_rk2.x, pos_rk2.y);
      fill(80,80,210);
      ellipse(0, 0, 10*m, 10*m);
    popMatrix();
  }
  
   if ( (pos_rk2.x > width || pos_rk2.y >= 0 || pos_rk2.x < -5) 
     && (pos_heun.x > width || pos_heun.y >= 0 || pos_heun.x < -5) 
     && (pos_euler.x > width || pos_euler.y >= 0 || pos_euler.x < -5)) {
        disparo = false;
        f_disparo = 50;
  }
  
  
  print("\n Diferencia entre euler - heun en x: " + (pos_euler.y - pos_heun.y));
  print("\t Diferencia entre euler - heun en y: " + (pos_euler.y - pos_heun.y));
  print("\n Diferencia entre RK2 - heun en x: " + (pos_rk2.y - pos_heun.y));
  print("\t Diferencia entre RK2 - heun en y: " + (pos_rk2.y - pos_heun.y));
  print("\n Diferencia entre euler - RK2 en x: " + (pos_euler.y - pos_rk2.y));
  print("\t Diferencia entre euler - RK2 en y: " + (pos_euler.y - pos_rk2.y));

  
  // Al pulsar y mantener el ratón o trackpad se aumenta la fuerza de disparo
  if(mousePressed) {
    f_disparo += 0.5;
  } 
}

// Al soltar el ratón o trackpad se dispara
void mouseReleased() {
  disparo = true;
}

void keyPressed() {
  
  // Al pulsar la barra espaceadora se intercambian los distintos tipos de integradores
  if(key == ' ') {
    // Se reinician los vectores
    vel_euler = new PVector(0,0);
    pos_euler = new PVector(0,0);
    vel_heun = new PVector(0,0);
    vel_ant_heun = new PVector(0,0);
    pos_heun = new PVector(0,0);
    vel_rk2 = new PVector(0,0);
    vel_rk2_medio = new PVector(0,0);
    pos_rk2 = new PVector(0,0);
    
    // Se desactiva el disparo y se reinicia la fuerza de disparo
    disparo = false;
    f_disparo = 50;
    
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
  
  // Al pulsar la tecla b activamos el refresco del background
  else if(key == 'b') {
    actBackground = true;
  }
  
  // Al pulsar la tecla v desactivamos el refresco del background, 
  // lo que nos sirve para apreciar mejor los resultados de los integradores 
  // en el tiro parabólico efectuado (activada por defecto) 
  else if(key == 'v') {
    actBackground = false;
  }
  // Al pulsar la tecla m se aumenta la masa de las pelotas
  else if(key == 'm') {
    m += 0.5;
    masaGravedad();
  }
    // Al pulsar la tecla n se reduce la masa de las pelotas
  else if(key == 'n') {
    if( (m-0.5) > 0)
    m -= 0.5;
    masaGravedad();
  }
}


