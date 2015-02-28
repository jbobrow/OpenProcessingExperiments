
/*Project 2B Exercise-Squares
Code by Jennifer Nowack
York University: 211448347
YSDN-1006*/

size (250, 250);
rectMode (CENTER);
translate (125, 125);
noStroke ();
smooth ();

fill (74, 0, 0);
for (int x=180; x>0; x-=15)
  {
    rect (0, 0, x, x);
    fill (0,0,255-x);
    rotate (PI/0.3);
  }


