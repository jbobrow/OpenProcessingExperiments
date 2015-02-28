
//Kojo Opuni
//Masters Candidate at New York University's Interaactive Telecommunications Program (ITP)
//Class of 2013
//www.kojoopuni.com
//Per Audacia Ad Astra. Make the Impossible Possible.

import processing.video.*;
import processing.opengl.*;

float rR = random (0,255);
float rT = random (0,255);

void setup() {
   size(700, 600, OPENGL);
  
}

void draw() {
   background(180, 219, 180);
   tint(255,255);
   lights();
   camera();
   rotateX(radians(-50));
   translate(width/2, height/2, 0.0);
   scale(height/2);
   
  // fill(50, 106, 102);
  
  
   fill(255, 0, 0);
   //fill (rR,rR,rT); 
   int numIter = 150;
   for (int i=0; i<numIter; i++) {
      float a = map(i, 0, numIter-1, 0, 1);
       pushMatrix();
          rotateY(radians(a * 360));
          translate(1.1, 0, 0);
          rotateZ(radians(a*260) + (.02 * frameCount));
          rotateY(.02 * frameCount);
       drawIter();
       
       popMatrix();
       
   }
}

void drawIter() {
   beginShape();
   vertex(-.1, -.2, 0);
   vertex( .1, -.2, 0);
   vertex( .1,  .2, 0);
   vertex(-.1,  .2, 0);
   endShape(CLOSE);
   
   beginShape();
   vertex(-.3, -.9, 0);
   vertex( .3, -.9, 0);
   vertex( .3,  .9, 0);
   vertex(-.3,  .9, 0);
   vertex(.4,  .5, 0);
   vertex(-.4,  .5, 0);
   endShape(CLOSE);
  
   
   } 


