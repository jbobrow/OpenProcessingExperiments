
import ddf.minim.*;
import processing.video.*;

Minim minim; //declare minim object;
AudioPlayer song;

MovieMaker mm; //declare MovieMake object;

int Clicked = 0;


void setup() {
  size(600,600);
  smooth();
  
  //declare and load picture "Gash_1.jpg" from data file
  PImage b;
  b = loadImage("Gash_1.jpg");
  image(b, -150, 0, 900, 800);
  
  // Create MovieMaker object with size, filename,
  mm = new MovieMaker(this, width, height, "drawing.mov");
}

void draw(){
  mm.addFrame(); //capture fram of window and add to movie

  
  if (Clicked==1){
    //declare and load picture "loonie.png" from data file
    PImage c;
    c = loadImage("5yen.png"); 
  
    //draw image where mouse is clicked
    image(c, mouseX, mouseY, 140, 140);
    
    //load sound file "InsertCoin.wav" from data file
    minim = new Minim(this);
    song = minim.loadFile("InsertCoin.wav");
    song.play(); 
    
    Clicked = 0;
  }
}

void mouseClicked(){     
  Clicked = 1;
}


void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}

