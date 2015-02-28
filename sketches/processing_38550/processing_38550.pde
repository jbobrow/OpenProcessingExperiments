
//isolate an ares of the interactive screen
import ddf.minim.*;

Minim minim;
AudioSample kick;

void setup(){
  
  size(400,400);
  minim = new Minim(this);
  kick = minim.loadSample("BD.mp3", 2048);
}
 

void draw(){
  background(0);
  if(mouseX <200 && mouseY <200){
   
    fill(255,192,50);
    rect(0,0,200,200);
    kick.trigger();
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}

