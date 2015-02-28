
// project:  show firework display with sound
// mousepress will draw the fire explosion, which is a conglomeration of many stars together, 
//            at the same time, explosion sound is initiated.

/*
MOUSE
pressed :  will draw a firework explosion and also trigger off the sound
position x, y  :  determine the center of the firework explosion.

KEYS
+: increase the size of explosion (to a max of certain size)
-: decrease the size of explosion (to a min of certain size)
del, backspace  : erase
s : save png

*/

import ddf.minim.*;


// global variables
Minim  minim;
AudioSample explosion;
int redCol = 255;
int greenCol =255;
int blueCol = 255;
int size = 30;

void setup() {
  minim = new Minim(this);
  explosion = minim.loadSample("Explosion7.wav");
  size(800, 600);
  background(0);
}

void draw() {
   if  (mousePressed) {
       if (size > 50 ) size = 50;
       if (size < 5)   size = 5;
       pushMatrix();
       translate(mouseX, mouseY);

      redCol=int(random(255));
      greenCol=int(random(255));
 //     blueCol=int(random(blueCol));
      
      for (int i =0; i< 3*size; i++){

        // style
        strokeWeight(1);
        stroke(redCol, greenCol, blueCol );
        star(int(random(width))/size, int(random(height))/size, random(20), random(5), random(8) );    
      }
      explosion.trigger();
      popMatrix();
    }
}



void star(int x, int y, float radius1, float radius2, float npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// keyPressed()
void keyReleased() {
     if (key == DELETE || key == BACKSPACE)  
         { background(0);
           blueCol = int(random(255));
         }
     if (key == 's' || key == 'S')  saveFrame("screenshot.png");

     if (key == '+') size = size - 5 ;
     if (key == '-') size = size + 5 ;
}

