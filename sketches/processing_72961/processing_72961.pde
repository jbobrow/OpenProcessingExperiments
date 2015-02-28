
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
AudioPlayer explosion;
float ancho=0.0;
int expl=0;
PImage imagen;

void setup()
{
  size(500,500);
  smooth();
  stroke(0,0,0);
  frameRate(15);
  imagen=loadImage("boom.jpg");
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512); 
  explosion=minim.loadFile("boom.mp3",2048);
}

void draw()
{
  background(116,137,240);
  float m=0;
  for(int i=0;i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>m)
    {
      m=abs(in.mix.get(i));
    }
  }  
  //point(random(0,500),random(0,500));
  ancho+=(m*20);
  fill(255,0,0);
  strokeWeight(2);
  if(ancho<230&&expl==0)
  {
    ellipse(250,250,ancho+50,1.3*ancho+70);
    beginShape(POLYGON);
      fill(116,137,240);
      curveVertex(300,300); 
      curveVertex(250,285+(1.3*ancho)/2); 
      curveVertex(250,325+(1.3*ancho)/2); 
      curveVertex(350,350+(1.3*ancho)/2); 
      curveVertex(250,375+(1.3*ancho)/2); 
    endShape();
  }
  else if(ancho<235&&ancho>230)
  {
      expl=1;
      background(255,0,0);
      ellipse(250,250,ancho,ancho+30);
      image(imagen,165,196,imagen.width/2,imagen.height/2);
      explosion.play();
  }
}

