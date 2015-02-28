
//By Adam Lastowka

int longness = 30;
spring[] springs = new spring[longness];

void setup() {
  background(0, 0, 0);
  size(600, 600);
  colorMode(HSB);
for (int i = 0; i < longness; i++) {
    springs[i] = new spring(random(width), random(height), i);
  }
}

void draw() {
  background(0, 0, 0);
  for (int k = 0; k < longness ; k++) {
    springs[k].render();
    for (int q = 0; q < longness; q++) {
    if (dist(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos) < 100) {
      strokeWeight(1);
      line(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos);
    }
  }
}
  if (keyPressed) {
     saveFrame("output.png");
     colorMode(RGB);
     background(255, 255, 255);
     colorMode(HSB);

}
}
class spring {
  float Xpos;
  float Ypos;
  float Xvel;
  float Yvel;
  float Pxpos;
  float Pypos;
  float colorness;
  spring(float tempXpos, float tempYpos, int colortemp) {
   Xpos = tempXpos;
   Ypos = tempYpos;
   colorness = colortemp;
  } 
  void render() {
    Xpos = (Xpos + Xvel);
    Ypos = (Ypos + Yvel);
    if (mousePressed) {
      Xvel = Xvel + (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseX - Xpos))) / 50);
      Yvel = Yvel + (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseY - Ypos))) / 50);
    } else {
    Xvel = Xvel / 1.04;
    Yvel = Yvel / 1.04;
    }
    colorMode(RGB);
    fill(255, 255, 255, 150);
    colorMode(HSB);
    ellipse(Xpos, Ypos, 20, 20);
    strokeWeight(dist(Xpos, Ypos, Pxpos, Pypos) / 2);
    colorness = dist(Xpos, Ypos, Pxpos, Pypos) * 10;
    fill(colorness, 255, 255);
    colorMode(RGB);
    stroke(255, 255, 255);
    colorMode(HSB);
    Pxpos = Xpos;
    Pypos = Ypos;
    }
  }
