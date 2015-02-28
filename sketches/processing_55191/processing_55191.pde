
/*Project 2B Exercise-Lines
Code by Jennifer Nowack
York University: 211448347
YSDN-1006*/

size (250, 250);
background (255);
smooth ();
int x=0;

for (x=12; x<125; x +=20)
  {
    stroke (82, 10, 25);
    line (x, 125, 125, 125-x);
    stroke (50, 10, 60);
    line (x, 125, 125, 125+x);
    stroke (40, 86, 32);
    line (125+x, 125, 125, x);
    stroke (40, 20, 100);
    line (125, 125*2-x, 125+x, 125);
  }


  


