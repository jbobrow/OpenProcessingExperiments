
int SizGal= 30;
int CantKirby = 60;
float[] posGX = new float[CantKirby];
float[] posGY = new float[CantKirby];
float[] vitGX = new float[CantKirby];
float[] vitGY = new float[CantKirby];
int KSize ; //Tamaño Kirby
color ColBase; //Color Kirby
color corral = color(219, 186, 51);

PImage Link;


int SizLink;
int TamHierba = 10;

int[][] ColorHierba;

void setup()
{
  size(600, 600);
  ColBase = color (255, 155, 149);
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
  for (int i = 0; i < CantKirby; i++)
  {
    posGX[i] = random(35, 570);
    posGY[i] = random(35, 570);
    vitGX[i] = random(-5, 5);
    vitGY[i] = random(-5, 5);
  }

}


void draw()
{
  noStroke();
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
  //Gallinas
  GalHoras();
  //Link
  noCursor();
  image(Link, mouseX, mouseY, SizLink, SizLink);

  //movimiento Kirbys
  for (int i = 0; i < minute(); i++)
  {
    //Movimiento General
    posGX[i] += vitGX[i];
    posGY[i] += vitGY[i];
    //Rebotes paredes
    if (( posGX[i] <= 35+KSize/2) || ( posGX[i] >= 570-KSize/2))
    {
      vitGX[i] = -vitGX[i];
    }
    if (( posGY[i] <= 35+KSize/2) || (posGY[i] >= 570-KSize/2))
    {
      vitGY[i] = -vitGY[i];
    }
    //Creación de Kirby
    Kirby(posGX[i], posGY[i]);


  }
}
void Kirby (float Kx, float Ky)
{
  KSize= second();
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

void GalHoras()
{
  if ((hour()>=1) && (hour()<24)) 
  {
    Gallina(580, 100);
  }
  if ((hour()>=13) && (hour()<24)) 
  {
    Gallina(20,20);
  }
 
  if ((hour()>=2) && (hour()<24))
  {
    Gallina(260,20);
  }
  if ((hour()>=14) && (hour()<24)) 
  {
    Gallina(20,100);
  }
  if ((hour()>=3) && (hour()<24))
  {
    Gallina(580,340);
  }
  if ((hour()>=15) && (hour()<24)) 
  {
    Gallina(580,260);
  }
  if ((hour()>=4) && (hour()<24))
  {
    Gallina(260,580);
  }
  if ((hour()>=16) && (hour()<24))
  {
    Gallina(20,420);
  }
  if ((hour()>=5) && (hour()<24))
  {
    Gallina(340,20);
  }
  if ((hour()>=17) && (hour()<24)) 
  {
    Gallina(580,580);
  }
  if ((hour()>=6) && (hour()<24)) 
  {
    Gallina(20, 500);
  }
  if((hour()>=18) && (hour()<24)) 
  {
    Gallina(580,20);
  }
  if ((hour()>=7) && (hour()<24))
  {
    Gallina(100,580);
  }
  if ((hour()>=19) && (hour()<24)) 
  {
    Gallina(340,580);
  }
  if ((hour()>=8) && (hour()<24))
  {
    Gallina(500,20);
  }
  if((hour()>=20) && (hour()<24)) 
  {
    Gallina(20,580);
  }
 
  if ((hour()>=9) && (hour()<24))
  {
    Gallina(20,260);
  }
  if ((hour()>=21) && (hour()<24))
  {
    Gallina(500,580);
  }
  if ((hour()>=10) && (hour()<24))
  {
    Gallina(180,580);
  }
  if ((hour()>=22) && (hour()<24)) 
  {
    Gallina(180,20);
  }
  if ((hour()>=11) && (hour()<24))
  {
    Gallina(100,20);
  }
  if((hour()>=23) && (hour()<24)) 
  {
    Gallina(420,580);
  }
  if ((hour()>=12) && (hour()<24))
  {
    Gallina(580,420);
  }
  if((hour()>=24) && (hour()<1)) 
  {
    Gallina(20,340);
  }
}


