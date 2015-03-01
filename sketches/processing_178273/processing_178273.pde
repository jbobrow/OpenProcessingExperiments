
//Coursera - Intro to Computational Arts
//Final Project - 4 Seasons, The Gift of Change - by Dorothea(aka Dee) B.
/*I hope you enjoy this audio/visual journey through
the four wondrous seasons, each bearing their own
gift to us. Can you hear it in the music? Can you
see it in the colors, feel it in the words? May you always
joyously delight in the variety of natural splendors!
*/
/*Special instructions: 
This sketch is interactive, with the user pressing a specific key to 
animate a specific season as follows:
press 'w' for winter; press 's' for spring; press 'u' for summer; press 'a' for autumn
*/


//Import 'Minim' library
import ddf.minim.*;

//Global variables
color[] palette_winter = {#A8A8A8, #0761A6, #FFFCF8, #2589E8, #FEC6C7};
color[] palette_spring = {#FFFF53, #47960B, #C42DBC, #09C7DE, #C7ABC9};
color[] palette_summer = {#FFE621, #FF3A09, #FF7705, #FFF809, #F24B1E};
color[] palette_autumn = {#344F14, #522A05, #FF470C, #FFC20B, #9E1021};
PImage seasons;
Minim minim;
AudioPlayer music;


//Setup
void setup() {
  size(1081, 720);
  noStroke();
  seasons = loadImage("Four_Seasons.png");
  
  //Load audio files
  minim = new Minim(this);
  music = minim.loadFile("Music_for_All_Seasons.mp3");
  music.play();
    
}



//Draw sketch elements
void draw() {
  image(seasons, 0, 0);
}

//Keyboard input
void keyPressed() {

  //activate winter season
  if (key == 'w') {
    float w = random(5);
    fill(palette_winter[int(w)]);
    ellipse(random(0, 539), random(0, 350), random(10), random(25));
    frameRate(5);  
  }

  //activate spring season
  else if (key == 's') {
    float s = random(5);
    fill(palette_spring[int(s)]);
    ellipse(random(560, 1070), random(5, 340), random(25), random(50));
    frameRate(9);    
  }
  
  //activate summer season
  else if (key == 'u') {
    float u = random(5);
    fill(palette_summer[int(u)]);
    ellipse(random(560, 1000), random(400, 700), random(50), random(95));
    frameRate(4);
  }
  
  //activate autumn season
  else if (key == 'a') {
    float a = random(5);
    fill(palette_autumn[int(a)]);
    ellipse(random(25, 450), random(390, 700), random(25), random(50));
    frameRate(7);    
  }
}






