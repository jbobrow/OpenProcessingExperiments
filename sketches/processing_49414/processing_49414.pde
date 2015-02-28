
//----------------------------------- FUNTIONS
void setup() {
  size (200, 200);
  smooth (); 
  rectMode (CENTER);
  ellipseMode (CENTER);

  //----------------------------------- CONSOL MESSAGE
  println("Walking in a winter wonderland!");
}

void draw() {
  background (30, 150, 200);
  fill(255);
  //----------------------------------- LINES
  line (75, 100, 40, 70);
  line (100, 125, 150, 50);

  //----------------------------------- CIRCLES

  ellipse (100, 130, 70, 70);
  ellipse (100, 100, 50, 50);
  ellipse (100, 70, 40, 40);

  fill (0);
  ellipse (100, 100, 10, 10);
  ellipse (100, 115, 10, 10);
  ellipse (100, 130, 10, 10);
  ellipse (90, 70, 5, 5);
  ellipse (110, 70, 5, 5);

  //----------------------------------- LINES
  line (90, 80, 110, 80);
}




