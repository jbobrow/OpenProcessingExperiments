
import ddf.minim.*; //saying that a library will be imported

Minim minim; //naming the class, or minim, minim
AudioSample kick; //naming the audiosample library kick

void setup(){
  size(400,400);
  minim = new Minim(this); //advising that the class should reference back to the library
  kick = minim.loadSample("BD.mp3", 2048); //giving kick a reference file
}

void draw(){
  background(0);
  fill(0,255,0);
  if(mouseX < 200 && mouseY < 200){
    kick.trigger();
    rect(0,0,200,200);
  }
}

void stop(){
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}  



