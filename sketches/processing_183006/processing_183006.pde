
PImage Bg; //FONDO
int KSize = 35; //Tamaño Kirby
color ColBase; //Color Kirby
float posX = 100;
float posY = 150;
float vitX = 3;
float vitY = 3;

void setup()
{
  size(400, 300);
  Bg = loadImage ("fondoArbol.png");
  ColBase = color (255, 155, 149);
}

void draw()
{
  //FONDO
  image (Bg, 0, 0, width, height);

  //Movimiento de Kirby
  Kirby(posX, posY);
  posX = posX+vitX;
  posY = posY+vitY;

  if ((posX >= width*2/3-KSize/3) || (posX <= 0+KSize/2))
  {
    vitX = -vitX;
  }

  if ((posY >= height*7/8-KSize/2) || (posY <= 0+KSize/2))
  {
    vitY= -vitY;
  }

  //Reacción Arbol
  if ((posX >= width*2/3-KSize*7/3) && (posX <=width*2/3-KSize/6))
  {
    fill(0);
    noStroke();
    ellipse(300, 140, 13, 23);
    ellipse(280, 140, 13, 23);
    ellipse(290, 200, 13, 23);
  } else if ((posX > width*2/3-KSize/6) || (posY >= height*15/16 - KSize/2)) {
    rectMode(CENTER);
    fill(0);
    rect(290, 140, 40, 3);
    arc(300, 140, 13, 23, 0, PI);
    arc(280, 140, 13, 23, 0, PI);
    ellipse(290, 200, 13, 23);
  } else {
    rectMode(CENTER);
    fill(0);
    rect(300, 140, 15, 3);
    rect(280, 140, 15, 3);
    rect(290, 200, 15, 3);
  }
}


void Kirby (float Kx, float Ky)
{
  //Pies
  strokeWeight(KSize/30);
  stroke(0);
  fill (ColBase-100);
  ellipse(Kx-KSize/3, Ky+KSize/3, KSize/3, KSize/2);
  ellipse(Kx+KSize/6, Ky+KSize/3, KSize/3, KSize/2);
  noStroke();
  ellipse(Kx+KSize/12, Ky+2/60, KSize/8, KSize/18);

  //Cuerpo y Manos
  fill (ColBase);
  stroke(0);
  ellipse(Kx, Ky, KSize, KSize);
  noStroke();
  ellipse(Kx- KSize/3, Ky-KSize/3, KSize/3, KSize/3);
  ellipse(Kx+ KSize/3, Ky-KSize/3, KSize/3, KSize/3);

  //Ojos, Boca y Cachetes
  fill(255);
  noStroke();
  ellipse(Kx+KSize/3, Ky-KSize/6, KSize/12, KSize/5);
  ellipse(Kx+KSize/6, Ky-KSize/6, KSize/12, KSize/5);
  fill(0);
  ellipse(Kx+KSize*17/48, Ky-KSize/8, KSize/18, KSize/8);
  ellipse(Kx+KSize*9/48, Ky-KSize/8, KSize/18, KSize/8);
  fill(0);
  ellipse(Kx+KSize*13/48, Ky-KSize/60, KSize/25, KSize/25);
  fill (ColBase-100);
  ellipse(Kx+KSize/12, Ky-KSize*2/60, KSize/8, KSize/18);
  ellipse(Kx+KSize*5/12, Ky-KSize*2/60, KSize/12, KSize/18);

  //Contornos
  strokeWeight(KSize/30);
  stroke(0);
  noFill();
  arc(Kx- KSize/3, Ky-KSize/3, KSize/3, KSize/3, HALF_PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  arc(Kx+ KSize/3, Ky-KSize/3, KSize/3, KSize/3, PI+QUARTER_PI, TWO_PI+QUARTER_PI);
}

void mousePressed()
{
  posX = mouseX;
  posY = mouseY;
  ColBase =color(random(155, 255), random(55, 155), random(149, 249));
}

//Kirby toma como velocidad inicial una velocidad proporcional a la velocidad a la que se movía el mouse antes de soltar el botón
void mouseReleased()
{
  vitX = (mouseX-pmouseX)/4;
  vitY = (mouseY-pmouseY)/4;
}



