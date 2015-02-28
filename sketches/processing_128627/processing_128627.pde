

//Carlyn Maw
//Wk 1 - Example 2 Constant Vs Variable

final int AREA = 200000;

float d2 = 0;
float d1 = 0;

float d1MAX = 0;

void setup() {
  size(480, 480);
  d1MAX = AREA / (PI * height);
  smooth();
}

void draw() {
 drawBackground();
 d1 = max(mouseX, d1MAX);
 d2 = AREA / (PI * d1);
 ellipse(width/2, height/2, d1, d2);
}

void drawBackground() {
  background(204);
}


