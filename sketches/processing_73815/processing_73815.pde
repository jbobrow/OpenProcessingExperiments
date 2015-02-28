
int prevSec;
int millisRolloverTime;

void setup() {
  size(500, 500);
  millisRolloverTime = 0;
  ellipseMode(CENTER);
  stroke (255);
}

void draw() {

  int S = second();

  // Reckon the current millisecond, 
  // particularly if the second has rolled over.
  // Note that this is more correct than using millis()00;
  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;

  float milShade = map (mils, 0,1000, 0,255);
  float secShade = map (second(), 0, 60, 0, 255);
  float minShade = map (minute(), 0, 60, 0, 255);
  float houShade = map (hour(), 0, 24, 0, 255);
  
  background(255);
  strokeWeight (1);
  
  fill(milShade);
  rect (0,0, 500,500);

  fill (secShade);
  ellipse (width/2, height/2, 475, 475);

  fill (minShade);
  ellipse (width/2, height/2, 440, 440);

  fill (houShade);
  ellipse (width/2, height/2, 350, 350);
  
  fill (milShade);
  ellipse (width/2, height/2, 200, 200);
  
  noFill();
  strokeWeight(10);
  ellipse (width/2, height/2, 600, 600);

}
