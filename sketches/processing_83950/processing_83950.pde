
void setup ()

{
size(300,300);
background (250);
smooth ();
}
void draw ()
{


noStroke (); 
fill (mouseX,mouseY);
ellipse  (mouseY, mouseX, 25, 25);

}


