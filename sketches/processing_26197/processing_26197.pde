
//Melissa 2011

//DECLARATIONS
PImage blankmusic;
PFont font; 
float ranX, ranY;
Boolean drawNotes;
float beatlesypos;
float ctxpos;

// changes the colour of the lyrics to be random
float r, g, b;

//determines how much the Beatles characters dance along the x axis
float qShake;
float wShake;
float eShake;
//determines how much the Beatles characters dance along the y axis
float rShake;
float tShake;
float yShake;


//make my notes wavy
float theta;

//Import "minum" which allows me to play music
import ddf.minim.*;
Minim minim;
AudioPlayer song;


//INITIAL SETTINGS
void setup () {
  frameRate (50);
  size (780, 447);
  smooth(); 
  fill(0);
  drawNotes = false;
  blankmusic = loadImage ("musicstaves.jpg");
  image(blankmusic, 0, 0, 764, 447);
  beatlesypos = 10;




  // Make the music ("Come Together") play
  minim = new Minim(this);
  song = minim.loadFile("86 Come Together.mp3");
  song.play();
}



//REPETITIVE INSTRUCTIONS

void draw () {
  smooth();
  noStroke();



  // make the background a sheet of blank staves
  fill(255);
  blankmusic = loadImage ("musicstaves.jpg");
  image(blankmusic, 0, 0, 780, 447); 
  rect (0, 0, width, 60);
  fill (0);



  // title of the music; "Come Together"
  font = loadFont ("JanepixHandwriting-48.vlw");
  textFont (font, 48);
  ctxpos = map(mouseX,0,width,20,450);
  fill (50, 135, 200);
  text ("Come Together", ctxpos, 50);
  textFont (font, 24); 
  beatlesypos = map(mouseY,0,height,20,100);
  fill (120, 50, 200);
  text ("The Beatles", 670, beatlesypos);

  //insert a treble clef at the beginning of each line
  blankmusic = loadImage ("treble clef.jpg");
  image(blankmusic, 5, 80, 28, 80);

  blankmusic = loadImage ("treble clef.jpg");
  image(blankmusic, 5, 160, 28, 80);  

  blankmusic = loadImage ("treble clef.jpg");
  image(blankmusic, 5, 237, 28, 76);  

  blankmusic = loadImage ("treble clef.jpg");
  image(blankmusic, 5, 310, 28, 70);  

  blankmusic = loadImage ("treble clef.jpg");
  image(blankmusic, 5, 380, 28, 65);    


// show the Beatles characters on the screen
  fill (255);
  rect (600, 245, 164, 185);

blankmusic = loadImage ("the_beatles_cartoon1.jpg");
image(blankmusic, 600, 245, 48, 185);

blankmusic = loadImage ("the_beatles_cartoon2.jpg");
image(blankmusic, 648, 245, 42, 185); 

blankmusic = loadImage ("the_beatles_cartoon3.jpg");
image(blankmusic, 690, 245, 65, 185);    
  
  if(keyPressed) {
//insert the Beatles characters dancing when a key is pressed
  fill (255);
  rect (600, 245, 164, 185);  

qShake=random(10,15);
rShake=random(10,15);
blankmusic = loadImage ("the_beatles_cartoon1.jpg");
image(blankmusic, 600+qShake, 245+rShake, 48, 185);

wShake=random(10,30);
tShake=random(10,15);
blankmusic = loadImage ("the_beatles_cartoon2.jpg");

image(blankmusic, 648+wShake, 245+tShake, 42, 185); 
eShake=random(20,40); 
yShake=random(10,15);
blankmusic = loadImage ("the_beatles_cartoon3.jpg");
image(blankmusic, 690+eShake, 245+yShake, 65, 185);  
}  


  ////insert the Beatles characters dancing 

//  blankmusic = loadImage ("the_beatles_cartoon1.jpg");
//  image(blankmusic, 600, 245, 48, 185);
//
//  blankmusic = loadImage ("the_beatles_cartoon2.jpg");
//  image(blankmusic, 648, 245, 42, 185); 
//
//  blankmusic = loadImage ("the_beatles_cartoon3.jpg");
//  image(blankmusic, 690, 245, 65, 185);  




  //song lyrics under each stave
  font = loadFont ("LiSongPro-48.vlw");
  textFont (font, 16);
  r = random (255);
  g = random (255);
  b = random (255);
  fill (r, g, b);

  text("Here come old flattop he come grooving up slowly", 30, 150);
  text ("He got joo-joo eyeball he one holy roller", 30, 225); 
  text ("He got hair down to his knee", 30, 295);
  text ("Got to be a joker he just do what he please", 30, 365);
  text ("Come together right now over me", 30, 440);


  // make random notes do a wavy pattern across the screen on STAVE LINE ONE


  theta += 0.7;
  float x = theta; 

  // < 10 means how far across the page the wave of circles starts
  for (int i = 3; i < 60; i++) {
    // * height/25 means the height of the wave itself.
    float y = sin(x) * height/30;
    // i*20 means how big the "wave" is.
    // y + height/6 means the position on the screen
    fill(0);
    ellipse (i * 11.8, y + height/4, 10, 10);
    //how far apart the circles are from each other
    x += 1;
  }



  // make random notes do a wavy pattern across the screen on STAVE LINE TWO
  for (int i = 3; i < 60; i++) {
    float y = sin(x) * height/30;
    fill(0);
    ellipse (i * 11.8, y + height/2.3, 15, 15);
    x += 0.6;
  }

  // make random notes do a wavy pattern across the screen on STAVE LINE THREE
  for (int i = 3; i < 60; i++) {
    float y = sin(x) * height/20;
    ellipse (i * 10, y + height/1.7, 5, 5);
    x += 0.3;
  }

  // make random notes do a wavy pattern across the screen on STAVE LINE FOUR
  for (int i = 3; i < 60; i++) {
    float y = sin(x) * height/30;
    ellipse (i * 10, y + height/1.35, 10, 10);
    x += 0.4;
  }


  // make random notes do a wavy pattern across the screen on STAVE LINE FIVE

  for (int i = 3; i < 60; i++) {
    float y = sin(x) * height/30;
    fill(0);
    ellipse (i * 10, y + height/1.1, 3, 3);
    x += 0.9;
  }
}

// something to do with my music playing?? 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}







