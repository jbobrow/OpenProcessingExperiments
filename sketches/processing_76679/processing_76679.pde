
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer musica;
Minim minim;

float x1=0,x2=0;
float y1=0,y2=0;
float y3=0,y4=0;


void setup()
{
  size(550,550); 
  smooth();
  minim=new Minim(this);
  musica=minim.loadFile("cancion.mp3");
  musica.play();
  frameRate(3);
}

void draw()
{
  background(0);
  noFill();
  for(int i=0;i<musica.left.size()-1;i++)
  {
    x1=abs(musica.left.get(i))*500+75;
    x2=475-abs(musica.right.get(i))*500;
   } 
   if(x1>275)
   {
     x1=275;
   }
   if(x2<275)
   {
     x2=275;
   }
   
   println(x1+"  "+x2);
  strokeWeight(10);
  stroke(255,0,0);
  ellipse (275,275,400,400);
  y1=sqrt(40000-pow(x1-275,2))+275;
  y2=sqrt(40000-pow(x2-275,2))+275;
  y3=-sqrt(40000-pow(x1-275,2))+275;
  y4=-sqrt(40000-pow(x2-275,2))+275;
  strokeWeight(3);
  bezier(x1,y1,175,275,375,275,x2,y4);
  bezier(x2,y2,175,275,375,275,x1,y3);
  strokeWeight(10);
  stroke(255);
  point(x1,y1);
  stroke(0,255,0);
  point(x2,y2);
  stroke(0,0,255);
  point(x1,y3);
  stroke(0,255,255);
  point(x2,y4);
}


