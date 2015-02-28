
import ddf.minim.analysis.*;
import ddf.minim.*;

void setUp()
{
  size(800, 800);
}

void draw()
{
  String line = "CLICK HERE FOR SPECIAL SITUATIONS ONLY";
  text(line, width/6, height/3);
}

void mousePressed()
{
  Minim minim = new Minim(this); 
  AudioPlayer audio = minim.loadFile("EpicFailVoice.mp3");
  audio.play();
}


