
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int posx=250;
int dir=0; 
void setup()
{
  size(500,500);
  background(255);
  smooth();
  frameRate(10);
}
void draw()
{
   if(dir==0)
   {
     background(255);
     stroke(255,0,0);
     fill(255,0,0);
     ellipse(posx,250,30,30);
     posx=posx+10;
     if(posx==480)
     {
         Minim audioperro;
         AudioPlayer reproductor1;
         audioperro= new Minim(this);
         reproductor1=audioperro.loadFile("perro.wav");
         reproductor1.play();
         audioperro.stop();
         dir=1;
     }
   }
   else
   {
      background(255);
      stroke(255,0,0);
      fill(255,0,0);
      ellipse(posx,250,30,30);
      posx=posx-20;
     if(posx==20)
     {
         Minim audiogato;
         AudioPlayer reproductor2;
         audiogato= new Minim(this);
         reproductor2=audiogato.loadFile("gato.wav");
         reproductor2.play();
         audiogato.stop();
         dir=0;
     }
   }
}

