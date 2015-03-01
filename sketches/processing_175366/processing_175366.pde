
//This program will generate a Christmas Card
//MouseClick for snow and
//press b for music
//press s for saves
//More about this project at https://opensuny.digication.com/evakristinaekstrom/Merry_Christmas
import ddf.minim.*;

//Declare global variables
Minim minim;
//AudioPlayer bells;
AudioSample bells;

//Declare a PImage variable type
PImage jul;

//Load audio file from HDD
void setup() {
  size(600,800);
   jul = loadImage("jul.png");
   minim = new Minim(this);
    //bells = minim.loadFile("jingle.wav");
     bells = minim.loadSample("jingle.wav");
     //bells.play();
  image(jul, 0,0,600,800);
}
//Draw code block (anything goes)
void draw() {
  noStroke();
  if (mousePressed) {
      float r1 = random(mouseX);
      float r2 = random(mouseY);
      strokeWeight(13);
      stroke(0x80ffffff);
      point(r1,r2);    
    }
  
}

//Create a key trigger
void keyPressed() {
  if ( key == 'b' ) bells.trigger();
  if ( key == 'b' ) println("sample triggered");
  if ( key == 's' )  {
       textSize(36);
       fill(#ff0000);
       text("Merry Christmas", 50, 120, 540, 300);
       saveFrame("merryChristmas-###.png"); 
  }
  if ( key == 's' ) println("card saved");
  
}


