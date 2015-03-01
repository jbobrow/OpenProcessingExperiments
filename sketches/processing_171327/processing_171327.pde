
PImage meme;
PImage fondo;
int total = 100;
float volar= 0.1;
// ES EL VALOR QUE LE ASIGNO PARA PODER SUMAR EN EL DRAW
float[] posX = new float[total];
float[] posY = new float[total];
String[] loco  = {
  "PROGRAMAR", "EN", "PROCESSING", "ME", "ESTA", "VOLVIENDO","MAS", "LOCO", "QUE", "UNA", "CABRA", ""};
int contador=0;

void setup() {
  size(800, 800);
  meme = loadImage ("meme.png");
  fondo = loadImage ("fondo.png");
  //noCursor();
  cursor(HAND);
  textSize(80);
  for (int i=0; i<total; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
  }
} 

void draw() 
{ 
  imageMode(CORNER);
  image(fondo, 0, 0);
  volar += volar; // VOLAR SE INCREMENTA POR SU VALOR SI ES 0.1 + 0.1 = 0.2
  if (volar > 30){
   volar = 30; // EL IF LE DICE QUE SI ES MAYOR A 30 LO IGUALE PARA QUE NO SE PIERDA DE LA PANTALLA
  }
  for (int i=0; i<total; i++) {
    posX[i] += random(-volar,volar);
    posY[i] += random(-volar,volar);
    imageMode(CENTER);
    frameRate (3);
    image(meme, posX[i], posY[i]);
  }
}

void mousePressed() {
  text(loco[contador], mouseX, mouseY);
   if (contador<loco.length-1) {
    contador++;
  }
}


