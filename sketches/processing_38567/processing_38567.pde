
//isolate an area of the interactive screen
import ddf.minim.*;

Minim minim;
AudioSample kick;

void setup () {
  size(400, 400);
   minim = new Minim(this);
   kick = minim.loadSample("BD.mp3", 2048);
}

void draw () {
  background(0);
  if (mouseX<200&&mouseY<200){
  fill(225, 123, 0);
  rect(0, 0, 200, 200);
  kick.trigger();
}

if (mouseX<200&&mouseY<200) {
  fill(100, 230, 100);
  rect(200, 200, 200, 200);
}

}

void stop(){

 
  kick.close();
  minim.stop();
  
  super.stop();
}



