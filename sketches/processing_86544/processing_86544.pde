
void setup ()

{
size(250,250);
background (250);
smooth ();
}
void draw ()
{

noStroke (); 

// première cologne//
//début première salve//

fill (mouseX, mouseX);
ellipse (50, 50, mouseX/12, mouseX/12);
fill (mouseX,mouseX);
ellipse (50,100,mouseX/12,mouseY/12);
fill (mouseX,mouseX);
ellipse (50,150,mouseY/12,mouseY/12);
fill (mouseX,mouseY);
ellipse (50,200,mouseY/12,mouseY/12);

fill (mouseY,mouseX);
ellipse (100,50,mouseX/12,mouseX/12);
fill (mouseY,mouseY);
ellipse (100,100,mouseX/12,mouseX/12);
fill (mouseY, mouseY);
ellipse (100,150,mouseY/12,mouseX/12);
fill (mouseY,mouseY);
ellipse (100,200,mouseY/12,mouseY/12);

fill (mouseX,mouseY);
ellipse (150,50,mouseY/12,mouseY/12);
fill (mouseY,mouseY);
ellipse (150,100,mouseX/12,mouseY/12);
fill (mouseY, mouseX);
ellipse (150,150,mouseY/12,mouseX/12);
fill (mouseY,mouseX);
ellipse (150,200,mouseX/12,mouseY/12);

fill (mouseX,mouseY);
ellipse (200,50,mouseY/12,mouseX/12);
fill (mouseX,mouseY);
ellipse (200,100,mouseX/12,mouseY/12);
fill (mouseX,mouseX);
ellipse (200,150,mouseY/12,mouseX/12);
fill (mouseX,mouseY);
ellipse (200,200,mouseX/12,mouseX/12);
}


