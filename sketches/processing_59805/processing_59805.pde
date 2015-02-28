
int longness = 10000;
spring[] springs = new spring[longness];
  
void setup() {
  background(0, 0, 0);
  size(450, 450, P2D);
  colorMode(HSB);
for (int i = 0; i < longness; i++) {
    springs[i] = new spring(random(100), random(200), i);
  }
}
  
void draw() {
  if(!keyPressed&&key!='p') {
    fill(0, 0, 0, 40);
    strokeWeight(100);
    
  }

  for (int i = 100; i < longness ; i++) {
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
      Xvel += (6000 / dist(mouseY, mouseX, Ypos, Xpos) * ((0.009 * (mouseY - Xpos))) / 100);
      Yvel += (6000 / dist(mouseY, mouseX, Ypos, Xpos) * ((0.009 * (mouseX - Ypos))) / 100);
    } else {
    Xvel = Xvel / 1.04;
    Yvel = Yvel / 1.04;
    }
    colorness = dist(Xpos, Ypos, Ypos, Xpos) * 2;
    strokeWeight(50);
    stroke(random(colorness), 255, 255, 20);
    line(Ypos, Ypos, Pypos, Pypos);
 
    Pxpos = Xpos;
    Pypos = Ypos;
    
  }
}


