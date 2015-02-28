
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
    if(mouseX < 200 && mouseY < 200){ //if the mouse co-ordinate remains inside 200 for both the x and y, do the following:
    fill(0,255,0);
    ellipse(100,100,200,200);
  }
  if(mouseX > 200 && mouseY <200){
    fill(246,255,0);
    ellipse(300,100,200,200);
  }
    if(mouseX > 200 && mouseY > 200){
    fill(0,0,255);
    ellipse(300,300,200,200);
  }
    if(mouseX < 200 && mouseY > 200){
    fill(255,0,0);
    ellipse(100,300,200,200);
  }
    if(mouseX < 200 && mouseY > 200){ //if the mouse co-ordinate remains inside 200 for both the x and y, do the following:
    kick.trigger();
  }
}

void stop(){ // always close Minim audio classes when you are done with them
  kick.close();  
  minim.stop();
  super.stop();
}  



