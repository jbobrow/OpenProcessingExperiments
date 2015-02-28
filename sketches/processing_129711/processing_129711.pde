
//copyright hw 3 Harris Mazur
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
    wd= 75;
    ht= 75;
    frameRate (30);
    background (252, 219, 150);
}

void draw ()
{
     
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
     
     
     noFill ( ); 
     stroke (150, 233, 20);
     fill (random (0), random  (200), random (250));
     ellipse (random (mouseX), y, mouseX, ht);
     ellipse (x, random (mouseY), wd, mouseY);
     ellipse (x, y, wd, ht);
     fill (value, 150);
     rectMode (CENTER);
     rect (x, y, random (mouseX*.5), random (mouseY*.5));
}

void mousePressed ()
{
    if (value == 0) {
      value= 255;
    }
    else {
      value=0;
    }
}
