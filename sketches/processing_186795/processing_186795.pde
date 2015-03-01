
//variables Sol
float solX, solY;
int szSol;

//ovni
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
int mida;
int midaY;

//estrellas

float[] posx = new float[59];
float[] posy = new float[59];
float[] velx = new float[59];
float[] vely = new float[59];
int sz =7;


//fotos

PImage tierra;
PImage planeta;
PImage planeta2;


void setup() {
  size(800, 400);
 //variables ovni
 posicioX = width/2;
  posicioY = height/2;
  mida = 120;
  midaY = 40;
  
  //posicion inicial Sol
  solX = hour();
  solY = height/2;
  szSol = 100;
  
 //estrellas
  for (int i=0; i<59; i++) {
    posx[i] = random(sz/2, width-sz/2);
    posy[i] = random(sz/2, height-sz/2);
    velx[i] = random(-4, 2);
    vely[i] = random(-4, 2);
  }
  //precarga imagenes
 
  tierra = loadImage("tierra.png");
  planeta = loadImage("planeta.png");
  planeta2 = loadImage("planeta2.png");

}

void draw() {
 
  dibujaCielo();
  
  dibujaSol();
  
  dibujaMovimientoSol();
  
  SolVuelve();
  
  dibujaFondo();
  
  dibujaOvni();
  
  MovimientoOvni();
  VueltaOvni();
  
  dibujaEstrellas();
  
 
 }
 
  
////////////////////////////////////////////////FUNCIONES///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

void dibujaCielo() {
 
      background(49, 60, 80);
  }

 void dibujaSol() {
  noStroke();

  fill(255, 231, 152);
  ellipse(solX, solY, szSol, szSol);}
  
//visto en Haru de Helena Sánchez
void dibujaMovimientoSol() {
 
  float recorridoSolX = map(hour(), 0, 23,0, width);
  float recorridoSolY = map(hour(), 0, 23, height/2, 0);
  solX = recorridoSolX;
  solY = recorridoSolY;
  
    if (solX >= width/2) {
    float puestaSolY = map(hour(), 0, 23, 0, height/2);
    solY = puestaSolY;
  }
}
void SolVuelve() {
  //para que el Sol vuelva a aparecer
  if (solX > width+szSol/2) {
    solX = -100;
  }
}

void dibujaFondo() {
 
    image(tierra,140,250);
    image(planeta,340,250);
    image(planeta2,540,250);
}

void dibujaOvni() {
  
fill (0,150,89);
  ellipse(posicioX, posicioY+10, mida, midaY);
  fill (0,200,120);
  ellipse(posicioX, posicioY, mida, midaY);

  fill (100,200,200);
  bezier (posicioX-40, posicioY, posicioX-25, posicioY-45, posicioX+25, posicioY-45, posicioX+40, posicioY);
  bezier (posicioX-40, posicioY-1, posicioX-20, posicioY+10, posicioX+20, posicioY+10, posicioX+40, posicioY-1);


  fill (160,160,2);
  ellipse (posicioX-40, posicioY+20, 5, 5);
  ellipse (posicioX-30, posicioY+23, 5, 5);
  ellipse (posicioX-20, posicioY+24, 5, 5);
  ellipse (posicioX-10, posicioY+25, 5, 5);
  ellipse (posicioX, posicioY+25, 5, 5);

  ellipse (posicioX+40, posicioY+20, 5, 5);
  ellipse (posicioX+30, posicioY+23, 5, 5);
  ellipse (posicioX+20, posicioY+24, 5, 5);
  ellipse (posicioX+10, posicioY+25, 5, 5);

}

void MovimientoOvni(){
 float recorridoOvniX = map(second(), 0, 59, -75, width+75);
 float recorridoOvniY = map(second(), 0, 59, height/2, height/2);
posicioX = recorridoOvniX;
 posicioY = recorridoOvniY;
}
void VueltaOvni(){
 
  if (posicioX > width+mida/2) {
    posicioX = -100;
  }
}
void dibujaEstrellas(){
 int total2=minute();
    
   for (int i=0; i<total2; i++) {


    posx[i] += velx[i];
    posy[i] += vely[i];

    if (posx[i]<0+sz/2 || posx[i]>width-sz/2) {
      velx[i] = -velx[i];
    
    }
    if (posy[i]<0+sz/2 || posy[i]>height-sz/2) {
      vely[i] = -vely[i];
      
    }

    fill(255, 231, 152);
    ellipse(posx[i], posy[i], sz, sz);
  }
}



