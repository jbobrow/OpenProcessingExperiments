
//Torres Torres Felipe Andrés
//Hernandez Cruz Yanahui

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//El escenario

PImage foto, nave, ovni;
PFont letra;
char[] perdiste = {'P','E','R','D','I','S','T','E'};
char[] ganaste = {'G','A','N','A','S','T','E'};
int cuenta=0;
Minim minim;
AudioPlayer disparo;

void setup()
{
  size(500,500);
  minim = new Minim(this);
  letra = loadFont("ComicSansMS-48.vlw");
  smooth();
  textFont(letra);
  textSize(50);
  
  foto = loadImage("fondo.jpg");
  nave = loadImage("nave.jpg");
  ovni = loadImage("ovni.png");
}

void draw()
{
  background(0);
  image(foto,0,0);
  arma();
  invasores();
  finjuego();
  text(cuenta,400,400);
}

//El arma
void arma()
{
image(nave,mouseX,460);
}

//Invasores
int[] coordenadasXinvasor = { int(random(470)), int(random(470)),
                              int(random(470)),int(random(470)),
                              int(random(470))
                              };
int[] coordenadasYinvasor = {0,0,0,0,0};
int diametroInvasor = 60;

int r,g,b;

void invasores()
{
  stroke(255);
  for(int i=0; i<5; i++)
  {
     image(ovni,coordenadasXinvasor[i],coordenadasYinvasor[i]++);
  }
}

//El disparo (!clic en el mouse)
void mousePressed()
{
  disparo=minim.loadFile("disparo.wav",2048); 
      disparo.play();
  proyectil(mouseX);//tomamos la posicion x del disparo(de mouse)
}

//Proyectil
void proyectil(int disparoX)
{
  boolean acertar = false;
  for(int i=0; i<5; i++)
  {
    if((disparoX >= (coordenadasXinvasor[i] - diametroInvasor/2))
    && (disparoX <= (coordenadasXinvasor[i] + diametroInvasor/2)))
    {
      acertar = true;
      line(mouseX,465, mouseX, coordenadasYinvasor[i]);    
     
      ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i]++,
    diametroInvasor+25, diametroInvasor+25);//explota
    
    coordenadasXinvasor[i] = int(random(500));
    coordenadasYinvasor[i] = 0; 
   
   cuenta++;
     
    if(cuenta == 10)
     {
       noLoop();
        int x=100;
      for(int j=0; j<7; j++)
      {
        fill(0,255,0);
          text(ganaste[j],x,250);
          x +=40;
      }     
     }  
    
    }
  }
  if(acertar == false)
  {
    line(mouseX,465,mouseX,0);//Falló, el proyectil se va hasta arriba
  }
}

void finjuego()
{
  for(int i=0; i<5; i++)
  {
    if(coordenadasYinvasor[i] == 480)
    {
      noLoop();
      int x=100;
      for(int j=0; j<8; j++)
      {
        fill(255,0,0);
          text(perdiste[j],x,250);
          x +=40;
      }
      
    }
  }
}

