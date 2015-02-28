
/*code by Erin O'Sullivan 20/04/10
introduce chaos using the position of the mouse, determine the colour of ellipses,
their movement restrictions, and the pitch and pan of a note.
This program uses elements of code from Damien De Fede's sine Wave Signal 
from the minim library*/

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;
bouncies[] bounce= new bouncies[600]; //defin array

 
void setup() { 
  colorMode(HSB); // hue, saturation and brightness can now be set seperately
  size(720, 720); //less maths when allocating hue via mouse position, just divide by 2
  noStroke(); 
  smooth(); 
  for (int i = 0; i < bounce.length; i++) { 
    bounce[i] = new bouncies(); 
  } 
  minim = new Minim(this); //minim code follows: 
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(10);
  out.addSignal(sine);
  
} 
 
void draw() { 
  background(0); 
  for (int i = 0; i < bounce.length; i++) { // for each increment of the array, call functions that apply to the bouncies
    bounce[i].animate(); 
    bounce[i].apply(); 
  }
 
 /* out.setGain((mouseX-400)/400); sets gain as mouseX reduced to between -1 and 1 add: apprently, this can be done with map!!!*/
 if (out.hasControl(Controller.GAIN)) { //always check to see if you CAN control the gain
   float volume = map(mouseY, 0, width, 20, -9);// this basically says, based on mouseY, which can move between 0 and 720, and re-defines 0 and 720 to the next variables! 
   out.setGain(volume);
 }
 else {
   text("no control available", 5, 15);
 }
}
 //code from Damian De Fede follows 
  void mouseMoved () {// put this first, otherwise it gets lost and isn't called properly
    float freq = map(mouseX, 0, width, 1500, 60); // map is ridiculously useful.
    sine.setFreq(freq);
  }
  
 
class bouncies { 
  //these will give values used to restrict movement of the items in the array  
  float startX; 
  float startY; 
  float xspeed; 
  float yspeed; 
  float ellipseSize; 
 
  // now, apply values to these restrictions. to allow the balls to move independently of each other, use random 
  bouncies () { 
    
    startX = (360); //start in the midle of the screen
    startY = (360); 
    xspeed = random(5,9); //random picks at random from between, or up to, the following numbers
    yspeed = random(2,8); 
    ellipseSize = random(20); 
  } 
 
  // change based on size, and mouse position
  void animate() {
   if (ellipseSize <= 10) { //smaller circles will move according to these nested if statements
    if (startX+(ellipseSize/2) > mouseY || startX-(ellipseSize/2) < 0) { 
      xspeed = xspeed * (-1); 
    } 
    if (startY+(ellipseSize/2) > mouseX || startY-(ellipseSize/2) < 0) { 
      yspeed = yspeed * (-1); 
    } 
    startX = startX + xspeed; 
    startY = startY + yspeed; 
  } 
  else if (ellipseSize > 10) {//larger circles will move according to these nested if statements
    if (startX+(ellipseSize/2) > mouseX || startX-(ellipseSize/2) < 0) { 
      xspeed = xspeed * (-1); 
    } 
    if (startY+(ellipseSize/2) > mouseY || startY-(ellipseSize/2) < 0) { 
      yspeed = yspeed * (-1); 
    } 
    startX = startX + xspeed; 
    startY = startY + yspeed; 
  }
  }
  
 
  void apply() { //make objects in the array actual ellispes!!
    fill((mouseY/2), 360, 200); 
    ellipse(startX, startY, ellipseSize, ellipseSize); 
  } 
  
  
  void stop() {//remember to stop everything
    out.close();
    minim.stop();
    
   
  }
} 
 


