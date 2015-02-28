
/**
Press and hold any key to change the image and to hear the sound.
Release the key to stop drawing and stop the sound.
Press 'C' to clear the screen (as well as the text message). The astronaut remains.
Move your mouse around while holding any key down to change the colour of the Saturn's rings.
**/

import ddf.minim.*;


//Some globals
PImage pic;
Minim minim;
AudioPlayer music;



void setup(){
//Canvas settings
  size(700, 500);  
  background(0);
  colorMode(HSB, width, height, 100);
  strokeWeight(2);


//Loading music and image   
  minim = new Minim(this);
  music =  minim.loadFile("white_noize.wav");
  pic = loadImage("IMG_3127.png");

//The text is static, that is why it is applied within setup()
  PFont font = loadFont("AngsanaNew-BoldItalic-48.vlw");
  textFont(font);
  textSize(32);
  text("Press and hold any key for more stars and sound \n\n Press 'c' to clear the canvas", 10, 40);
}  

//Draw the image - the static astronaut and ever-changing stars.
void draw(){
  
//If any key but 'c' is pressed, draw Saturn and the stars and play the music
 if (keyPressed == true && key!= 'c' && key!= 'C'){
      
    ellipse (random(width), random(height), 4, 4);
    fill(mouseY, mouseX, 80);
    ellipse(130, 435, 200, 20);
    fill(random(width), random(height), 80);
    ellipse(130, 430, 80, 80);
     
    music.play(); 
  }

//Stop the music, once the key is released
 else
   music.pause();

//Draw the astronaut on top of everything 
 image(pic, 300, 0); 
}

//If the user pressed C, clear the screen (except for the astronaut)
void keyPressed() {
  if (key=='c' || key=='C') background(0);
}



