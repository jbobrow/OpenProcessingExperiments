
/** SevenSegmentDemo 11.07.2012 by Peter Bosshard Schneider<br />
 *   Demonstrates the use of a SevenSegmentDigit Class to build a display<br />
 *   key commands:<br />
 *   'i' - show/hide construction drawing<br />
 *   'd' - display a decimal point<br />
 *   '1' - show stroke / '2' - hide stroke<br />
 *   '3' - show color set without transparency<br />
 *   '4' - show color set with transparency<br />
 *   '5' - set display width to 20px<br />
 *   '6' - set display width to 50px<br />
 *   '7' - set display width to 100px<br />
 *   '8' - set display width to 200px<br />
 *   '9' - set display width to 300px<br />
 *   '0' - set display width to 400px<br />
 */

PImage vorlage;
SevenSegmentDigit dig;
SevenSegmentDisplay ssd;
boolean display_image = false;
boolean display_dp = false;

void setup() {
  size(400, 566, JAVA2D);
  background(0);
  vorlage = loadImage("sevensegment.gif");
  println(vorlage.width + " x " + vorlage.height);
  dig = new SevenSegmentDigit(0, 0, 400);
  ssd = new SevenSegmentDisplay(20, 460, 360, 6);
  smooth();
  frameRate(2);
}

void draw() {
  background(0);
  noStroke();
  fill(50, 50, 50, 255);
  rect(100, 100, width-200, height-200);
  if (display_image) {
    image(vorlage, 0, 0);
  }
  String nstr = str(frameCount%10);
  dig.setChar(nstr.charAt(0));
  if (frameCount%10 == 0) {
    dig.setDecimalpoint(true);
  }
  else {
    dig.setDecimalpoint(false);
  }
  dig.display();
  float longnum = random(1) + (frameCount%100000);
  if (display_dp) {
    ssd.update(nf(longnum, 3, 3));
  }
  else {
    ssd.update(str(frameCount));
  }
  ssd.display();
}

void mouseReleased() {
  println(mouseX + ", " + mouseY);
}

void keyReleased() {
  if (key == 'i') {
    display_image = !display_image;
  }
  if (key == 'd') {
    display_dp = !display_dp;
  }
  if (key == '1') {
    dig.setStroke(true);
  }
  if (key == '2') {
    dig.setStroke(false);
  }
  if (key == '3') {
    dig.setStrokeColor(color(255, 255, 255, 255));
    dig.setFillColor(color(0, 255, 160, 255));
  }
  if (key == '4') {
    dig.setStrokeColor(color(255, 0, 0, 100));
    dig.setFillColor(color(255, 160, 0, 100));
  }
  if (key == '5') {
    dig.setDisplayWidth(20.0);
  }
  if (key == '6') {
    dig.setDisplayWidth(50.0);
  }
  if (key == '7') {
    dig.setDisplayWidth(100.0);
  }
  if (key == '8') {
    dig.setDisplayWidth(200.0);
  }
  if (key == '9') {
    dig.setDisplayWidth(300.0);
  }
  if (key == '0') {
    dig.setDisplayWidth(400.0);
  }
}


