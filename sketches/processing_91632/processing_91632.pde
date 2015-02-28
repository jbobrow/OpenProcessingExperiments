
float inc = 0.0;

void setup() {
  size(800, 500);
  stroke(59,113,9);
  smooth();
}

void draw() {
  background(75, 193, 255);
  inc+= 0.03;
  float angle = sin(inc)/ 300.0 + sin(inc*1.2)/20.0;


  tail(3, 7, angle/1.3);
  tail(10, 3, angle/1.3);
  tail(14, 15, angle/1.3);
  tail(18, 9, angle/1.3);
  tail(25, 4, angle/1.3);
  tail(33, 12, angle/1.3);
  tail(44, 10, angle/1.3);
  tail(56, 4, angle/1.3);
  tail(62, 5, angle/1.3);
  tail(70, 11, angle/1.3);
  tail(88, 7, angle/1.3);
  tail(97, 14, angle/1.3);
  tail(100, 4, angle/1.3);
  tail(110, 14, angle/1.3);
  tail(120, 7, angle/1.3);
  tail(130, 10, angle/1.3);
  tail(140, 1, angle/1.3);
  tail(150, 10, angle/1.3);
  tail(160, 6, angle/1.3);
  tail(170, 11, angle/1.3);
  tail(180, 5, angle/1.3);
  tail(200, 5, angle/1.3);
  tail(210, 9, angle/1.3);
  tail(225, 3, angle/1.3);
  tail(230, 6, angle/1.3);
  tail(240, 14, angle/1.3);
  tail(250, 12, angle/1.3);
  tail(260, 8, angle/1.3);
  tail(270, 10, angle/1.3);
  tail(280, 18, angle/1.3);
  tail(290, 4, angle/1.3);
  tail(300, 15, angle/1.3);
  tail(320, 10, angle/1.3);
  tail(330, 4, angle/1.3);
  tail(340, 5, angle/1.3);
  tail(350, 18, angle/1.3);
  tail(360, 5, angle/1.3);
  tail(370, 7, angle/1.3);
  tail(380, 3, angle/1.3);
  tail(390, 10, angle/1.3);
  tail(400, 8, angle/1.3);
  tail(410, 12, angle/1.3);
  tail(430, 6, angle/1.3);
  tail(440, 9, angle/1.3);
  tail(450, 3, angle/1.3);
  tail(460, 9, angle/1.3);
  tail(470, 7, angle/1.3);
  tail(480, 6, angle/1.3);
  tail(490, 11, angle/1.3);
  tail(500, 7, angle/1.3);
  tail(510, 2, angle/1.3);
  tail(520, 4, angle/1.3);
  tail(530, 4, angle/1.6);
  tail(540, 10, angle/1.3);
  tail(550, 7, angle/1.3);
  tail(560, 13, angle/1.3);
  tail(570, 3, angle/1.3);
  tail(580, 8, angle/1.3);
  tail(590, 14, angle/1.3);
  tail(600, 3, angle/1.3);
  tail(610, 6, angle/1.3);
  tail(620, 2, angle/1.3);
  tail(630, 12, angle/1.3);
  tail(640, 4, angle/1.3);
  tail(650, 7, angle/1.3);
  tail(660, 10, angle/1.3);
  tail(670, 3, angle/1.3);
  tail(680, 7, angle/1.3);
  tail(690, 2, angle/1.3);
  tail(700, 18, angle/1.3);
  tail(710, 5, angle/1.3);
  tail(720, 10, angle/1.3);
  tail(730, 4, angle/1.3);
  tail(740, 11, angle/1.3);
  tail(750, 3, angle/1.3);
  tail(760, 7, angle/1.3);
  tail(770, 3, angle/1.3);
  tail(780, 14, angle/1.3);
  tail(790, 6, angle/1.3);
  tail(800, 10, angle/1.3);
}

void tail(int x, int units, float angle) {
  pushMatrix();
  translate(x, 500);
  for (int i=units; i >0; i--) {
    strokeWeight(i);
    line(0, 0, 0, -8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
}



