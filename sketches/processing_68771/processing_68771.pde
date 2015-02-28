
// Homework #3
// Copyrights 2012 Leyli Guliyeva

float a, b, c;

void setup ()
{ 
    size (600, 400);
    smooth ();
    background (#FFEBD6);
    frameRate (100);
    a = 150;
    b = 250;
    c = 200;
}

void draw ()
{
   strokeWeight (random (10, 100));
   stroke (random (10, 100), random (110, 210), random (210, 250), 10 );
   line (pmouseX, pmouseY, mouseX, mouseY);
   
   if (mousePressed) {
   ellipse (mouseX, mouseY, random (1, 150), random (1, 150));
}

}

//saveFrame ("hw3.jpg");
   

