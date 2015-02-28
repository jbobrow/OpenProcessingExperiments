
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Torres Torres Felipe Andrés
//Hernandez Cruz Yanahui

Minim minim;
AudioPlayer ladra;
AudioPlayer miau;

int x=51;
float dx = 5;

void setup()
{
  size (500,500); 
  minim=new Minim(this);
  smooth();
  frameRate(20);
}
void draw ()
{  
   background(255,255,110);  
   pelota();
}

void pelota()
{ 
  if(x >= 450 || x<= 50)
     {
       dx *= -1;
       if(x==450)
         {
           ladra=minim.loadFile("ladra.wav",2048);
           ladra.play();
         }
         if(x==50)
         {
           miau=minim.loadFile("miau.wav",2048);
           miau.play();         
         }
     }
            x += dx;
            
   ellipse(x,250,50,50);
}


