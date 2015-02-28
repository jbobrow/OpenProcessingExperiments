
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim; 
AudioPlayer sonido; 




PImage foto;           //TIPO DE IMAGEN
PImage arma;
int[] coordenadasXinvasor = {int(random(800)), int(random(800)),
                           int(random(800)), int(random(800)),
                           int(random(800))};
int[] coordenadasYinvasor = {0,0,0,0,0};
int diametroInvasor =10;
void setup()
{
  size(800,550);
  foto = loadImage("hielo.jpg");
  arma = loadImage("bola_azul.gif");
  minim=new Minim(this); 
}

void draw()
{
  background(255,255,255);
  image(foto,0,0);
  arma();
  invasores();
   finjuego();
}

//Arma
void arma()
{
  fill(0,255,0);
  stroke(color(0,255,0));
  //triangle(mouseX-8, 530, mouseX, 515, mouseX+8,530);
  //ellipse(mouseX, 530,30,30);
  image(arma,mouseX, 515);
}

void invasores()
{
  stroke(0,0,255);
  fill(255);
  
  for(int i=0;i<5;i++)
  {
     ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);
  }
}

// el disparo
void mousePressed ()//click con el mouse
{
  proyectil(mouseX);//tomamos la posicion de x del disparo
}

void proyectil(int disparoX)
{
  boolean acertar = false;
  for(int i=0;i<5;i++)
  {
    if((disparoX >= (coordenadasXinvasor[i] - diametroInvasor/2)) && 
       (disparoX <= (coordenadasXinvasor[i] + diametroInvasor/2)))
       {
        sonido=minim.loadFile("1.wav",2048); 
        sonido.play();
         acertar = true;
         line(mouseX+20,515,mouseX,coordenadasYinvasor[i]);
         fill(28,59,233);
         ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor+25,diametroInvasor+25);//explota el invasor
         coordenadasXinvasor[i] = int(random(800));
         coordenadasYinvasor[i] = 0;
       }
  }
  if(acertar == false)
  {
    line(mouseX,515,mouseX,0);//el proyectil se va hasta arriba
  }
    
}

//El final
void finjuego()
{
   for(int i=0;i<5;i++)
  {
    if(coordenadasYinvasor[i] == 550)
    noLoop();
  }
}

//es.suvermonkey.com/s/WP8J8RJ


