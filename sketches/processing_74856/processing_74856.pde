

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;

AudioInput in;
float ancho=0 , inflado=0;
PFont tipo_letra;
 
 

     void setup()
     {
       
      size(500,500);
      smooth();
      stroke(255,0,0);
      frameRate(25);
      minim=new Minim(this);
      in=minim.getLineIn(Minim.MONO,512);
      
     }


   void draw()
   {
       background(0);
       tipo_letra=createFont("SansSerif",48);
textFont(tipo_letra);
     
   float m=0;
       for(int i=0;i < in.bufferSize()-1;i++)
       {
         if(abs(in.mix.get(i))>m)
         {
            m  = abs(in.mix.get(i));
            }
       }
   
     if(inflado<=250){
      ancho = (m)  ;
      inflado+=ancho;
     
      strokeWeight(inflado);
      
      ellipse(250,250,inflado ,inflado );
      println(ancho);
     }
      else
      {
        text("¡¡BUM!!",200,250);
      }
   
      
     
}


