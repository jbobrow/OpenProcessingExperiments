
void setup ()

{
size(250,250);
background (250);
smooth ();
}
void draw ()
{


noStroke (); 
fill (mouseX,mouseY);
ellipse  (125, 125,mouseY , mouseX);

}


