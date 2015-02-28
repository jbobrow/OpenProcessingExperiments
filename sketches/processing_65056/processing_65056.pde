
int stW;
int stW_min = 1;
int stW_max = 50;

color stC;

int btnR_x = 20;
int btnR_y = 20;
int btnR_w = 20;
int btnR_h = 20;

int btnE_x = 60;
int btnE_y = 30;
int btnE_r = 10;

float px;
float py;
float x;
float y;
float easing = 0.2;

void setup() {
  size(600, 600);
  background(255);
  smooth();

  stC = color(0);
}

void draw() {

  // 사각형 버튼
  if (mouseX >= btnR_x && mouseX <= btnR_x+btnR_w && mouseY >= btnR_y && mouseY <= btnR_y+btnR_h) {
    fill(100, 255, 0);
    if (mousePressed) {
      fill(0, 100, 255);
      if (stW_max > stW_min) {
        stW_max--;
      }
    }
  }
  else {
    fill(255, 0, 100);
  }  
  noStroke();
  rect(btnR_x, btnR_y, btnR_w, btnR_h);

  // 원형 버튼
  float d = dist(btnE_x, btnE_y, mouseX, mouseY);
  if (d <= btnE_r) {
    fill(100, 255, 0);
    if (mousePressed) {
      fill(0, 100, 255);
      if (stW_max < 100) {
        stW_max++;
      }
    }
  }
  else {
    fill(255, 0, 100);
  }
  ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2);

  // easing
  float targetX = mouseX;
  float targetY = mouseY;
  x += ( targetX - x ) * easing;
  y += ( targetY - y ) * easing;

  // 속도에 따라 선 두께 변화
  float speed = dist(px, py, x, y);
  stW = (int) map(speed, 0, 150, stW_min, stW_max);

  // 그리기
  if (mousePressed) {
    if (mouseButton == LEFT) {
      stroke(stC);
      strokeWeight(stW);
      line(px, py, x, y);
      px = x;
      py = y;
    }
    else if (mouseButton == RIGHT) {
      background(255);
      rect(btnR_x, btnR_y, btnR_w, btnR_h);
      ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2);
    }
    else if (mouseButton == CENTER) {
      save("/capture/"+month()+"."+day()+"."+hour()+"."+minute()+"."+second()+".png");
    }
  }
  else {
    x=mouseX;
    y=mouseY;
    px=mouseX;
    py=mouseY;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') stC = color(255, 0, 0);
  if (key == 'g' || key == 'G') stC = color(0, 255, 0);
  if (key == 'b' || key == 'B') stC = color(0, 0, 255);
  if (key == 'c' || key == 'C') stC = color(0, 255, 255);
  if (key == 'm' || key == 'M') stC = color(255, 0, 255);
  if (key == 'y' || key == 'Y') stC = color(255, 255, 0);
  if (key == 'k' || key == 'K') stC = color(0);
  if (key == 'w' || key == 'W') stC = color(255);
}
