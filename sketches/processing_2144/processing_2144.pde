
// Valores iniciales
int diametroBoton = 50;

// define la cantidad de elementos del gusano
int copias = 20;

// colores
boolean cogido = false;
color colorCogido;
color colorSobre;
color colorNormal;

float xObj, yObj, anguloObj;

// defino 2 arrays para guardar las posiciones
float[] x = new float[copias];
float[] y = new float[copias];
float[] angulo = new float[copias];

void setup () {
  size(500, 500);
  smooth();

  // llamo a la funcion que define la pos
  // de salida de los cuadros
  creaBotones();
}

void draw () {
  background(255);

  // actualizo las posiciones y angulos
  // de los botones
  actualizaBotones();
  
  // dibujo los botones
  dibujaBotones();
}

void mousePressed(){
  if (dist(mouseX, mouseY, x[0], y[0]) < diametroBoton/2) {
    cogido = true;
  }
}

void mouseReleased(){
  cogido = false;
}

void mouseDragged(){
  if (cogido) {
    xObj = mouseX;
    yObj = mouseY;
    anguloObj = atan2(mouseY-y[0], mouseX-x[0]);
  }
}


void creaBotones() {  
  colorCogido = color(#AA00FF);
  colorSobre = color(#FFCD03);
  colorNormal = color(#668CBF);

  // recorro el array y relleno cada miembro con un valor
  for (int i=0; i<copias; i++) {
    x[i] = width*.5;
    y[i] = height*.5;
    angulo[i] = 0.0;
  }
  
  xObj = x[0];
  yObj = y[0];
  anguloObj = angulo[0];
}


void actualizaBotones() {
  x[0] = lerp(x[0], xObj, 0.2);
  y[0] = lerp(y[0], yObj, 0.2);
  angulo[0] = lerp(angulo[0], anguloObj, 0.2);
  
  // Para el resto de cuadrados
  for (int i=1; i<copias; i++) {
      x[i] = lerp(x[i], x[i-1], 0.2);
      y[i] = lerp(y[i], y[i-1], 0.2);
      angulo[i] = lerp(angulo[i], angulo[i-1], 0.2);
  }
}

void dibujaBotones() {  
  stroke(0);
  strokeWeight(4);

 if (cogido) {
    fill(colorCogido);
  } else {
    if(dist(mouseX, mouseY, x[0], y[0]) < diametroBoton/2) {
      fill(colorSobre);
    } else {
      fill(colorNormal);
    }
  }
 

  for (int i=copias-1; i>=0; i--) {
    pushMatrix();
    translate(x[i], y[i]);
    rotate(angulo[i]);

    ellipse(0, 0, diametroBoton, diametroBoton);
    line(0, 0, diametroBoton/2, 0);
    popMatrix();
  }
}

void keyPressed(){
  saveFrame("screen.png");
}

