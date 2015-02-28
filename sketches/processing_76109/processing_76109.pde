
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
float a=0,b=0,c=0;
int i=0;
Minim miaudio;
AudioPlayer reproductor;
void setup()
{
  size(500,500);
  miaudio=new Minim(this);
  reproductor=miaudio.loadFile("Metallica - Master of Puppets.mp3");
  reproductor.play();
  frameRate(10);
}
void draw()
{
  background(0);
  noFill();
  stroke(50,50,50);
  strokeWeight(3);
  ellipse(250,250,300,300);
        a = random(0,255);  
        b = random(0,255);  
        c = random(0,255);  
        stroke(a,b,c);
        bezier(110,300,reproductor.right.get(i)+200,reproductor.left.get(i)*450,reproductor.right.get(i)+300,reproductor.right.get(i)+400,390,200);
        stroke(c,a,b);
        bezier(300,110,reproductor.left.get(i)+400,reproductor.right.get(i)+300,reproductor.right.get(i)*300,reproductor.left.get(i)+200,200,390);  
  
  miaudio.stop();
}


