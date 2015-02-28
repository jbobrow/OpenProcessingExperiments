
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/103736*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Box[] boxes = new Box[15];

void setup() {
  size(250, 600);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i < boxes.length;i++) {
    boxes[i] = new Box();
  }
}

void draw() {
  background(360);

  for (int i = 0; i < boxes.length;i++) {
    boxes[i].move();
    boxes[i].display();
  }
}

////////////////////////////////////
//class Box
////////////////////////////////////
class Box {
  float x;
  float y;
  float hue  = random(360);
  float spd = random(1, 3);
  float sign;
  int val = (int)random(100, 200);

  Line[] lines = new Line[val];

  Box() {
    x = random(width-30);
    y = random(height-val);

    if (random(1) >= 0.5) {
      sign = 1;
    }
    else {
      sign = -1;
    }

    for (int i = 0 ; i < lines.length;i++) {
      lines[i] = new Line(hue);
    }
  }

  void move() {
    y += sign * spd;

    if (y > height - val || y < 0) {
      sign *= -1;
    }
  }

  void display() {
    for (int i = 0 ; i < val;i++) {
      lines[i].display(x, y+i, x+30);
    }
  }
}
////////////////////////////////////
//class Line
////////////////////////////////////
class Line {
  float comp; //complementary
  float hue;
  color start_color;
  color end_color;
  color tmp_color;

  Line(float tmpHue) {
    hue = tmpHue;
    comp = hue + 180;
    if (comp > 360) {
      comp -= 360;
    }

    start_color = color(hue, 100, 100);
    end_color = color(comp, 100, 100);
  }

  void display(float x1, float y1, float x2) {
  //tmp_color = lerpColor(start_color, end_color, y1/300,1f);     //bug:leapColor()'s third argument between 0.0 and 1.0
    tmp_color = lerpColor(start_color, end_color, min(y1/300,1f)); 

    stroke(tmp_color, 120);
    line(x1, y1, x2, y1);
  }
}
