
import ddf.minim.*;

Minim minim;
//AudioPlayer bells;
AudioSample bells;

void setup()
{
  minim=new Minim(this);
  //bells=minim.loadFile("bell-ringing-01.mp3");
  bells=minim.loadSample("bell-ringing-01.mp3");
  //bells.play();
}
void draw()
{
  background(0);
}
void keyPressed(){
  if(key=='b')
  {
    bells.trigger();
    println("Bell");
  }
}



