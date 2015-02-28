


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioInput in;
float ancho=0 , j=0;
PFont letra;
  
  
 
     void setup()
     {
        
      size(500,500);
      smooth();
      stroke(255,0,0);
      frameRate(300);
      minim=new Minim(this);
      in=minim.getLineIn(Minim.MONO,512);
       letra=loadFont("AngsanaNew-Italic-48.vlw");
     }
 
 
   void draw()
   {
       background(255);
      
   float m=0;
       for(int i=0;i < in.bufferSize()-1;i++)
       {
         if(abs(in.mix.get(i))>m)
         {
            m  = abs(in.mix.get(i));
            }
       }
    
     if(j<=250){
      ancho = (m)  ;
      j+=ancho;
      strokeWeight(j);
       
      ellipse(250,250,j ,j );
      println(ancho);
     } else{
    frameRate(100);
    background(0,255,255);
    fill(0,255,255);
    textFont(letra,30);
    text("y ya te exploto jiji!!!",100,150); 
  }
    
    
       
      
}

