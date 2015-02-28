
//isolate an area of the interactive screen 
import ddf.minim.*;

Minim minim;
AudioSample kick;

// imported sample from library

void setup(){
  size(400,400);
  minim = new Minim(this);
   kick = minim.loadSample("BD.mp3", 2048);
   
   // change sound by changing the uploaded sound 
}
void draw (){
  background(0);
  if(mouseX < 200 && mouseY < 200){
  fill(136,225,90);  
  rect(0,0,200,200);
  kick.trigger();
 
  // this is the rectangle that the noise will be made in
  }
    if(mouseX < 200 && mouseY > 200){
  fill(55,87,90);  
  rect(0,200,200,200);
}
    if(mouseX > 200 && mouseY > 200){
  fill(100,87,200);  
  rect(200,200,200,200);
  kick.trigger();
  // add to multiple boxes so noise in more than one box
}
  if(mouseX > 200 && mouseY < 200){
  fill(224,76,5);  
  rect(200,0,200,200);
  }
}
void stop()
{
  // always close Minim audio classes when you are done with them or you will craaaash!
  kick.close();
  minim.stop();
  
  super.stop();
}

