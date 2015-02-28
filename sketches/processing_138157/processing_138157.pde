
//Inspired by spring, this program creates a psychedelic experience by providing nature  
//sounds and sunrays during the exploration of the image (by clicking and dragging the mouse). 
//The heart of the sun resets the image, as do the delete and backspace keys.
//All sounds are also available under the number keys.


//declare a PImage variable type
PImage spring;

//import Minim
import ddf.minim.*;

//set up the sound variables
Minim minim;
AudioSample scorchio;
AudioSample blackbird;
AudioSample wasp;
AudioSample woodpecker;
AudioSample treecrickets;
AudioSample nightingale;
AudioSample lamb;
AudioSample swallow;
AudioSample cricket;
AudioSample frogs;

//Create boolean variable for erasing visuals
boolean clean = true;

//Define color palette for the sunrays
color[] sunray = {#FFFEFF, #FFFFBF, #FFF99A, #FFD871, #FCC256, #FFD800, #FFA90D, #E87A00, #FF6100, #FF000B, #5D6CFF};
color strokeColor = sunray[int(random(0, 10))];

//declare a global variable representing the distance from the mouse to the sun
float distance = 0;


void setup() {
  size(1280, 720);
  
  //load an image file and draw it to the screen as a background image
  spring = loadImage("spring.jpg");
  
  //colorMode(HSB, 360, 100, 1000, 100);
  noFill();
  //noStroke();
  //background(360);
  //strokeColor = springcolors[int(random(0, 4))];
  //fill(color(60, 100, 1000, 50));   
  
  //initialise sound
  minim = new Minim(this);
  scorchio =  minim.loadSample("Scorchio.wav");
  blackbird = minim.loadSample("blackbird.wav");
  wasp = minim.loadSample("wasp.wav");
  woodpecker = minim.loadSample("woodpecker.wav");  
  treecrickets = minim.loadSample("treecrickets.wav");
  nightingale = minim.loadSample("nightingale.wav");
  lamb = minim.loadSample("lamb.wav");
  swallow = minim.loadSample("swallow.wav");
  cricket =  minim.loadSample("cricket.wav");
  frogs = minim.loadSample("frogs.wav");
}


void draw() {
  //draw imagefile to the screen when boolean "clean" is true, thus erasing other visuals
  if (clean == true) {
  image(spring, 0, 0);
  clean = false;
  }
  
  //draw sunrays, based on the location of the mouse
  if(mousePressed) {
    //center on the sun in the image
    translate(1037, 62);
    //calculate current distance from the sun
    distance = dist(1037, 62, mouseX, mouseY);
    
    strokeColor = sunray[int(random(0, 10))];
    stroke(strokeColor);
    strokeWeight(1 + int(distance)/75);
    int circleResolution = (int)map(mouseY, 0, height, 20, 50);
    float angle = TWO_PI/circleResolution;
    
    for (int r=1; r<=20; r++) {
      beginShape();
        for (int i=0; i<=(circleResolution); i++) {
        float x = cos(angle*i) * distance * r;
        float y = sin(angle*i) * distance * r;  
        vertex(x, y);
      }  
      endShape();  
    }
  }  
}


void mouseReleased() {
  //when releasing the mouse at the center of the sun, play sound and erase all visuals
  if (distance <= 10) {
    scorchio.trigger();
    clean = true;
    pause();
  } 
  //play a different audio sample at different distances from the sun
  else if (distance > 10 && distance <= 150) { blackbird.trigger(); }
  else if (distance > 150 && distance <= 275) { wasp.trigger(); }
  else if (distance > 275 && distance <= 400) { woodpecker.trigger(); }    
  else if (distance > 400 && distance <= 525) { treecrickets.trigger(); } 
  else if (distance > 525 && distance <= 650) { nightingale.trigger(); }    
  else if (distance > 650 && distance <= 775) { lamb.trigger(); }
  else if (distance > 775 && distance <= 900) { swallow.trigger(); }  
  else if (distance > 900 && distance <= 1025) { cricket.trigger(); }  
  else frogs.trigger();
}


void keyPressed() {
  if (key == '1') frogs.trigger();   
  if (key == '2') cricket.trigger();  
  if (key == '3') swallow.trigger();  
  if (key == '4') lamb.trigger();   
  if (key == '5') nightingale.trigger();
  if (key == '6') treecrickets.trigger();
  if (key == '7') woodpecker.trigger();  
  if (key == '8') wasp.trigger();
  if (key == '9') blackbird.trigger();  
  if (key == '0') scorchio.trigger();   
}


void keyReleased(){
  if (key == DELETE || key == BACKSPACE) image(spring, 0, 0);
  if (key == 's'|| key == 'S') saveFrame("screenshot.png");
}



