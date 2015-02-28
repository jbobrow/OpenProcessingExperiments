
float x1;  // declare x1
int dir=1; 

void setup() {
  size(400, 300);
  smooth();
  noStroke();
  x1 = width/2;  // start in the center
}

void draw() {
  noStroke();
  fill (128,0,128,5);
  rect (0,0,width,height);
  fill(1,128,255);
  x1 += dir; // change x1 (either +1 or -1, depends on 'dir')
  if (x1+15 >= width) { // radius is 15
    dir *= -1;
  }
  if (x1-15 <= 0) { // radius is 15
    dir *= -1;
  }
  ellipse(x1, height/2, 30, 30); // radius * 2 is 30
}

/* Can you draw a second ellipse that stays in one spot,
   but have it get larger while 'dir' is 1, and get smaller
   while 'dir' is -1?  Tips: 1) add new code to the current program, 
   but don't change any of the code that's already here. 2) This
   program uses 'x1' to keep track of what's changing (the
   x-coordinate).  Notice the three lines: declare, start, and
   change.  You will need to declare, start, and change a different
   variable (a new one that you choose) to keep track of how tall 
   and wide your other ellipse is.  You will only need one variable
   since 'dir' is already created and changing it's value as needed.
   After you do that, can you create a third ellipse that
   stays in one spot, and stays one size, but keeps changing
   color?  Or maybe one that keeps it's color, but gets more
   and more transparent when 'dir' is 1, and less and less
   transparent when 'dir' is -1?  This is similar, you will need
   to declare, start, and change your own variable to keep track
   of the transparency.
   This is also very cool: instead of using 'background' to wipe
   out the background, get rid of that and try just drawing a 
   rectangle that's as big as the whole screen.  And oh yeah, 
   see what happens if you make the rectangle transparent.
   Good Luck!!
*/
