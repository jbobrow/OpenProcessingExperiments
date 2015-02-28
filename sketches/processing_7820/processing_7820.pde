
void setup(){
  size(600, 600);
  stroke(225);
  smooth();
  PFont font = loadFont("Modern-Regular-25.vlw");
  textFont(font);
}

void draw(){
  background(22, 161, 245);
  fill(255, 14, 5);
  noStroke();
  ellipse(300, 300, 365, 365);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI; 

  int b = second();
  int c = minute();
  int d = hour();

  stroke(255);
  strokeWeight(3);
  line(300, 300, cos(s) * 180 + 300, sin(s) * 180 + 300);
  line(300, 300, cos(m) * 180 + 300, sin(m) * 180 + 300);
  line(300, 300, cos(h) * 140 + 300, sin(h) * 140 + 300);


  //second points
  strokeWeight(2);
  for (int a = 0; a < 360; a+=6) {
    float x = 300 + ( cos(radians(a)) * 180 );
    float y = 300 + ( sin(radians(a)) * 180 );
    point(x, y);
    fill(255);

  }
  //second text
  for (int a = 0; a < 360; a+=6) {
    float x = 300 + ( cos(radians(a)) * 220 );
    float y = 300 + ( sin(radians(a)) * 220 );
    fill(255);
    text(b, cos(s) * 220 + 300, sin(s) * 220 + 300);

  }
  //minute text
  for (int a = 0; a < 360; a+=6) {
    float x = 300 + ( cos(radians(a)) * 250 );
    float y = 300 + ( sin(radians(a)) * 250 );
    fill(255);
    text(nf(c,2), cos(m) * 250 + 300, sin(m) * 250 + 300);
  }
  //hour text
  for (int a = 0; a < 360; a+=6) {
    float x = 300 + ( cos(radians(a)) * 280 );
    float y = 300 + ( sin(radians(a)) * 280 );
    fill(255);
    text(d%12, cos(h) * 280 + 300, sin(h) * 280 + 300);

  }

}


