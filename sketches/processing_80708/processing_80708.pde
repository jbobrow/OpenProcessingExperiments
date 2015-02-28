

/// AUDIO CIRCULO  ///

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
int Tx=600;
int Ty=600;
float r=50;
float ang_rand;
 
Minim minim;         
 
AudioInput entrada;  
 
 
void setup()
{
  size(600,600);
  noFill();
  strokeWeight(2);
  smooth();
  background(0);
  frameRate(5);
  minim=new Minim(this);  
  entrada = minim.getLineIn(Minim.MONO,512);
 
}
void draw()
{ background(#03FC2A);
   
  float m=0.0;
   
  for(int i=0; i<entrada.bufferSize()-1;i++)
     {
      if(abs(entrada.mix.get(i))>m)
         m=abs(entrada.mix.get(i))*5;
     }
   
  circulo(r,m);
   
  stroke(random(10,m*20),random(10,m*20),random(10,m*20));
  ang_rand=random(0,m);
  bezier((Tx/2)+r*cos(ang_rand)                   ,(Ty/2)+r*sin(ang_rand),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         (Tx/2)+r*cos(ang_rand+PI)                ,(Ty/2)+r*sin(ang_rand+PI));
   
  stroke(random(10,m*20),random(10,m*20),random(10,m*20));
  ang_rand=random(0,m);
  bezier((Tx/2)+r*cos(ang_rand)                   ,(Ty/2)+r*sin(ang_rand),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         (Tx/2)+r*cos(ang_rand+PI)                ,(Ty/2)+r*sin(ang_rand+PI));
          
   
  stroke(random(10,m*20),random(10,m*20),random(10,m*20));
  ang_rand=random(0,m);
  bezier((Tx/2)+r*cos(ang_rand)                   ,(Ty/2)+r*sin(ang_rand),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         (Tx/2)+r*cos(ang_rand+PI)                ,(Ty/2)+r*sin(ang_rand+PI));
   
  stroke(random(10,m*20),random(10,m*20),random(10,m*20));
  ang_rand=random(0,m);
  bezier((Tx/2)+r*cos(ang_rand)                   ,(Ty/2)+r*sin(ang_rand),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         random((Tx/2)-m,(Tx/2)+r*cos(ang_rand)+m),random((Ty/2)-m,(Ty/2)+r*sin(ang_rand)+m),
         (Tx/2)+r*cos(ang_rand+PI)                ,(Ty/2)+r*sin(ang_rand+PI));       
   
        
   
}
void circulo(float r,float m)
{
  float ang=0.0;
   
  stroke(random(20,m*20),random(20,m*20),random(20,m*20));
  for(ang=0.0; ang<=2*PI; ang+=.01)
      {
        line((Tx/2)+r*cos(ang),(Ty/2)+r*sin(ang),(Tx/2)+r*cos(ang),(Ty/2)+r*sin(ang));
      } 
}

