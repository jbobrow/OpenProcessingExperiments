
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float ancho=0, alto=0;
float m=0;
int conf2;
color verde,rojo,azul,amarillo,verdeazul,morado;

//Minim miaudio;
//AudioPlayer miRep;




void setup()
{
  size(500,500);
  conf2=100;
 
  smooth();
  frameRate(10);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
 // miaudio=new Minim(this);
   rojo=color(255,0,0);
   verde=color(0,255,0);
   azul=color(0,0,255);
   amarillo=color(255,255,0);
   verdeazul=color(0,255,255);
   morado=color(255,0,255);
   //miaudio=new Minim(this);
    //miRep=miaudio.loadFile("LasMananitas.mp3");
}

void globo()
{
  fill(0,0,255);
  noStroke();
  ellipse(250,250,ancho+50,alto+100);
  stroke(255);
  noFill();
  bezier(250,300+(alto/2),250,350+(alto/2),200,400+(alto/2),250,400+(alto/2));
}

void inflado()
{
  for(int i=0;i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>m)
    {
      m=abs(in.mix.get(i));
    }
  }

}  

void confeti(int conf1)
{
  int conf=conf1;
  noStroke();
  fill(rojo);
  ellipse(100,conf, 50,50);
  fill(azul);
   ellipse(200,conf, 50,50);
  fill(verde);
   ellipse(300,conf, 50,50);
  fill(amarillo);
  ellipse(400,conf, 50,50);
   fill(morado);
   ellipse(150,conf+50, 50,50);
    fill(verdeazul);
   ellipse(250,conf+50, 50,50);
   fill(rojo);
  ellipse(350,conf+50, 50,50);
  fill(azul);
   ellipse(450,conf+50, 50,50);
  fill(azul);
   ellipse(50,conf+50, 50,50);
  fill(verde);
   ellipse(100,conf+100, 50,50);
  fill(amarillo);
  ellipse(200,conf+100, 50,50);
   fill(morado);
   ellipse(300,conf+100, 50,50);
    fill(verdeazul);
   ellipse(400,conf+100, 50,50);
}

void draw()
{
  
  background(0);
  if(ancho<450)
  {
  globo();
  inflado();
  }
  else
  {
   // miRep.play();
    confeti(conf2);
    confeti(conf2+160);
    confeti(conf2+320);
    if(conf2>=500)
    {
     conf2=-500;
    }
    conf2+=10;
    //miaudio.stop();
  }
  ancho=int(m*500);
  alto=int(m*500);
  
  println(conf2);
  println(ancho);
 // println(alto);
 
}

