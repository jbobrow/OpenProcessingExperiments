
// Cruz Martinez Julia Yesika
//Globo
 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioInput in;
float ancho=0;
float n=0;
float m=0;
PImage imagen;
PFont font1;

void setup()
{
  size(500,500);
  font1 = loadFont ("Candara-48.vlw");
  textFont (font1);
  smooth();
  frameRate(15);
  imagen=loadImage("globo.jpg");
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
}
  
void globo()
{
  fill(255,0,255);
  noStroke();
  ellipse(250,250,ancho+50,1.3*ancho+70);
  stroke(250);
  noFill();

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
void draw()
{

  if(ancho<450)
  {
    background(0,255,255);
    fill(255,0,255);
    ellipse(250,250,ancho+150,1.5*ancho+200);
    fill(0,0,255);
   font1 = loadFont ("Candara-48.vlw");
  textFont (font1);
  text ("Y e s  i ", 190, 220, mouseX, 200);
}
  ancho=int(m*500);
 
  println(ancho);
    fill(0);
      strokeWeight(4);
  bezier(250,350,300,350,200,400,250,500);
}

  
 
   

