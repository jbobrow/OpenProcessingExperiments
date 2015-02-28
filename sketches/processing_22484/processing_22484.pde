
//Kyle Lleses
//Problem Set #2 - 5

Alien a;

void setup () {
  size (500, 500);
  smooth();
  a = new Alien (width/2, height/2, 0);
}

void draw () {
  background (0);
  a.display ();
  a.move ();
  smooth ();
}


