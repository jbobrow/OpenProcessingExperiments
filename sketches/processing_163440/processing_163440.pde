
Wheel myWheel;

void setup() {
  myWheel = new Wheel();
  colorMode(HSB);
  size(512, 512);
  smooth();
  noStroke();
  background(255);
  myWheel.colorWheel();
}

void draw() {
  backGnd();
  stroke(0);
  strokeWeight(100);
  ellipse(256, 256, 256, 256);
  noStroke();
  myWheel.colorWheel();
}

void backGnd() {
  color S;
  if (sqrt(sq(mouseX-width/2)+sq(mouseY-height/2)) <= 256 ) {
    S = get(mouseX,mouseY);
  } else {
    S = 255;
  }
  background(S);
}



class Wheel {
  Wheel() {
  }

  void colorWheel() {
    translate(256, 256);
    saturationChanger(128, 256);
  }

  void saturationChanger(int i, int initial) {
    if (i>0) {
      colorTriangle(256, 0, initial, initial);
      saturationChanger(i-1, initial-2);
    }
  }

  void colorTriangle(int iteration, int h, int s, int Height) {
    if (iteration>0) {
      fill(h%256, s, 256);
      triangle(0, 0, 128*tan(radians(5.625/4)), Height, -128*tan(radians(5.625/4)), Height);
      rotate(radians(5.625/4));
      colorTriangle(iteration-1, h+1, s, Height);
    }
  }
}


