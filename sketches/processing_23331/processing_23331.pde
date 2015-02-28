
import arb.soundcipher.*; //imports the sound cipher external library 

void setup(){
  size (600,600); //sketch size
  background (0); //background colour (black)
  colorMode(HSB); //colour mode set to Hue, Saturation, Brightness
  smooth(); //sketch renders more smoothly
  frameRate(8); //lowers the frame rate to 8 (the defult is 10) 

}


void draw(){
  fill(0,25); // set fill as transparent black on rectangle below
  rect(0,0,width,height); // draw a rectangle the same size as the window with fill and transparency as above to give a fade effect
}

SoundCipher sc = new SoundCipher(this); //creates the sound

void mousePressed(){ //action will play when mouse in pressed

  
  int loud = (10+(mouseY/10)); //creates a number (based on mouseY) for the loudness of the note and size of the circle
  int tone = (30+(mouseX/8)); //creates a number (based on mouseX) for the pitch of the note and colour of the circle
 
  fill((tone*2), 200, 255, 80); //fill colour for the circle, using the 'tone' value
  noStroke();
  ellipse(mouseX, mouseY, loud, loud); //circle, positioned by the mouse and the size of the 'loud' value
  
  if (loud >50){ //if the 'loud' value is higher than 50 a second circle will apear around the note
    stroke (200); //light grey stroke
    noFill(); //no fill colour
    ellipse (mouseX, mouseY, (loud+15), (loud+15)); //the circle will be created at the mouse position, with a diameter 15 larger than the 'loud' value
  
  }
  
sc.playNote(tone, loud, 2); //describes the sound: pitch, loudness and length respectivly

}




