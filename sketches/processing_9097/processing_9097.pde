
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

void setup()   
{  
size (400, 400);
smooth ();
//frameRate(25); 
//scale (4);
//background (0);
}

void draw () {  
  
if (mousePressed) { 
  
  background (225,235,255);
  stroke (255, 240, 0);
  strokeWeight (random (1, 12));
  line (-50,-50, random (width), random (height));
  
  stroke (0);
  strokeWeight (1);
  scale (4);
  fill (255);
  ellipse (50,47,70,45);
  line (61, 69, 70,78);
  line (39, 69, 30, 78);
  ellipse (30,78, 8,8);
  ellipse (70,78, 8,8);
  triangle (45, 45, 55, 45, 50, 55);
  ellipse (35,40, 13,13);
  ellipse (65,40, 13,13);
  fill (0);
  ellipse (37,41, 7,7);
  ellipse (63, 41, 7,7);

  noFill();
  bezier (40,25, 40,45, 60,10, 60,25);
}

else {
  
  background (0);
  scale (4);

  fill (255);
  ellipse (35,40, 13,6);
  ellipse (65,40, 13,6);
  fill (0);
  ellipse (map(mouseX,0,width,28,42), map(mouseY,0,width,36,44), 5,3);
  ellipse (map(mouseX,0,width,58,72), map(mouseY,0,width,36,44), 5,3);
}
}






