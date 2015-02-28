
//Carlyn Maw
//Wk 2 - Example 1 Time

float d2 = 120;
float d1 = 120;

long i = 0;
float fRate = 20;

void setup() {
  size(240, 240);
  smooth();
}

void draw() {
 drawBackground();
 if (frameCount % fRate > 0) {
   //draw nothing
 } else {
   ellipse(width/2, height/2, d1, d2);
 }
}

void drawBackground() {
  background(204);
  line(0, height/2, width, height/2);
}


