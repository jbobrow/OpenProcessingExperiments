
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
/*
**This is An Abstract attempt to model traditional music in India
**into a interactive platform. The music generated is using typically
**traditional instruments.
**
**When No mouse is pressed an evenly distant strings are displayed
**on the image, but once the mouse is pressed the grids changes to 
**an uneven but spaces between them continuously increasing.
**
**Also when mouse pressed a new audio is played over another.
**
*/


//Audio Variables
Minim minim;
AudioPlayer player;
AudioPlayer player2;

//Image variables
PImage tribe;

//Other Global Variables
int countX = 800;
int r = 40;

//Setup
void setup() {
  minim = new Minim(this);
  player = minim.loadFile("atmos1.wav");
  player2 = minim.loadFile("bells.wav");
  size(800, 600);
  tribe =loadImage("tribe.JPG");
}


//draw
void draw() {
 image(tribe, 0, 0);  
 player.play();
  for (int i = 0; i < countX;) {
     stroke(100);
      if(mousePressed){
       r++;
         if(r>40){
           r=5;
           }
     }
     line(0+i+r, 0, 0+i+r, height);
     i += r; 
  }
}

// When mouse is pressed for once a new sound is being loaded...
void mousePressed(){ 
player2.play(); 
}


