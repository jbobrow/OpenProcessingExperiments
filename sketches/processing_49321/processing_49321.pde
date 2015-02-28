
Circle[]_circleArr= {
};

void setup() {
  size(640, 400);
  background(255);
}

void draw() {

  background(255);
  for (int i=0; i < _circleArr.length; i++) {
    Circle thisCirc=_circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  Circle thisCirc = new Circle(mouseX, mouseY);
  thisCirc.drawMe();
  _circleArr=(Circle[])append(_circleArr, thisCirc);
}

class Circle {

  float xpos;
  float ypos;
  float xoffset = 0;
  float yoffset = 0;
  float a;

  // Constructor
  Circle(float tempxpos, float tempypos) {
    xpos = tempxpos;
    ypos = tempypos;
    a = 255;
  }

  void drawMe() {
    smooth();
    noStroke();
    float diameter = 100;
    fill(#5CD6E3, a);
    ellipse(xpos + xoffset, ypos + yoffset, diameter, diameter);
  }

  void updateMe() {
    if (a > 1) {
      a = a-0.5;
    }
    else {
      a=0;
    }
    xoffset = xoffset + (random(-1,1) * 1/a * 300);
    yoffset = yoffset + (random(-1,1) * 1/a * 300);
    drawMe();
  }
}
                                
