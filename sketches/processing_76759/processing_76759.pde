
AudioPlayer player; //makes clear that the computer has to use the player
Minim minim;

import ddf.minim.*; //those point to the tracks that has to load
PImage a;
PImage b;
PImage c;

void setup(){
 size(1000, 500);
 background(255);
minim = new Minim(this);
player = minim.loadFile("Haloween track.wav", 2048); //these are the actual songs that has to play, stored in the data map
 a = loadImage("Toilet lock vacant.jpg");
 b = loadImage("Toilet lock occupied.jpg");
 c = loadImage("Happy halloween.jpg");
image(a, 450, 150); //this image has to be shown when the door is not locked, so it should be there standard
}

void draw(){
 
}
  
void mousePressed(){
  if (mouseButton == LEFT){ //if the left mousebutton is pressed
    image(b, 450,150); //the image with the locked lock shows up
   
  } 
  } 
  
void mouseReleased(){
  if (mouseButton == LEFT){ //if the left mousebutton is released
    delay(5000); //the player has to play our track after 5 seconds
    player.play();

    image(c, 0, 0, 1000, 500); //and the image that has to turn up after the track
    delay(40000); //knows a delay of the track + some extra time
   
  } 
}




void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

