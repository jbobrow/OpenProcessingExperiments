
import ddf.minim.*; //saying that a library will be imported for set of commands

Minim minim; //naming the class, or minim, minim
AudioSample kick; //naming the audiosample library kick

void setup(){
  size(400,400);
  minim = new Minim(this); //advising that the class should reference back to the library
  kick = minim.loadSample("BD.mp3", 2048); //giving kick a reference file
}

void draw(){
  background(0);
    fill(255,255,0);
    ellipse(200,200,150,150);
  
    if(mouseX > 150 && mouseX <250 && mouseY > 150 && mouseY < 250){ //if the mouse co-ordinate remains inside 200 for both the x and y, do the following:
    fill(0,255,0);
    ellipse(75,75,150,150);
    ellipse(325,325,150,150);
    ellipse(75,325,150,150);
    ellipse(325,75,150,150);
  }
  
  if(mouseX > 150 && mouseX <250 && mouseY > 150 && mouseY < 250){ //if the mouse co-ordinate remains inside 200 for both the x and y, do the following:
    kick.trigger();
  }


}

void stop(){ // always close Minim audio classes when you are done with them
  kick.close();  
  minim.stop();
  super.stop();
}  



