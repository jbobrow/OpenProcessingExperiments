
int ex = 800;
int egrow = -4;
int rx = 0;
int rgrow = 5;

void setup ()   { size (800,800); }

void draw ()
{ background (255);
  fill (0);
  rect (0,450,600,50);
  fill (255,0,0,80);
  rect (rx,300,200,200);
  rx = rx + rgrow; // moves the rectanlge
if (rx==0||rx==600)  // marks the edge of the screen
{ 
  rgrow = rgrow *-1;  //changes direction of rectangle as it bounces
  rect (rx,300,200,200);
}
  
  
fill (0,0,255,50);
ellipse (ex,400,200,200);
  ex = ex + egrow;
if (ex==100||ex==800) {egrow = egrow *-1;}
println ("the rectangle is " + rx + ", and the ellipse is" + ex); 
}


