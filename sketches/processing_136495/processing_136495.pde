

// I tried to make something warm and cosy and this very draft was inpired by LavaLamp. It creates very cool wax
// bubbles of random size on mouse input (mouseReleased).  You can clear the canvas by pressing DELETE or
// BACKSPACE and save it pressins 's' or 'S'.
 
//Import library
import ddf.minim.*;

//Globals
 Minim minim;
 AudioSample bulb; 
 float wh;
 PImage gradient;
 
//Setup
void setup () {
   size (800, 600); // , P2D is said to be reqired for gradient, but it works...
   noStroke ();
     //Set background image
     gradient = loadImage ("frame.png");
     image (gradient, 0,0);     
     //Sound
     minim = new Minim (this);
     bulb = minim.loadSample ("comedy_bubble_pop_001.mp3");
}

void draw() {   
}

//Drawing bubbles of random size on mouse released
void mouseReleased() {
  //Make sound
  bulb.trigger();
  wh = random (10, 200);
  drawGradient ();    
}

//Description of gradient function for Bubbles
void drawGradient () {
 float h = 170; // GREEN in RGB
 for (int (wh); wh>0; --wh){
   fill(255, h, 0); //R,G,B
    ellipse(mouseX, mouseY, wh, wh);
    if (h>90){
    h = (h - 1) % 360;
    }
  }
}

//Reset background image to eraze bubbles
void keyReleased (){
  if (key == DELETE || key == BACKSPACE) image (gradient, 0,0);
 }
 
//Screenshot
 void keyPressed() {
    if (key == 's' || key=='S') {      
      saveFrame("frame.png");   
    }
}

