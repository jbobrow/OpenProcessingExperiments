
int dragX, dragY, moveX, moveY;
float xnoise = 0.0;
float ynoise = 0.0;
float inc = 0.04;
boolean drawF = false;
boolean drawD = false;

void setup () {
  size (300, 300);
  noStroke ();

  
}

void draw () { 
  
  frameRate (5);
  background (random (255), random (255), random (255));
  if (drawD == true) {
    fill (random (255), random (255), random (255), random (10, 200));
    ellipse (random (height, width), random (300, 300), 10, 10);
    ellipse (random (300), random (300), 150, 150);
    ellipse (random (300), random (300), 200, 200);
    ellipse (random (300), random (300), 250, 250);
    ellipse (random (300), random (300), 300, 300);
    
  } else if (drawF == true) {
    translate (-150, -150); 
    fill (random (255), random (255), random (255), random (10, 200));
    rect (random (height, width), random (300, 300), 10, 10);
    rect (random (300), random (300), 150, 150);
    rect (random (300), random (300), 200, 200);
    rect (random (300), random (300), 250, 250);
    rect (random (300), random (300), 300, 300);
  }

}
 void keyPressed () {
   if ((key == 'D') || (key == 'd')) {
     drawD = true;
   } else if ((key == 'F') || (key == 'f')) {
     drawF = true;
   }
 }
 void keyReleased () {
   drawD = false;
   drawF = false;
 }
 


