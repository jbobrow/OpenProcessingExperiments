
// FLUX ELLIPSE Jan 17, 2013
float round = 1;
// int is a whole number = 1
// float = 1.5 Fractions
// Variable is like tupperware, a way of storing DATA

void setup () {
  background (#0AC2FE);
  frameRate(120);
  size (450, 300);
}

void draw() {
  // Void draw default 60 FPS
  round = (random(700)); 
  noStroke();
  /* SERIOUS ELLIPSE FLICKER 
  CREATED BY round Var.*/
  // I can make a two line comment by using */
  fill (random(255),random(255),random(255));
  ellipse (225, 150, round, round);
  //print(round); Only use prints for TESTING 
  //println(); Seperates data in lines "RETURN"
  print("round");
  /* " " = a STRING - Written characters that are not
  to be interperated as program command.*/
  print("  ");
  print(round);
  println();
  // PROCESSING DOESN'T CARE ABOUT WHITE SPACE
}
