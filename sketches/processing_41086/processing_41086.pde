
void setup () {

  size (350, 350);
  smooth();
  stroke(77, 250, 46);
  fill(77, 240, 46);
  rect(0, 250, 350, 200);
  frameRate(5);
}

void drawFlower (int posX, int posY, color c) { 

  stroke(c);
  fill(c);
  ellipse(posX+10, posY, 16, 13);
  ellipse(posX-10, posY, 16, 13);
  ellipse(posX, posY+10, 13, 16);
  ellipse(posX, posY-10, 13, 16);
  stroke(255, 250, 95);
  fill(255, 247, 95);
  ellipse(posX, posY, 10, 10);
}


void draw() {
  background(random(76), random(240), random(90));
  drawFlower(20, 30, color (222, 36, 42));
  drawFlower (10, 10, color (245, 80, 24));
  drawFlower (50, 80, color (45, 158, 230));
  drawFlower (140, 50, color (89, 249, 100));
  drawFlower (50, 300, color (150, 28, 240));
  drawFlower (200, 250, color(190, 250, 87));
  drawFlower (80, 200, color (30, 178, 250));
  drawFlower (250, 200, color (250., 30, 140));
  drawFlower (170, 190, color (43, 123, 98));
  drawFlower (290, 45, color (169, 0, 240));
  drawFlower (250, 200, color (random(250), random(170), random(200)));
  drawFlower (120, 260, color (random(150), random (250), random (250)));
  drawFlower (200, 250, color (random(250), random(250), random(250)));
  drawFlower(290, 80, color (random(10), random(220), random (150)));
  drawFlower (300, 320, color (random (240), random (220), random (140)));
  drawFlower (150, 150, color (random (250), random (50), random (180)));
}  

