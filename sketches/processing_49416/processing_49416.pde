
float x = 100;
float y = 100;


void setup() {
  size (200, 200);
  smooth ();
  //----------------------------------- CONSOL MESSAGE
  println("Walking in a winter wonderland!");
}

void draw() {

  background (30, 150, 200);
  
  x = x + 1;
  y = y + 1;

  //----------------------------------- RECTANGLE
  rectMode (CENTER);

  //----------------------------------- LINES
  line (x-25, y, x-60, y-30);
  line (x, y+25, x+50, y-50);

  //----------------------------------- CIRCLES
  ellipseMode (CENTER);
  fill(255);
  ellipse (x, y+30, 70, 70);
  ellipse (x, y, 50, 50);
  ellipse (x, y-30, 40, 40);

  fill (0);
  ellipse (x, y, 10, 10);
  ellipse (x, y+15, 10, 10);
  ellipse (x, y+30, 10, 10);
  ellipse (x-10, y-30, 5, 5);
  ellipse (x+10, y-30, 5, 5);

  //----------------------------------- LINES
  line (x-10, y-20, x+10, y-20);
}




