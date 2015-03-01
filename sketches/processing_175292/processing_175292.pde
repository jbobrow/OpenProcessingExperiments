
//This program will generate a Christmas Card
//MouseClick for snow and
//press b for music
//press s for saves
//More about this project at opensuny.digication.com/evakristinaekstrom/Merry_Christmas
//import ddf.minim.*;

//Declare global variables
//Minim minim;
//AudioPlayer bells;
//AudioSample bells;
//add color palette for snow
color[] pallette = {#f4e9e9, #e9f4eb, #f4f4e9, #fffdff, #ffffff};

//Declare a PImage variable type
PImage jul;

//Load audio file from HDD
void setup() {
  size(600,800);
   String url = "https://opensuny.digication.com/files/M98322d095efef0939f5694a9e9be2fa3.png";
   jul = loadImage(url, "png");
//   minim = new Minim(this);
//   //bells = minim.loadFile("jingle.wav");
//   bells = minim.loadSample("jingle.wav");
   //bells.play();
  image(jul, 0,0,600,800);
}
//Draw code block (anything goes)
void draw() {
  if (mousePressed) {
      float r1 = random(600);
      float r2 = random(800);
      strokeWeight(13);
      stroke(0x80ffffff);
      point(r1,r2);    
    }
  
}

//Create a key trigger
void keyPressed() {
//  if ( key == 'b' ) bells.trigger();
  if ( key == 'b' ) println("sample triggered");
  if ( key == 's' )  {
       textSize(36);
       fill(#ff0000);
       text("Merry Christmas", 50, 120, 540, 300);
       saveFrame("merryChristmas-###.png"); 
  }
  if ( key == 's' ) println("card saved");
  
}



