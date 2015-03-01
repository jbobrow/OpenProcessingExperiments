
int CantGallinas = 150;
float[] posGX = new float[CantGallinas];
float[] posGY = new float[CantGallinas];
float[] vitGX = new float[CantGallinas];
float[] vitGY = new float[CantGallinas];

color corral = color(219, 186, 51);

PImage Link;

int SizGal;
int SizLink;
int TamHierba = 10;

int[][] ColorHierba;

void setup()
{
  size(600, 600);
  SizGal = 20;
  SizLink = 100;
  ColorHierba = new int[width/TamHierba][height/TamHierba];
  Link = loadImage("Linko.png");
  //fondo hierba
  for (int k = 0; k < width/TamHierba; k++)
  {
    for (int l = 0; l < height/TamHierba; l++)
    {
      int verde = int(random(100, 130));
      ColorHierba[k][l] = verde;
    }
  }
  //Posición Gallinas Inicial
  for (int i = 0; i < CantGallinas; i++)
  {
    posGX[i] = random(35, 570);
    posGY[i] = random(35, 570);
    vitGX[i] = random(-10, 10);
    vitGY[i] = random(-10, 10);
  }
}


void draw()
{
  //FondoHierba
  for (int k = 0; k< width/TamHierba; k++)
  {
    for (int l = 0; l <height/TamHierba; l++)
    {
      fill(35, ColorHierba[k][l], 35);
      rect(k*TamHierba, l*TamHierba, TamHierba, TamHierba);
    }
  }
  //Corral
  noStroke();
  fill(corral);
  rect(20, 20, 10, 560);
  rect(580, 20, 10, 560);
  rect(20, 20, 560, 10);
  rect(20, 580, 570, 10);

  for (int i=10; i < 580; i += 80)
  {
    fill(185, 157, 41);
    rect(i, 10, 25, 25);
    rect(10, i, 25, 25);
    rect(i, 570, 25, 25);
    rect(570, i, 25, 25);
  }
  //Link
  noCursor();
  image(Link, mouseX, mouseY, SizLink, SizLink);

  //movimiento gallinas
  for (int i = 0; i < CantGallinas; i++)
  {
    //Movimiento General
    posGX[i] += vitGX[i];
    posGY[i] += vitGY[i];
    //Rebotes paredes
    if (( posGX[i] <= 35+SizGal/2) || ( posGX[i] >= 570-SizGal/2))
    {
      vitGX[i] = -vitGX[i];
    }
    if (( posGY[i] <= 35+SizGal/2) || (posGY[i] >= 570-SizGal/2))
    {
      vitGY[i] = -vitGY[i];
    }
    //Creación de Gallinas
    Gallina(posGX[i], posGY[i]);

    //ReboteIzquierdaLink
    if ((posGY[i] >= mouseY) && (posGY[i] <= mouseY+SizLink)&&(posGX[i] >= mouseX - 2*SizGal))
    {
      vitGX[i] = -vitGX[i];
    }
    //Rebote derecha Link
    if ((posGY[i] >= mouseY) && (posGY[i] <= mouseY+SizLink)&&(posGX[i] >= mouseX + SizLink + 2*SizGal))
    {
      vitGX[i] = -vitGX[i];
    }
    //Rebote Arriba Link
    if ((posGX[i] >= mouseX) && (posGX[i] <= mouseX+SizLink)&&(posGY[i] >= mouseY - 2*SizGal))
    {
      vitGY[i] = -vitGY[i];
    }
    //Rebote Abajo Link
    if ((posGX[i] >= mouseX) && (posGX[i] <= mouseX+SizLink)&&(posGY[i] >= mouseY +SizLink + 2*SizGal))
    {
      vitGY[i] = -vitGY[i];
    }
  }
}
void Gallina (float gX, float gY)
{
  noStroke(); 
  //pico
  fill(245, 161, 52); 
  triangle(gX-SizGal/4, gY-SizGal/3, gX, gY-SizGal*3/4, gX+SizGal/4, gY-SizGal/3); 
  //base cuerpo
  fill(255); 
  ellipse(gX, gY, SizGal, SizGal); 
  //cola
  beginShape(); 
  vertex(gX-SizGal/4, gY+SizGal/3); 
  vertex(gX-SizGal*3/8, gY+SizGal*3/4); 
  vertex(gX, gY+SizGal*3/8); 
  vertex(gX+SizGal*3/8, gY+SizGal*3/4); 
  vertex(gX+SizGal/4, gY+SizGal/3); 
  endShape(CLOSE); 
  //ojos
  fill(0); 
  ellipse(gX-SizGal/4, gY-SizGal/4, SizGal/15, SizGal/6); 
  ellipse(gX+SizGal/4, gY-SizGal/4, SizGal/15, SizGal/6); 
  //cresta
  fill(232, 37, 37); 
  ellipse(gX, gY+SizGal/10, SizGal/8, SizGal/3); 
  ellipse(gX, gY-SizGal/10, SizGal/8, SizGal/3);
}



