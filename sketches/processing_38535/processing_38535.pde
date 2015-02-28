
import ddf.minim.*;

Minim minim;
AudioSample kick;
void setup(){
  size(400,400);
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("BD.mp3", 2048);
}
void draw(){
  background(0);
  fill(0,255,0);
  if(mouseX < 200 && mouseY < 200){
    rect(0,0,200,200);
  }
  else if (mouseX >200 && mouseY<200){
    rect(200,0,400,200);
  }
  else if(mouseX <200 && mouseY >200){
    rect(0,200,200,400);
  }
  else if(mouseX>200 && mouseY> 200){
    kick.trigger();
    rect(200,200,400,400);
  }
}


