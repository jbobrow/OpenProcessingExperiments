
/* Smiley Face
* By: Jennifer Bermeo & Misha 
*/
void setup()
{
  size(400, 400); //create the screen
  noStroke();     //no outlines
  smooth();       //make smooth geometry lines
}
float c1 = 0;
void draw() {
 background (255); 
 colorMode(HSB);
  c1+=1;
  c1%=255;
fill (0);                     // color back for outline of face
ellipse (200, 200, 300, 300); // Outline of face
fill (c1,255,255);            // Rainbow Color
ellipse (200, 200, 280, 280); // face
fill (0);                     // Color Black for and smile
ellipse (200, 210, 200, 200); // Smile

fill (c1,255,255);            // Rainbow Color
ellipse (200, 200, 200, 190); // yellow face (for smile) 
fill (0);                     // Color Black for eyes
ellipse (240, 150, 50, 70);   // Right Eye
ellipse (140, 150, 50, 70);   // Left Eye 
}


