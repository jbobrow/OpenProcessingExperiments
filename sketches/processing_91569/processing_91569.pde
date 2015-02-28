
PImage fondo;
//PFont fuenteTitulo;
String[] letra;
Letra[][] caracter;
String titulo;
int lineas, porLinea;
int posX, posY;

void setup()
{
  size(1250, 750);
  background(0);
  fondo = loadImage("fondo.jpg");
  //fuenteTitulo = loadFont("HiraKakuPro-W6-50.vlw");
  titulo = "COLDPLAY \nCHRISTMAS LIGHTS";
  
  posX = 540;
  posY = height-15;
  letra = loadStrings("ChristmasLights.txt");
  lineas = (letra.length);  
  caracter = new Letra[lineas][65];
  
  for(int i=lineas-1; i>=0; i--)
  //for(int i=0; i<lineas; i++)
  {
    posY = posY - 20;
    posX = 540;
    for(int j=0; j<letra[i].length(); j++)
    {
      caracter[i][j] = new Letra(letra[i].charAt(j), posX, posY);
      //posX = posX + (int)textWidth(letra[i].charAt(j));
      posX = posX + 10;     
    }
  }  
}

void draw()
{
  background(18, 18, 14);
  image(fondo, 0, height-660, 530, 655);
  
  fill(101, 85, 249, 200);
  //textFont(fuenteTitulo, 35);
  textSize(35);
  textAlign(CENTER);
  text(titulo, 190, 85);
  
  for(int i=0; i<lineas; i++)
  {
    for(int j=0; j<letra[i].length(); j++)
    {
      caracter[i][j].pintar();
      caracter[i][j].mover();
    }
  }
  
}
class Letra
{
  float posXact, posYact, posXfin, posYfin, acel;
  //PFont fuente;
  char letraPintar;
 
  Letra(char letra, int posxF, int posyF)
  {    
    letraPintar = letra;    
    //fuente = loadFont("Papyrus-Condensed-20.vlw");
    posXact = posxF;
    posYact = random(0, 25);
    posXfin = posxF;
    posYfin = posyF;
    acel = random(1, 4.5);
  }
  
  void pintar()
  {    
    fill(255);
    //textFont(fuente, 15);
    textSize(15);
    text(letraPintar, posXact, posYact);
  }
  
  void mover()
  {
    posXact = (int)random(posXfin-5, posXfin+5);
    if(posYact < posYfin)
    {
      posYact = posYact + acel;
    }
    else
    {
      posXact = posXfin;
      posYact = posYfin;
    }
  }
}
class Letras
{
  int posXact, posYact, posXfin, posYfin;
  //PFont fuente;
  
  Letras()
  {    
    posYact = (int)random(0, 25);
    //fuente = loadFont("Papyrus-Condensed-20.vlw");
  }
  
  void pintar(char caracter, int posX, int posY)
  {  
    posXfin = posX;
    posYfin = posY;
    
    fill(255);
    //textFont(fuente, 20);
    textSize(20);
    text(caracter, posXact, posYact);
  }
  
  void mover()
  {
    posXact = (int)random(posXfin-5, posXfin+5);
    if(posYact < posYfin)
    {
      println(caracter+" - "+posYact+" - "+posYfin);
      posYact++;
    }
    else
    {
      //println(caracter+" - "+posYact+" - "+posYfin);
      posXact = posXfin;
      posYact = posYfin;
    }
  }
}


