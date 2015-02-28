
void setup() {
  size(700, 240);
  noStroke();
  frameRate(7);
  smooth();
}

void draw() {
  fill(0,255,255);
  fill(255);
  
  ellipse(millis() % width, millis() % height, 20, 20);
ellipse(millis() %(width-20), millis() %(height-20), 20, 20);
fill (255,0,255);
ellipse(millis() %(width-30), millis() %(height-30), 20, 20);
ellipse(millis() %(width-40), millis() %(height-40), 20, 20);
fill (255,0,0);
ellipse(millis() %(width-50), millis() %(height-50), 20, 20);
ellipse(millis() %(width-60), millis() %(height-60), 20, 20);
ellipse(millis() %(width-70), millis() %(height-70), 20, 20);
fill (0,255,255);
ellipse(millis() %(width-80), millis() %(height-80), 20, 20);
ellipse(millis() %(width-90), millis() %(height-90), 20, 20);
fill (0,255,0);
ellipse(millis() %(width-100), millis() %(height-100), 20, 20);
ellipse(millis() %(width-110), millis() %(height-110), 20, 20);

}

