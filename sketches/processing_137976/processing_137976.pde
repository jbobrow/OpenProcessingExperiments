
/*
Final project by Noelia Luaces
*/

/*
instructions
MOUSE
mouse pressed: draws bubbles accordinly to the mouse position.

KEYS
del, backspace: erase
s: save png
F, f: draws fishes on the mouse position with a bubble sound.
*/

import java.util.Date;
import ddf.minim.*;

//Globan Variables
color[] fishColor = {#2DEBA2,#91F57F, #EBAA69, #EBAA69, #2B0027 };
color[] bubbleColor = {#F4EEE2, #CFDCD3,#8CB9B2, #27777E, #1B5771  };
int strokeWeightDefault = 1;
color strokeEyeFishColor = color(#050505);
PImage wallPaper;
Minim minim;
AudioSample audio;



//setup()
void setup(){
  size(1280, 720);
  wallPaper =  loadImage("background.png");
  image(wallPaper,0,0,1280, 720);
  minim = new Minim(this);
  audio = minim.loadSample("bubbles.wav");
}

//draw()
void draw(){

  if (mousePressed){
   noFill(); 
   float randomBubbleColor = random(0,5);
   stroke(bubbleColor[int(randomBubbleColor)]);
   strokeWeight(strokeWeightDefault);
   float randomX = random(0,50);
   ellipse(mouseX, mouseY, randomX, randomX);
    

  }
}

//keyReleased() implements save and delete functions
void keyReleased(){
  
  if(key == DELETE || key == BACKSPACE) image(wallPaper,0,0,1280, 720);
  if(key == 's' || key == 'S'){
    Date date = new Date();
    saveFrame("final_project"+date.getTime()+".png");
  }  
   
}

//keyPressed() 
void keyPressed(){
  
  if(key == 'f' || key == 'F'){
   audio.trigger();
   float randomFishColor = random(0,5);
   fill(fishColor[int(randomFishColor)]);
   noStroke();
   rect(mouseX, mouseY, 50, 50);
   triangle(mouseX, mouseY+50, mouseX-10, mouseY+40 ,mouseX-10,mouseY+60);
   strokeWeight(5);
   stroke(strokeEyeFishColor);
   line(mouseX+40,mouseY+10, mouseX+40,mouseY+20);
  }

}

