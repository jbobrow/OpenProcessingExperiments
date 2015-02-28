
float x = 50;
float y = 50;

float s1 = 50;
float s2 = 30;

void setup () {
  size (400, 600);
  smooth ();
}

void draw () {
  
  fill (200,5);
  rect (0,0,width,height);
  
  fill (random(185,210), random(185,210), random(165,210));
  noStroke ();
  ellipse (x, y, 20, 20);
  x = x + s1;
  y = y + random (s2);
 
  if ( (x > width-10) || (x < 10) ) {
    s1 = s1 * -1;
  }
  
  if ( (y > height-10) || (y < 10) ) {
    s2 = s2 * -1;
  }
  
}

