
void setup() {
  size(450, 450);
  background(255);
  smooth();
  strokeWeight(1.5);
  PFont font;
  font = loadFont("HelveticaWorld-Regular-48.vlw");
  textAlign(RIGHT);
  textFont(font, 12);
}

float deg, y1;
float rad1 = 0;
float speed = 1;
float amp = 50;
float y2 = 0;

void draw() {
  stroke(0);
  rad1 = (PI/180)*deg;
  deg = deg + speed;
  y1 = sin(rad1)*amp+(width/2);
  y2 = cos(rad1)*amp+(width/2);
  point(deg, y1);
  if (deg >= 450) {
    speed = speed*-1;
  }
  else if (deg <= 0) {
    speed = speed*-1;
    y1 = cos(rad1)*amp+(width/2);
  }

  noStroke();
  fill(255);
  rect(0, (height-32), width, 32);
  fill(0);
  String varCheck = "deg:"+int(deg)+" rad1:"+int(rad1)+" y1:"+int(y1)+" y2:"+int(y2)+" amp:"+int(amp)+" speed:"+int(speed);
  text(varCheck, width-10, height-10);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      amp = amp+1;
    }
    if (keyCode == DOWN) {
      amp = amp-1;
    }
    if (keyCode == RIGHT) {
      speed = speed+1;
    }
    if (keyCode == LEFT) {
      speed = speed-1;
    }
  }
}


