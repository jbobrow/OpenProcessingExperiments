
import ddf.minim.*;
Minim minim;
AudioPlayer player;

import processing.video.*;

//this project uses brightness to make the size and intensity of 
//moving red circles and blue rectangles.
//2011313148 Lim Jooyeon


Capture video;
float abstand = 10;

void setup(){
  size(1280,960);
  minim = new Minim(this);
  player = minim.loadFile("12 No More Master ; Morse Code From The Cold War.mp3");
  player.play();
  video = new Capture(this, width,height);
  smooth();
}

void draw() {
 // background(100);
 float sound = player.left.get(1);
 println(sound);
 
  video.read();

  image(video, 0, 0);
  filter(INVERT); 

 
   
  abstand = 10+mouseX/90.0;
   
  for(int i = 0; i < width/abstand; i++){
    for(int j = 0; j < height/abstand; j++){
       
      float val = brightness(video.get(int(abstand*i), int(abstand*j)))/60;
   
//      fill(pic.get(int(abstand*i), int(abstand*j)));
    
          if (key == 'c' || key == 'C') {
          pushMatrix();
           
          translate(val, val);
          stroke(val*100);
          strokeWeight(val*10);
          stroke(180,25,25,75);
          line (abstand*i+random(-5,5), abstand*j+random(-2,5), abstand*i, abstand*j);
          
          fill(100,140,180,60);
          stroke(80,170,210,95);
          rect(abstand*i/2,abstand*j/2,20*30*sound,10);
          popMatrix();  
        }      
      }
      }
   
    }

