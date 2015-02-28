
//lsolare an are of th interative screem
import ddf.minim.*;
Minim minim;
AudioSample kick;
void setup(){
  size(400,400);
    minim = new Minim(this);
      kick = minim.loadSample("db.mp3", 2048);
}
void draw(){
  background(0);
  if( mouseX<200 && mouseY<200){
  fill(255, 192,50);
  rect(0,0,200,200);
   kick.trigger();
  }
  if(mouseX>200&&mouseY>200){
    fill(200,100,200);
    rect(200,200,200,200);
  }
  if(mouseX<200&&mouseY>200){
    fill(100,50,20);
    rect(200,0,200,200);
  }
  
  }
  void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}


