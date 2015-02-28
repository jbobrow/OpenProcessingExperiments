


void setup () {
  size (600, 600);
}


void draw () {
  background (200, 20, 20);
  smooth();
  noStroke();

  int seconds = second (); // sets up the time functions as useable objects
  int minutes = minute ();
  int hours = hour ();
  //  int milli = millis (); - Didn't end up using



  //HOURS
  rect (0, hours*4, width, 100);
  fill (20, 100, 250, 50);

  // MINUTES
  rect (0, minutes*10, width, 50);  


  // SECONDS
  rect (0, seconds*10, width, 25);

  // MILLISECONDS - Doesn't loop around for some reason
  // Didn't make sense either to track this, either
  // rect (450, milli/60, 5,5);
}


