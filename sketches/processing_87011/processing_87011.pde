
/* 2. Re-drawing the same face, but now some widths, heights and positions are based
 * on a variable called v, which I initialized to 100 for simplicity.
 * It helps to think of things in terms of percentages sometimes, e.g. 20 becomes 100 * 0.20
 *
 * M. Kontopoulos, 2012
 */
 
size(500, 500);
smooth();
background(255);
 
//Try it at 10, 100, 200, 1000
float v = 300;
 
noStroke();
fill(0);
ellipse(170, 150, v/2.0, v/2.0);
ellipse(330, 150, v/2.0, v/2.0);
stroke(255);
noFill();
ellipse(170, 150, v*0.2, v*0.2);   //v controls all the pupil, eye and highlight sizes
ellipse(330, 150, v*0.2, v*0.2);
fill(255);
ellipse(180, 140, v*0.12, v*0.12);
ellipse(340, 140, v*0.12, v*0.12);
 
fill(40);
arc(250, 250, 400, v, 0, PI); //v controls the hight of the arc now.
 
 
stroke(50);
for (int i=0; i<250; i+=10)
{
  line(i, -10, i-(v*0.3), 50); //v controls the offset of the hair, in both directions
}
for (int i=250; i<500; i+=10)
{
  line(i, -10, i+(v*0.3), 50);
}



