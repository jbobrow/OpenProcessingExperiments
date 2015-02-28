
import processing.pdf.*;

float x = 0;
float y = 0;

import ddf.minim.*;


Minim minim;
AudioPlayer player;

void setup()
{
  size(50000, 200);
  minim = new Minim(this);
  player = minim.loadFile("The Dead 60s - Riot Radio.mp3", 2048);
  player.play();
  
   beginRecord(PDF, "everything.pdf");
}

void draw()
{
  
  //un min 425
  
 if((frameCount % 15) == 0){
    println(player.mix.level()); 
    
    y = map(player.mix.level(), 0, 0.5, 20, 200);
    
    //y = player.mix.level();
    rect(x, 0, 10, y);
    
    x = x + 10;
  }
}
void keyPressed() {
  if (key == 'p') {
    endRecord();
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  // always close Minim before exiting
  minim.stop();
  
  super.stop();
}

