
int radius = width/2;
float pointsRadius = .8 * radius;
float cx = width/2;
float cy = height/2;

void setup() {
  size(320,320);
  frameRate(30);
}



void draw() {
  background(178,227,222);
  
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //int minutes = minute();
  float mappedMinutes = map(float(m), 0, 59, 0, 320);
 
  rectMode (BOTTOM);
  noStroke();
  fill (54,199,184,255);
  rect (0, 320, 320, mappedMinutes);

  int hours = 23-h;
  float mappedHours = map(float(hours), 0, 23, 0, 320);
  float hourScale = 320 - mappedHours;

  rectMode (BOTTOM);
  fill (226,30,72,200); 
  rect (0, 320, 320, hourScale);

  float mappedSeconds = map(float(s), 0, 59, 0, 320);
  

  fill (255,255);
  smooth();
  ellipse (160, mappedSeconds, 20, 20);
}
//lerp

// lerpcolor

//map
//}


