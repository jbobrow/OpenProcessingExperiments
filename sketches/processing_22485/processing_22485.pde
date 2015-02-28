
//KYLE LLESES
//PROBLEM SET 2 - 6

Alien a;
Alien b;

void setup () {
  size (800, 500);
  smooth();
  a = new Alien (200, 250, 0, 0);
  b = new Alien (600, 250, 0, 1);
}

void draw () {
  background (0);
  a.display ();
  a.move ();
  b.display ();
  b.move ();
  smooth ();
}


