
//Eyes myEyes;
//Nose myNose;
//Mouth myMouth;
Head[] myHead = new Head[50];
Head[] myHead2 = new Head[50];
int total;


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;





void setup(){
  size(800, 400);
  smooth();
//myEyes = new Eyes(100, 100, 60, 30, color(0,255,0), 80, 60);
//myNose= new Nose(70, 70, 100, 150, color(0,0,255),20);
//myMouth= new Mouth(100, 220, 100, 50, color(255,0,0), 50);

//
//myHead= new Head(180, 256, 100, 150, color(0,120,200), 23);
//




 minim = new Minim(this);
  song = minim.loadFile("alors.mp3", 512);
  song.play();
  song.rewind();
  


}
void draw(){
  background(random(255));
  
  for (int i = 0; i<total; i++){
   
  myHead[i].display();  
   
  }

  
}
  



//myEyes.display();
//myNose.display();
//myMouth.display();



void mousePressed(){
  
 
  myHead[total] = new Head(random(75, 200), random(150,200), mouseX, mouseY, color(random(255),random(255),random(255), random(255)), 10);
 
  

 
  
  total++;
}



