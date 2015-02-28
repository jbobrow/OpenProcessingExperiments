
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer player;
AudioInput input;*/


String T = "Troll!";
PImage img;
int value=0;
void setup() {
  //  minim = new Minim(this);
  //player = minim.loadFile("horror010.mp3");
  //player.play();
  
  
  size(500, 500);
  img = loadImage("personal_trollface_hd.png");


}



void draw() {
  background(22, 67, 89);
  if (keyPressed == true) {
    img.resize(500, 500);
    background(img);
    fill(254, 255, 255);
    ellipse(255, 110, 73, 110);
strokeWeight(7);
fill(240,7,7);
rect(250,200,40,60);


    fill(0);
    
strokeWeight(2.5);

    strokeWeight(1);
    rect(215, 150, 80, 200);
    rect(215, 340, 30, 150);
    rect(265, 340, 30, 150);
    rect(140, 185, 90, 29);
    
   rect(280, 185, 90, 29);
fill(113,82,44);
rect(330,185,130,90);

strokeWeight(7);
fill(240,7,7);
rect(235,170,30,120);
    strokeWeight(1);
    textSize(20);
    fill(0);
    text (T, 20, 80);
  } 
  else { 

    background(173, 145, 2);
    fill(random(255), random(255), random(255));
    rect(205, 100, 100, 100);
    String Z= "Press a key or click and drag the mouse"; 
    textSize(20);
    fill(0);
    text(Z, 105, 300);
  }  
  if (value == 5) {
    for (int i=0;i<250; i=i+1) {
      println("In");
      fill(random(255), random(255), random(255));
      ellipse(random(500), random(500), random(500), random(500));
      rect(random(200), random(200), random(300), random(300));
    }
  }
 
} 


void mouseDragged() {
  if (mousePressed){
  value = 5;
  }
}
  void mouseReleased(){
   value = 0;
  }





