
//Aufgabe (5) zur Farbe in CC, hier Hoffnung bei M. Jomaa
float numeroeins; 
float numerozwei; 
void setup () {
  size (500, 500);
  smooth ();  
  background (255);
  stroke (0);
  strokeWeight (9);
}
void draw () {
  noStroke ();
  fill (255, 9);
  rect (0, 0, 500, 500);
  stroke (numerozwei, 255, 255);
  if (numerozwei > 255) numerozwei = 0;
  else numerozwei ++;
  float numerodrei = map (sin(radians(numeroeins)), 0, 0.8, 0, 590);
  numeroeins += 1; 
  bezier (600, 0, numerodrei, 200, 180-numerodrei, 100, 300, 500); 
}

