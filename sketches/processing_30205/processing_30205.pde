
int nBolitas=60;
float [] posX = new float[nBolitas];
float [] posY = new float[nBolitas];
float [] tam = new float[nBolitas];
float [] r = new float[nBolitas];
float [] g = new float[nBolitas];
float [] b = new float[nBolitas];
float [] a = new float[nBolitas];
boolean [] vida = new boolean[nBolitas];
int puntaje;
int tiempo;
int estado=0;

PFont fuente;
PFont resultado;
PImage logo;

int cuadros=0;

void sortear() {
  for (int i=0; i<nBolitas; i++) {
    posX[i] = random (0, 500);
    posY[i] = random (0, 500);
    tam[i] = random (10, 100);
    r[i] = random (0, 255);
    g[i] = random (0, 255);
    b[i] = random (0, 255);
    a[i] = random (100, 255);
    vida[i] = true;
  }
}

void setup() {
  size (500, 500);
  sortear();
  fuente = loadFont("Arista-16.vlw");
  resultado = loadFont("Arista-48.vlw");
  logo = loadImage("lorspi.png");
  puntaje=0;
  tiempo=10; //tiempo -----------------------------------------------------------!!!
}


void draw() {
  //para generar bolitas cada 5 segundos
  /*cuadros++;
   
   if (cuadros == 150) {
   sortear();
   cuadros=0;
   }*/
  // otra forma de hacerlo:  
  /*  if (frameCount%150 == 0) {
   sortear();
   }*/


  //cuenta regresiva


  if (estado==1) {
    cuadros++;
    if (cuadros == 60) {
      tiempo--;
      cuadros=0;
    }
  }


  if (tiempo==0) {
    estado=2;
  }
  switch(estado) {
  case 0:
    background(0);
    fill(80);
    rect(10, 10, 480, 480);
    fill(255);
    textFont(resultado, 25); 
    textAlign(CENTER);
    text("Clic en las bolitas para sumar puntos.", 250, 200);
    textFont(fuente); 
    textAlign(CENTER);
    text("Jugar", 250, 350);
    image (logo, 425, 460);
    break;
  case 1: 
    background(0);
    smooth();
    for (int i=0; i<nBolitas; i++) {
      noStroke();
      fill(r[i], g[i], b[i], a[i]);

      if (vida[i]==true) {
        ellipse(posX[i], posY[i], tam[i], tam[i]);
      }
    }
    fill(255);
    textFont(fuente); 
    text("Puntaje: " +puntaje+ "     Tiempo: " +tiempo, 10, 10, 500, 20);
    break;
  case 2:
    fill(80);
    rect(10, 10, 480, 480);
    fill(255);
    textFont(resultado, 32); 
    textAlign(CENTER);
    text("Fin del juego\n\nTu puntaje es de: " +puntaje, 250, 200);
    textFont(fuente); 
    textAlign(CENTER);
    text("Reiniciar", 250, 350);
    image (logo, 425, 460);
    break;
  }
}

void mousePressed() {
  if (estado==1) {
    for (int i=0; i<nBolitas; i++) {
      if ((mouseX > posX[i]-tam[i]/2)&&
        (mouseX < posX[i]+tam[i]/2)&&
        (mouseY > posY[i]-tam[i]/2)&&
        (mouseY < posY[i]+tam[i]/2)) {

        if (vida[i] == true) {
          puntaje++;
          vida[i] = false;
        }
      }
    }
  }
}


//cerrar con clic derecho
void mouseClicked() { 

  switch(estado) {
  case 0:
    if ((mouseX > 230)&&
      (mouseX < 270)&&
      (mouseY > 340)&&
      (mouseY < 355)) { 
      estado = 1;
    }
    break;
  case 2:
    if ((mouseX > 220)&&
      (mouseX < 280)&&
      (mouseY > 340)&&
      (mouseY < 355)) {
      estado=0;
      puntaje=0;
      tiempo=10;
      sortear();
    }/*exit();*/
    break;
  }
}


