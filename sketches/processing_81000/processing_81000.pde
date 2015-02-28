
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float ancho=0, x=0, L=0;

void setup()
  {
    size(500,500);
    smooth();
    frameRate(15);
    minim = new Minim(this);
    in = minim.getLineIn(Minim.MONO,512);
  }

void draw()
  {
    background(#FA6BCC);
    float m=0;
    
    for(int i=0; i < in.bufferSize()-L; ++i)
      if(abs(in.mix.get(i)) > m)
          m=abs(in.mix.get(i));
    
    ancho = (m*500)+5;
    
    if(ancho*0.09 > 4.0)
      L += ancho*0.09;
  
    globo(L);
  }

void globo(float a)
  {
    strokeWeight(1);
    if(a < 300)
    {
      fill(#0000FF);
      noStroke();
      ellipse(250,250,150+a,200+a);
      hilo(a/2);
    }
   else
     inflado(0,10);
  }

void hilo(float a)
  {
    noFill();
    stroke(#000000);
    strokeWeight(2);
    bezier(250, 350+a, 200, 375+a, 400, 375+a, 250, 450+a);
    fill(#0000FF);
    ellipse(250,350 + a, 20, 10);
  }

void inflado( int x, int y)
  {
    PImage inflado;
    inflado = loadImage("globo.png");
    image(inflado, x, y);
  }


