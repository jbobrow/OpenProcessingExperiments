
int longness = 10000;
spring[] springs = new spring[longness];
 
void setup() {
  background(0, 0, 0);
  size(450, 450, P2D);
  colorMode(HSB);
for (int i = 0; i < longness; i++) {
    springs[i] = new spring(random(width), random(height), i);
  }
}
 
void draw() {
  if(!keyPressed&&key!='p') {
    fill(0, 0, 0, 40);
    strokeWeight(10);
    rect(0, 0, width, height);
  }
  if(keyPressed&&key=='p') {
    saveFrame("output.png");
  }
  for (int i = 0; i < longness ; i++) {
    springs[i].render();
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
    Xpos += Xvel;
    Ypos += Yvel;
    if (mousePressed) {
      Xvel += (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseX - Xpos))) / 50);
      Yvel += (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseY - Ypos))) / 50);
    } else {
    Xvel = Xvel / 1.04;
    Yvel = Yvel / 1.04;
    }
    colorness = dist(Xpos, Ypos, Pxpos, Pypos) * 10;
    strokeWeight(2);
    fill(colorness, 255, 255);
    stroke(colorness, 255, 255, 20);
    line(Xpos, Ypos, Pxpos, Pypos);
    Pxpos = Xpos;
    Pypos = Ypos;
  }
}

