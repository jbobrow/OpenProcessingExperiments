
//isolate an area of the interactive screen
import ddf.minim.*;

Minim minim;
AudioSample kick;

void setup() {
  size(400, 400);
   minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("BD.mp3", 2048);
}

void draw (){
  background(250,242,88);
  if (mouseX<200&&mouseY<200 ){
    kick.trigger();
    fill(52,198,53);
    rect(0,0,200,200);
  } 
    if (mouseX>200&&mouseY<200){
      fill(98,175,232);
      rect(200, 0,200, 200);
  }
  if (mouseX>200&&mouseY>200){
     
    fill(209,98,232);
    rect(200,200,200,200);

}
if (mouseX<200&&mouseY>200){
  fill(245,132,40);
  rect(0,200,200,200);
}
}
void stop() {


  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();

}


