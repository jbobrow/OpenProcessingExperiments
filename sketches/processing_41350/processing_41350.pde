
void setup() {
  size(800, 700);
  smooth();
}

void draw() {
  background(255);
  drawQuad(0, 0, 155, 0, 152, 94, 0, 92);
  drawQuad(450, 29, 606, 29, 605, 169, 451, 167);
   drawQuad(97, 149, 285, 152, 281, 336, 95, 332);
   drawQuad(375, 214, 555, 215, 554, 379, 372, 380);
   drawQuad(641, 292, 712, 290, 713, 362, 641, 362);
   drawQuad(425, 400, 563, 403, 561, 537, 423, 536);
   drawQuad(183, 411, 280, 414, 277, 529, 180, 530);
   drawQuad(650, 424, 773, 422, 772, 552, 650, 554);
}

void drawQuad(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {

  float rUL = detectRandom(x1, y1);
  float rUR = detectRandom(x2, y2);
  float rLR = detectRandom(x3, y3);
  float rLL = detectRandom(x4, y4);

  //build quad
  fill(255,0,0);
  stroke(255, 0, 0);
  quad(x1+rUL, y1+rUL, x2+rUR, y2+rUR, x3+rLR, y3+rLR, x4+rLL, y4+rLL);
  //quad(x1+rUL, y1+rUL, x2, y2, x3, y3, x4, y4);
}

float detectRandom(float x, float y)
{
  float distance = dist(x,y, mouseX, mouseY);
  float displace = 0;
  if (distance < 300)
    displace = random((300 - distance) / 50);
   return displace;
}



