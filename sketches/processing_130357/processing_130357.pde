
//copyright hw 4 Harris Mazur
//When [R] is pressed, the shifting ellipses change from a green range
//of color to a red range.
//When [mouse] is pressed, the center circle changes to random colors.
//When the [mouseWheel] is used, the frame rate changes proportionally
//to the location of the mouse along the x axis.

float x;
float y;
float wd;
float ht;
float easing = 0.05;
int value= 0;

void setup ()
{
    size (400,400);
    strokeWeight (0);
    wd= 25;
    ht= 25;
    frameRate (20);
    background (255);
}

void draw ()
{
// easing
     float targetX= mouseX;
     float dx= targetX - x;
     if (abs(dx) >1)
     {
       x += dx * easing;
     }
     float targetY= mouseY;
     float dy= targetY- y;
     if (abs (dy) >1)
     {
     y+= dy * easing;
     }
     
 //shapes
     noFill ( ); 
     stroke (150, 233, 20);
     if (keyPressed) 
     {
       if (key == 'r' || key == 'R')
     {
       fill (random (200), random  (100), 0, 100);
     } }
         else 
         {
          fill (random (0), random  (200), random (100), 100);
         }

//shifting ellipses     
     ellipse (random (mouseX), y, mouseX, ht);
     ellipse (x, random (mouseY), wd, mouseY);
     ellipse (x, y, wd, ht);
     
//central circle     
     fill (random (value), random (value), 0, 150);
     rectMode (CENTER);
     ellipse (x, y, mouseX*.5, mouseX*.5);
     
     
}
// this changes the color of the central sphere

void mousePressed ()
{
    if (value == 0) {
      value= 255;
    }
    else {
      value=0;
    }
}

void mouseWheel ( )
{
   frameRate (mouseX*.2);
}
