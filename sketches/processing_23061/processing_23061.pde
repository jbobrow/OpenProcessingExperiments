

//declare array and set size of 100
Orbit [] orbits = new Orbit [100];

void setup () {
  size (800, 800);
  smooth();

  // use array to fill class with values
  for (int i=0; i <orbits.length; i++) {
    int r = int (random (10, 80));
    int r2 = int (random (50, 400));
    float t = random (.01, .1);
    
    orbits[i] = new Orbit ( 0, r, r2, t);
  }
}

void draw () {
  background (230);

    //fill (random (100,255), random(100,255),random(100,255));
  // call the array to display all the circles
  for (int i = 0; i < orbits.length; i++) {
    orbits[i].move();
 
}
}






