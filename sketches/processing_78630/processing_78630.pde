
import ddf.minim.*;
PImage mi_imagen;
AudioPlayer musica;
Minim minim;
int x=0;
int y=0;

void setup()
{
  size(500,350);
  mi_imagen=loadImage("Terror.jpg");
  
  minim=new Minim(this);
  musica=minim.loadFile("exorcista.mp3",2048);
  musica.play();
  frameRate(6);
}

void draw()
{
 if(mousePressed)
 {
   if(x==0)
   {
     x=1;
   }
   else
   {
     x=0;
   }
 }
 if(x==0)
  {
    image(mi_imagen,0,0,(mi_imagen.width+14)/2,(mi_imagen.height+14)/2); 
    text("Bienvenido",115,50); 
     text("a la ",185,90);
     text("zona del terror",90,130);
  }
  else
  {
    y=(int)random(0,14);
     image(mi_imagen,-7+y,-7+y,(mi_imagen.width+14)/2,(mi_imagen.height+14)/2);  
     
  }
}

void keyPressed()
{
  if(key=='p'||key=='P')
  {
    musica.pause();
  }
  if(key=='c'||key=='C')
  {
    musica.play();
  }
}


void stop()
{
  musica.close();
  minim.stop();
  super.stop();
}

