
PImage nuvols, aire;
int posicioX, posicioY;
float posX, posY, midaX, midaY, Xrect, Yrect;
color colorGlobus, colorUmflador;

//VARIABLES NECESSARIES PER GENERAR UNA MATRIU DE PILOTES
int midaPilotes;
int numPilotes;
float[] posicionsX = new float[numPilotes];
float[] posicionsY = new float[numPilotes];
float[] velosX = new float[numPilotes];
float[] velosY = new float[numPilotes];
float[] cPilota = new float[numPilotes];


void setup() {
  size(720, 576);
  noCursor();

  //VALORS INICIALS VARIABLES
  nuvols = loadImage("nuvols.jpg");
  aire = loadImage("aire.png");
  colorGlobus = color(245, 224, 59);
  colorUmflador = color(85, 118, 234);
  midaPilotes = 50;
  numPilotes = 15;
  midaX = 55;
  midaY = 75;
}


void draw() {
  image (nuvols, 0, 0);
  dibuixarGlobus();
  dibuixarUmflador();
  dibuixarCableUmflador();

  //UMFLAR EL GLOBUS
  if (mousePressed == true && mouseButton == RIGHT) {
    midaX ++;
    midaY ++;
  } 
  //CANVIAR COLOR GLOBUS
  if (mousePressed && mouseButton == LEFT) {
    colorGlobus = color(random(255), random(255), random(255));
  }

  //COMPROVAR SI EL GLOBUS ÉS MÉS GRAN QUE UNA MIDA DETERMINADA PER TAL QUE EXPLOTI
  if ( midaX > 264 ) {
    image (nuvols, 0, 0);
    noStroke();
    dibuixarUmflador(); 

//INICIALITZAR LES PILOTES
    for (int i = 0; i<numPilotes; i++) {

      posicionsX[i] = posicionsX[i] + velosX[i];
      posicionsY[i] = posicionsY[i] + velosY[i];      

      if ((posicionsX[i]-midaPilotes/2<0) || (posicionsX[i]+midaPilotes/2>width)) {
        velosX[i] = -velosX[i];
      }
      if ((posicionsY[i]-midaPilotes/2<0)  || (posicionsY[i]+midaPilotes/2>height)) {
        velosY[i] = -velosY[i];
      }
      for (int j =0; j<numPilotes; j++) {
        cPilota[j] = fill(random(255), random(255), random(255));
      }
      
      ellipse(posicionsX[i], posicionsY[i], midaPilotes, midaPilotes);
    }
  }
}

//INICIALITZAR ELS VALORS DE LES PILOTES SEGONS EL MOUSE
void mousePressed(){
  for(int i=0; i < numPilotes; i++){
  posicionsX[i] = mouseX;
  posicionsY[i] = mouseY;
  velosX[i] = random(-10,10);
  velosY[i] = random(-10,10);
    }

}


//DIBUXAR GLOBUS
void dibuixarGlobus() {
  posX = mouseX;
  posY = mouseY;
  noStroke();
  smooth();
  fill(colorGlobus);
  ellipse(posX, posY, midaX, midaY);
  ellipse(posX, posY+midaY/2, midaX/3, midaY/6);
  triangle(posX, posY+7*midaY/15, posX-midaX/6, posY+9*midaY/12, posX+midaX/6, posY+9*midaY/12);
}


//DIBUIXAR UMFLADOR
void dibuixarUmflador() {
  rectMode(CENTER);
  fill(colorUmflador);
  Xrect = 115;
  Yrect = 350;
  rect(2*width/3, height, Xrect, Yrect, 15);
  image (aire, 2*width/3 - Xrect/2 + 15, 3*height/4);
}

void dibuixarCableUmflador() {
  noFill();
  stroke(0);
  strokeWeight(3);
  bezier(2*width/3 - Xrect/2, 3*height/4, mouseX + 300, mouseY + 250, mouseX-300, mouseY + 300, mouseX, mouseY+9*midaY/12);
}





