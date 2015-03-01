
//*******VARIABLES GLOBALES*******

// Dioses random
int totalDiosesRandom=10;
float[] x= new float[totalDiosesRandom]; // Posiciones X
float[] y= new float[totalDiosesRandom]; // Posiciones Y
float[] e= new float[totalDiosesRandom]; // Escalado
float v=5; // Rango de velocidad random

// Dioses rebotadores
int totalDiosesRebotadores=200;
float[] xRebot= new float[totalDiosesRebotadores]; // Posiciones X
float[] yRebot= new float[totalDiosesRebotadores]; // Posiciones Y
float[] vxRebot= new float[totalDiosesRebotadores]; // Velocidades X
float[] vyRebot= new float[totalDiosesRebotadores]; // Velocidades Y
float[] eRebot= new float[totalDiosesRebotadores]; // Escalado

// colores
color fucsia = color(245, 64, 182);
color amarillo = color(255, 247, 8);

// colores iniciales de los dioses
color c1 = color(11, 255, 0); //triangle exterior
color c2 = color(206, 48, 191); //iris
color c3 = color(255, 3, 226); //iris interior

// colores iniciales del degradado
color cDegradado1 = fucsia;
color cDegradado2 = amarillo;


//*******FUNCIONES PERSONALIZADAS*******

//FUNCION DEGRADADO FONDO
void dibujarDegradado() { 
  for (int i = 0; i <= height; i++) {
    float factor = float(i)/height;
    color interpolatedColor = lerpColor(cDegradado1, cDegradado2, factor);
    stroke(interpolatedColor);
    line(0, i, width, i);
  }
}


//FUNCION DIBUJAR DIOS
void dibujarDios(color cTrianguloExt, color cIrisExt, color cIrisInt) {

  // Triangulo exterior
  fill(cTrianguloExt);
  noStroke();
  triangle(0, -90, -75, 50, 75, 50);

  // Triangulo interior
  fill(3, 255, 190);
  triangle(0, -83, -70, 47, 70, 47);

  // Ojo
  fill(255);
  ellipse(0, 0, 85, 40);

  // Iris
  fill(cIrisExt);
  ellipse(0, 0, 39, 39);

  // Iris interior
  fill(cIrisInt);
  ellipse(0, 0, 23, 23);

  // Pupila
  fill(0);
  ellipse(0, 0, 15, 15);

  // Brillo pupila
  fill(255, 255, 255);
  ellipse(3, -2, 5, 5);
}


//________________________________________________________________________________//

void mousePressed() {
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  cDegradado1 = color(random(255), random(255), random(255));
  cDegradado2 = color(random(255), random(255), random(255));
}
//________________________________________________________________________________//

void setup() {
  size(640, 603);

  // inicializar dioses random
  for (int i=0; i<totalDiosesRandom; i++) {
    x[i] = width/2;
    y[i] = height/2;
    e[i] = random(0.6,1.1);
  }

  // inicializar dioses rebotadores
  for (int i=0; i<totalDiosesRebotadores; i++) {
    xRebot[i] = width/2;
    yRebot[i] = height/2;
    vxRebot[i] = random(-3, 3);
    vyRebot[i] = random(-3, 3);
    eRebot[i] = random(0.1,0.4);
  }
}


void draw() {
  dibujarDegradado();
  
  // animar y dibujar dioses random
  for (int i=0; i<totalDiosesRandom; i++) {
    x[i]= x[i]+random(-v, v);
    y[i]= y[i]+random(-v, v);

    pushMatrix();
    translate(x[i], y[i]);
    scale(e[i]);
    dibujarDios(c1, c2, c3);
    popMatrix();
  }

  // animar y dibujar dioses rebotadores
  for (int i=0; i<totalDiosesRebotadores; i++) {
    xRebot[i]= xRebot[i]+vxRebot[i];
    yRebot[i]= yRebot[i]+vyRebot[i];

    pushMatrix();
    translate(xRebot[i], yRebot[i]);
    scale(eRebot[i]);
    dibujarDios(c1, c2, c3);
    popMatrix();
    
    // rebotar
    if (xRebot[i]<=0 || xRebot[i]>=width) { vxRebot[i] = -vxRebot[i]; }
    if (yRebot[i]<=0 || yRebot[i]>=height) { vyRebot[i] = -vyRebot[i]; }
  }

}
