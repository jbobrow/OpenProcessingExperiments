
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioInput in;

float ancho=0, alto=0;
float m=0;
int i=0;

void setup()
{
  size(500,500); 
  smooth();
  frameRate(10);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
}
 
void globo()
{
  fill(255);
  noStroke();
  ellipse(250,250,ancho+20,alto+50);
  stroke(255);
  noFill();
  bezier(250,250+(alto/2),250,350+(alto/2),200,400+(alto/2),250,500+(alto/2));
} 
void inflar()
{
  for(int i=0;i<in.bufferSize()-1;i++)
    if(abs(in.mix.get(i))>m)
     m+=0.001;
} 
void draw()
{
  i++;
  background(#5FD3FF);
  if(ancho<450)
  {
    globo();
    inflar();
  }
  else
  {
    stroke(0);
    fill(0);
    ellipse(250+i,250+i,1+i/10,1+i/10);
    ellipse(250+i,250,1+i/10,1+i/10);
    ellipse(250,250+i,1+i/10,1+i/10);
    ellipse(250-i,250-i,1+i/10,1+i/10);
    ellipse(250-i,250,1+i/10,1+i/10);
    ellipse(250,250-i,1+i/10,1+i/10);
    ellipse(250-i,250+i,1+i/10,1+i/10);
    ellipse(250+i,250-i,1+i/10,1+i/10);
  }
  ancho=int(m*500);
  alto=int(m*500);
}
//// m=abs(in.mix.get(i));

