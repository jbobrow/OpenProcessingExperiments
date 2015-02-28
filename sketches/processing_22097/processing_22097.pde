
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

float diam; // width of ellipse and weight of line


void setup() {
  smooth();
  size(400, 800, P2D);
  minim = new Minim(this);                       
  mysound = minim.loadFile("dilla.mp3");        
  mysound.loop();                              
}


void draw() {
   background(255);
   float currGain = map(mouseY, 500, 0, -10, 12);      // value to mouse 
   println(currGain);
   mysound.setGain(currGain);
   
   fill (0); // black dot
   diam = abs(mouseY - height)*.3; // constantly recalculate diameter as a distance from the mouse to the center, and make it 10% of that
}


 
 void mouseDragged(){
  
  //draw the dot at our cursor
  fill(255);
  noStroke(); // no stroke on ellipses 
  ellipse(mouseX, mouseY, diam, diam); // draw a dot at the mouse position with the diameter calculated above
 
  stroke(0); 
  strokeWeight(diam); 
  line(mouseX, mouseY, pmouseX, pmouseY); 
}

 
 // this function gets called when you close out of your app
void stop(){
  
  // always close Minim audio classes when you finish with them
  mysound.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
}

