
//isolate an area of the interactive screen

import ddf.minim.*;

Minim minim;
AudioSample kick;

void setup(){
  size(400,400);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("BD.mp3", 2048);
}

void draw(){
  background(0);
  if(mouseX < 200 && mouseY < 200){
    
    fill(255,195,40);
    rect(0,0,200,200);
    kick.trigger();
  }
  else if(mouseX > 200 && mouseY <200){
    fill(25,190,255);
    rect(200,0,400,200);
  }
  else if(mouseX < 200 && mouseY >200){
    fill(2,305,140);
    rect(0,200,200,400);
  }
  else if(mouseX >200 && mouseY >200){
   fill(200,95,140);
  rect(200,200,400,400);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}

