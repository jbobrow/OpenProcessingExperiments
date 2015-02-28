
//isolate an area of the interactive screen
import ddf.minim.*;

Minim minim;
AudioSample kick;
void setup()
{
size(400,400);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("BD.MP3", 2048);
}
void draw()
{
  background(20,220,220);
  if(mouseX<200 && mouseY<200){
    fill(255,192,50);
    rect(200,0,400,200);
  }
  else if(mouseX>200 && mouseY>200){
  kick.trigger();         

}
    fill(255,192,50);
    ellipse(0,0,200,200);
   }

  

void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}

