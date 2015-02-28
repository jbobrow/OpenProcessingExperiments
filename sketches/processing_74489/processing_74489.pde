
//CCLab Homework by Veronica Black
//Sept. 27th 2012
/* ---- Use a library to create an interesting audio-visual interaction --- */
/* --- I can make this work. Making the mouseX and mouseY create value --- */
//playing around
float soundX;
float soundY;
float easing = 0.5;
float pointX;
float pointY;

//minim
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
//declaring audio
Minim minim;
AudioPlayer koshland2; //initialize rain sound

//class
// we delcare the objects
sound [][] mySound = new sound[30][30];  

//setup
void setup(){
  size(600, 600);
  smooth();
  
  minim = new Minim(this);
  koshland2 = minim.loadFile("koshland2.mp3", 512); //load sounds    
  
    for (int i=0; i<mySound.length; i++) {
    for (int j=0; j<mySound.length; j++) {
      mySound [i][j]= new sound(30 * i, 30*j, 40);
      // We assign the elements of the array, and we give it some propertie 
    }
  }
}

void draw(){
  background(255);
  
  for (int i=0; i<mySound.length; i++) {
      
  //playing around
  /*float targetX = mouseX;
  soundX += (targetX-soundX) * easing;
  float targetY = mouseY;
  soundY += (targetY-soundY) * easing;
  
  float weight = dist(soundX, soundY, pointX, pointY);
  line(soundX, soundY, pointX, pointY);
  
  pointY = soundY;
  pointX = soundX;*/
      
    for (int j=0; j<mySound.length; j++) {
      fill(0,mySound[i][j].mouseDist,0);
      mySound[i][j].update(mouseX, mouseY);//method_update
      mySound[i][j].display();//method_display
     
    }
    }
}

//http://www.openprocessing.org/sketch/69763
//thanks to Owen Herterich 
void mouseReleased() { //if the mouse is released, stop the sound and reload it.
  koshland2.close();
  koshland2 = minim.loadFile("koshland2.mp3", 512);
   koshland2.play();
}
 
//function for stopping sound when program exits
void stop() {
  koshland2.close();
  minim.stop();
 
  super.stop();
}


