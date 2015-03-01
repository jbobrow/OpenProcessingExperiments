
float heleCirkel = TWO_PI; //tau
 
void setup() {
  size(500,500);
  background(0);
  smooth();
}
 
void draw() {
  background(0);
  
  translate(width/2,height/2);
  rotate(-heleCirkel/4);
  
  noFill();
  strokeWeight(20);
  strokeCap(SQUARE);
 
  stroke(0, 255, 0);
  float s = map(second(), 0, 60, 0, heleCirkel);
  arc(0, 0, 70, 70, 0, s);
 
  stroke(255, 0, 0);
  float m = map(minute(), 0, 60, 0, heleCirkel);
  arc(0, 0, 120, 120, 0, m);
 
  stroke(0, 0, 255);
  float h = map(hour(), 0, 60, 0, heleCirkel);
  arc(0, 0, 170, 170, 0, h);
}


