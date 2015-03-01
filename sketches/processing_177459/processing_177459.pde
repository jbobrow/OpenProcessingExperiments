
//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample beat, beat1, beat2, beat3, beat4, beat5;

PImage backImage;

//Load audio file from HDD
void setup(){
  size(800, 600);
  backImage = loadImage("BackImage.jpg");
  minim = new Minim(this);
  beat = minim.loadSample("PushButton.wav");
  beat1 = minim.loadSample("PushButton2.wav");
  beat2 = minim.loadSample("PushButton3.wav");
  beat3 = minim.loadSample("PushButton4.wav");
  beat4 = minim.loadSample("PushButton5.wav");
  beat5 = minim.loadSample("PushButton6.wav");
}

//Here the background and the buttons are loaded
void draw(){
image(backImage, 0, 0);
stroke(#030100);
fill(#585858);
rect(250, 200, 50, 50);
rect(395, 200, 50, 50);
rect(550, 200, 50, 50);
rect(250, 300, 50, 50);
rect(395, 300, 50, 50);
rect(550, 300, 50, 50);
}

//Create a key trigger. 
//When we press the button the sample sound is played.
//The rectangle color is changed to white so it appears as a simple animation.
void keyReleased() {
  if (key == 'a' || key == 'A'){
    beat.trigger();
    fill(#FFFFFF);
    rect(250, 300, 50, 50);
  }
  if (key == 's' || key == 'S'){
    beat1.trigger();
    fill(#FFFFFF);
    rect(395, 300, 50, 50);
  }
  if (key == 'd' || key == 'D'){
    beat2.trigger();
    fill(#FFFFFF);
    rect(550, 300, 50, 50);
  }
    
  if (key == 'q' || key == 'Q'){
    beat3.trigger();
    fill(#FFFFFF);
    rect(250, 200, 50, 50);
  }
  if (key == 'w' || key == 'W'){
    beat4.trigger();
    fill(#FFFFFF);
    rect(395, 200, 50, 50);
  }
  if (key == 'e' || key == 'E'){
    beat5.trigger();
    fill(#FFFFFF);
    rect(550, 200, 50, 50);
}
}


