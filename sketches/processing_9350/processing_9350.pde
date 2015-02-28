
/**
 *    aufgabe
 *
 *    http://www.rmx.cz/monsters/
 *
 *    fjenett 20080327
 */

/* zeichne eine monsterrrrr mit den befehlen:
   
   point()
   line()
   triangle()
   quad()
   
   rect()
   ellipse()
   
   curve()
   bezier()
   
   fill() / noFill()
   stroke() / noStroke()
   
   smooth() / noSmooth()
*/

void setup ()
{
size (200, 200);
background (255);
smooth();
}

void draw()
{
line (100, 60, 60, 100);
line (60+80, 100, 20+80, 60);





fill (0);
noStroke();


ellipse(100, 60, 80, 60);

fill (125);
ellipse(100, 60, 40, 30);

 
fill(255);
ellipse(82, 60, 10+5, 10+5);
ellipse(118, 60, 10+5, 10+5);


for ( int i =0; i<width; i++)
{
  float x = map (mouseX, 0, width, 83, 78);
  float x2 = map (mouseX, 0, width,  120, 115);
  
fill (0);
stroke (125);
ellipse(x, 60, 10, 10);
ellipse(x2, 60, 10, 10);
}
}





