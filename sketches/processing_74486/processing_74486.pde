
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim audio;
AudioPlayer repro;
void setup()
{
  size(500,500);
  audio=new Minim(this);
  repro=audio.loadFile("Answer.wav");
  repro.play();
}
void draw()
{
  background(0);
  noFill();
  stroke(0,100,255);
  strokeWeight(4);
  ellipse(250,250,400,400);
  for(int i=0; i<repro.bufferSize()-1; i++)
  {
      if (i==0) 
      {
        stroke(255,255,0);
        bezier(50,250,repro.right.get(i)+100,repro.left.get(i)*300,repro.right.get(i)+400,repro.left.get(i)+600,450,250);
        stroke(255,100,0);
        bezier(250,50,repro.right.get(i)*400,repro.left.get(i)+250,repro.right.get(i)+400,repro.left.get(i)+300,250,450);
    }
  }
  audio.stop();
}
