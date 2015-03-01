
//Import Minim Library
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioPlayer sound;
//Establish image name
PImage circle;

//Set variables for random selection of stored images
//and drawing circle sizes
int i ;
int s ;

void setup ( ) {
  size (1000 , 600 ) ;
  s = int(random(1,6)); //set random number
  minim=new Minim(this);
  //Play "Circle of Life" MIDI file for introduction page
  sound=minim.loadFile("intro.wav");
  sound.loop();
  //sound.play();
  //Draw the introduction page
  circle=loadImage("intro.PNG");
  noFill ( ) ;
  i = 0 ;
  colorMode ( HSB , 255 , 255 , 255 ) ;
  background ( #ffffff ) ; 
}

void draw ( ) {
  image(circle,0,0);//Draw random circle of life image from 5 available
  //Draw ellipses based on mouse input
  if ( mousePressed ) {
    pushMatrix ( ) ;
    translate ( width / 2  , height / 2 ) ;
    rotate ( radians ( i ) ) ;
    strokeWeight ( 1 ) ;
    stroke ( random ( 255 ) , random ( 255 ) , random ( 255 ) ) ;
    ellipse ( 200 , 0 ,  mouseX , mouseY ) ;
    popMatrix ( ) ;
    i ++ ;
  }
  else {
    //background ( #ffffff ) ;
    i = 0 ;
  }
}

void keyPressed ( ) {
  //stop looped playback, clear canvas and get new circle of life image 
  if ( key == DELETE || key == BACKSPACE ) {
    sound.close();
    background ( #ffffff ) ;
    s = int(random(1,6));
  println(s);
  sound=minim.loadFile("circlife"+s+".wav");
  sound.loop();
  //sound.play();
  circle=loadImage("circlife"+s+".png");
  }
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
}


