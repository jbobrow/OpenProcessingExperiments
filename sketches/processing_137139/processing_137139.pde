
/* I was trying to create a project that would be a type of visual novel.
However upon trying to add more than one button and one option it became
incredibly difficult. I will leave the second button option as a comment
in the line of code so that it is visible and perhaps feedback can be given.
The question in the first page is almost directly quoted from Voltaire's
Candide. I was able to find a way to allow saved text input which was really cool and
I would like to create something more advanced. The only button created was the
Philosopher button on the second background. Unfortunately, the initial "button" 
does not always work and may require several
runs before the next background loads.

Clicking on the Pihlosopher button also plays a song.
*/


import ddf.minim.*;
//global variables
Minim minim;
AudioPlayer vampir;
PImage dinosaur;
PImage philosopher;
PImage warrior;
PImage jobless;
PFont f,g;
int stepX;
int stepY;
// stores text
String typing = "";


// saves text
String saved = "";
int indent = 25;

void setup() {
  
  size(1280,720);
  f = createFont("LiGothicMed",20,true);
  g = createFont("CalistoMT-BoldItalic",40,true);
  
}

void draw() {
  background(0);
  
  

  textFont(f);
  fill(#B40707);
  text("Type then hit Enter. \nThank You For Logging In Comrade. \nIt is demonstrable that things cannot be otherwise than as they are;\nfor all being created for an end, all is necessarily for the best end. Do you agree?", indent, 40);
  text(typing,indent,160);
  text(saved,indent,200);
  println(mouseY);

}

void keyPressed() {
  // If enter is pressed go to next page
  if (key == '\n' ) {
    dinosaur = loadImage("dinosaur.jpg");
    background(dinosaur);
    text("Then What Is Your Profession? Click to Answer", indent, 60);
      textFont(g);
      text("Philosopher", indent,650);
      text("Fighter", width/2,650);
      text("Jobless", 1100,650);
      text(typing,indent,160);
      text(saved,indent,200);
      noLoop();
    typing = ""; 
  } else {
    // if backspace hit subtract 1 from the typing input or if it is just a key, add  it to the typing String.
    if (keyCode == BACKSPACE) {
typing = typing.substring(0, typing.length() - 1);
} 
else
if (key != CODED) typing += key;

    
  }
    
}

// if the mouse is pressed over the text "Philosopher" go to a new background page with new text.
void mousePressed(){
  
    if (mouseX>indent&&mouseX<200&&mouseY<650&&mouseY>630){
  loop();
  minim = new Minim(this);
  vampir = minim.loadFile("vampir.mp3");
  vampir.play();
  philosopher = loadImage("philosopher.jpg");
  background(philosopher);
  textFont(f);
  fill(#B40707);
  noLoop();
  textSize(100);
  text("ERROR", width/2, height/2);
  println(mouseX+mouseY);
    }  
    
   /* if (mouseX>indent&&mouseX<width/2+200&&mouseY<650&&mouseY>630){
  philosopher = loadImage("warrior.jpg");
  background(warrior);
  textFont(f);
  fill(#B40707);
  noLoop();
  textSize(100);
  text("ERROR", width/2, height/2);
  println(mouseX+mouseY);
  }*/
    }  
  
 

  






