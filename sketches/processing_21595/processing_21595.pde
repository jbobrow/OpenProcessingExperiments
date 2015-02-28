
int num = 700;

Rwalk[] CAR = new Rwalk[num];
color[] Colors = new color[3];

void setup() {
  frameRate(1000);
  size (900, 400);
  background (255);
  smooth();
  noStroke();

  Colors[0] = color(216, 4, 80, 5);
  Colors[1] = color(131, 191, 0, 5);
  Colors[2] = color(242, 159, 5, 5);

  for (int i = 0; i < CAR.length; i++) {
    CAR[i] = new Rwalk();
  }
}

void draw() {
  blend(0, 0, width, height, 0, 0, width, height, BURN);
  for (int i = 0; i < CAR.length; i++) {
    CAR[i].update();
    CAR[i].display();
  }
}


class Rwalk {

  float x = random(0, width);
  float y = random(0, height);
  float Size = random(20);
  float SizeReset = -20;
  color colorPicker = Colors[floor(random(0,3))];

  Rwalk() {
  }

  void update() {

    x+=(random(-3, 3));
    y+=(random(-3, 3));
    Size+= 0.2;

    if (Size > 20) {
      Size = SizeReset;
    }
  }

  void display () {
    fill(colorPicker);
    ellipse(x, y, Size, Size);
  }
}


