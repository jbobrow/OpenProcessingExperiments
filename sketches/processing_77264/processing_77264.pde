
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int[] cordenadasXinvasor={int(random(400)), int(random(400)), int(random(400)), int(random(400)),int(random(400))};
int[] cordenadasYinvasor={0,0,0,0,0};
int diametroinvasor=40;
PImage fondo;
PImage nave;
PImage invasor;
PFont over;
String cadena;
int cont=0;
Minim disparo;
AudioPlayer reproductor1;
void setup()
{ 
  size(400,400);
  fondo=loadImage("space.jpg");
  nave=loadImage("nave.png");
  invasor=loadImage("invasor.gif");
  over=createFont("Serif",32);
  textFont(over,32);
  disparo= new Minim(this);
  reproductor1=disparo.loadFile("disparo.WAV");
}
void draw()
{
  background(fondo);
  arma();
  invasores();
  finjuego();
  text("Destroyed:"+cadena,15,15);
  textSize(20);
}
void arma()
{
  image(nave,mouseX-22,350);
}
void invasores()
{
  stroke(255);
  fill(255);
  for(int i=0; i<5; i++)
  {
       image(invasor,cordenadasXinvasor[i],cordenadasYinvasor[i]+=2); 
  }
}
void mousePressed()
{
   proyectil(mouseX);
}
void proyectil(int disparoX)
{
  boolean acertar = false;
  strokeWeight(4);
  stroke(93,193,185);
  for(int i=0; i<5; i++)
  {
    if((disparoX>=(cordenadasXinvasor[i]-diametroinvasor/2))&&(disparoX<=(cordenadasXinvasor[i]+diametroinvasor/2)))
    {
      acertar = true;
      line(mouseX,350,mouseX,cordenadasYinvasor[i]);
      fill(255,255,0);
      ellipse(cordenadasXinvasor[i],cordenadasYinvasor[i],diametroinvasor+10,diametroinvasor+10);
      cordenadasXinvasor[i]=int(random(400));
      cordenadasYinvasor[i]=0;
      cont=cont+1;
      cadena=Integer.toString(cont);
      
    }
    if(acertar==false)
    {
       reproductor1.play();
      line(mouseX,350,mouseX,0);
    }
  }
}
void finjuego()
{
  for(int i=0; i<5;i++)
  {
    if(cordenadasYinvasor[i]>=400)
    { 
      disparo.stop();
      noLoop();
      text("GAME OVER",165,200);
      
    }
  }
}













