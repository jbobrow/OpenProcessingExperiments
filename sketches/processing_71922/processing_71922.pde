
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int Tx=500,Ty=500;
int exploto=0;

Minim minim;         //

AudioInput entrada;  //declaramos una variable de tipo audio entrada

float ancho=0.0;

void setup()
{
  size(Tx,Ty);   
  smooth();        
  stroke(0,200,0);
  fill(0,200,0);
  frameRate(5);
  minim=new Minim(this);   //variable minim del objeto Minim
  entrada = minim.getLineIn(Minim.MONO,512);
}

void draw()
{
  background(0);
  
  float m=0;
  for(int i=0; i<entrada.bufferSize()-1;i++)
     {
      if(abs(entrada.mix.get(i))>m) 
         m=abs(entrada.mix.get(i));
     }
  ancho=ancho+(m*50);
  
  strokeWeight(3);
  if(ancho<400 && exploto!=1)
    {fill(0,200,0);
     ellipse(Tx/2,Ty/2,15+ancho,80+ancho);     
    }
  else
    {
     exploto=1;  
     background(0);
    } 
   noFill();
   bezier(Tx/2,Ty,(Tx/2)-30,Ty/2+30,(Tx/2)+30,Ty-30,Tx/2,Ty/2); 
  
  if(exploto==1)
    { 
     exploto=0;   
     ancho=0.0;
     fill(0,200,0);
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));
     explosion(random(0,500),random(0,500));

     }
   
  println(ancho);   
  
}

void explosion(float x,float y)
{
  ellipse(x,y,random(0,40),random(0,15));
}

