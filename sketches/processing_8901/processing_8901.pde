
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
  size(300,300);
  noStroke();
  smooth();
}

void draw ()
{
  fill(255);
  beginShape();
    vertex(30,150);
    bezierVertex(  50, -20,  230, -70,  270, 150);
    vertex(270, 250);
    vertex(30,250);
  endShape();

  fill(200);
  ellipse(90, 120, 20, 20);
  ellipse (200, 120, 20, 20);
  ellipse(150, 200, 100, 30);

  fill(255);
  rect(80, 97, 160, 20);
  triangle(170,183,180,200,190,183);
  
  for (int i=0; i<width; i++)
  {
    float x = map( mouseX,    0, width,    85, 95 );
    float x2 = map( mouseX,    0, width,    195, 205 );
   
    fill(0);
    ellipse(x, 122, 10, 10);
    ellipse(x2, 122, 10, 10);    
    
    //mouseX
    
    //ellipse (x, 122, 10, 10);
  }
  
  
}


