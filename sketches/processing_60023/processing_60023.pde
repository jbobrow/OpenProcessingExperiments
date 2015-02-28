
int n = 10;
float rad = 400;
float g = 1.5;
int gen = 1;
float X;
float Y;
int longness = 50;
spring[] springs = new spring[longness];
void setup() {
  size(600, 500, P2D);
  smooth();
  colorMode(HSB);
  background(0);
  fill(random(255), 255, 255, 90);
  for (int i = 0; i < longness; i++) {
    springs[i] = new spring(random(width), random(height), i);
  }
}
void draw() {
  if(!keyPressed) {
    fill(0, 0, 0, 90);
    rect(-1, -1, width+2, height+2);
  }
  if(mousePressed) {
    reccirc(int(random(7)), random(width), random(height), 200);
    reccirc(8, mouseX, mouseY, 300);
  }else{
    X = mouseX;
    Y = mouseY;
  }
  X += 0.2*(mouseX-X);
  Y += 0.2*(mouseY-Y);
  for (int k = 0; k < longness ; k++) {
    springs[k].render();
    strokeWeight(1);
    reccirc(int(random(6)), springs[k].Xpos, springs[k].Ypos, (abs(springs[k].Xvel)+abs(springs[k].Yvel))*20);
    for (int q = 0; q < longness; q++) {
    if (dist(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos) < 100) {
      strokeWeight(1);
      colorMode(RGB);
      stroke(0, 255, 0, (abs(springs[k].Xvel)+abs(springs[q].Xvel)+abs(springs[k].Yvel)+abs(springs[q].Yvel)));
      if(random(10) > 5) 
      line(springs[q].Xpos, springs[q].Ypos, springs[k].Xpos, springs[k].Ypos);
    }
    }
  }
}
void reccirc(int num, float x, float y, float rad) {
  noStroke();
  if(num > 1) {
    float b = random(TWO_PI);
      reccirc(num-1, x+sin(b)*rad/4, y+cos(b)*rad/4, rad/2);
      reccirc(num-1, x-sin(b)*rad/4, y-cos(b)*rad/4, rad/2);
      if(random(100) > 99) {
        reccirc(num + 2, x-sin(b)*rad/4, y-cos(b)*rad/4, rad*5);
      }
      colorMode(RGB);
      stroke(0, num*20, 0, 150);
      line(x, y, x+sin(b)*rad/4, y+cos(b)*rad/4);
      line(x, y, x-sin(b)*rad/4, y-cos(b)*rad/4);
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
  spring(float tempXpos, float tempYpos, int colortemp) {
   Xpos = tempXpos;
   Ypos = tempYpos;
  }
  void render() {
    Xpos = (Xpos + Xvel);
    Ypos = (Ypos + Yvel);
    if (mousePressed) {
      Xvel = Xvel + (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseX - Xpos))) / 100)+random(-0.4, 0.4);
      Yvel = Yvel + (4000 / dist(mouseX, mouseY, Xpos, Ypos) * ((0.009 * (mouseY - Ypos))) / 100)+random(-0.4, 0.4);
    } else {
      Xvel = Xvel / 1.04;
      Yvel = Yvel / 1.04;
    }
    colorMode(RGB);
    stroke(0, 255, 0, 50);
    line(Xpos, Ypos, Pxpos, Pypos);
    colorMode(HSB);
    line(Xpos, Ypos, Pxpos, Pypos);
    Pxpos = Xpos;
    Pypos = Ypos;
    }
  }


