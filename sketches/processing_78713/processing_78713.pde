
//Introduciton to Procedural Media
//Visual Binary Clock by Max Cohen
//November 2012, California

float r = 15.5;

void setup() {
  size(440, 550);
  frameRate(12);
  textSize(90);
  textAlign(CENTER);
  smooth();
}  

void draw() {
  background(50);
  stroke(224);
  strokeWeight(8);
  rectMode(CENTER);

  fill (124, 120, 106);
  triangle(52, 180, 95, hour()+125, 138, 180); // Left Roof
  triangle(177, 180, 220, minute()+100, 263, 180); // Middle Roof
  triangle(297, 180, 345, second()+100, 393, 180); // Right Roof

  int s = second();
  int m = minute();
  int h = hour();

  String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);

  fill(240, 250, 250);
  //println(t);
  text (t, width/2, 450);

  drawClock(color(156, 207, 49), color(237, 244, 245), 75, 200, hour());     // Left
  drawClock(color(255, 158, 0), color(237, 244, 245), 200, 200, minute()); // Middle
  drawClock(color(0, 158, 206), color(237, 244, 245), 325, 200, second()); // Right
}



void drawClock (color c, color c1, int x, int y, int timeInt)
{
  String bin = binaryNumber(timeInt); // gets the time in binary

  for (int i = 0; i < bin.length() - 4; i++)
  {
    if (bin.charAt(i) == '1')
      fill(c);
    else
      fill(c1);
    rect(x, y + 40*i, r*2, r*2); //right column
  }

  for (int i = 4; i < bin.length(); i++)
  {
    if (bin.charAt(i) == '1')
      fill(c);
    else
      fill(c1);

    rect(x + 40, y + 40*(i-4), r*2, r*2); //left column
  }
}

String binaryNumber(int timeInt)
{
  int unit, dec;  //declaring unit and dec(imal)

  dec = int(timeInt/10);
  unit = timeInt - (dec*10);

  return binary(dec, 4) + binary(unit, 4);
}
