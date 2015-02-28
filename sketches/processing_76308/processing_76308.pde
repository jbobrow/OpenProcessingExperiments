
//Japanese doll puppet
//By Luo Yi Tan
//Bezier curve animation referenced and modified from 
//https://www.youtube.com/watch?v=MJWdbY0TISg

PImage body, sleeve, sleeve2;
int lim = 50;
Sakura[] sa = new Sakura[lim];
int num = 0;
  
void setup() {
  size(500, 550);
  body = loadImage("http://i.imgur.com/fkho6.png");  
  sleeve = loadImage("http://i.imgur.com/Yrp2i.png");
  sleeve2 = loadImage("http://i.imgur.com/wFAGI.png");
  tree = loadImage("http://i.imgur.com/7bY8Y.png");
  smooth();
}


void draw() {
  background(150, 255, 255);
  fill(65, 250, 30);
  rect(0, 400, width, 200);
  fill(255, 255, 100);
  ellipse(400, 50, 75, 75);
  for (int i = 0; i < 3; i++) {
    image(tree, i*200-70, 10);
  }
  noStroke();

  for (int i = 0; i < num; i++) {
    sa[i%lim].fall();
    sa[i%lim].display();
  }
  drawHairFlow(214, 130);
  //drawHair(250, 150);
  drawBodyParts(170, 195);
  drawHead(250, 150);
  if (mouseX < width/2) {
    drawSleeves(170, 205);
    drawSleeves2(170, 205);
  }
  else {
    drawSleeves2(170, 205);
    drawSleeves(170, 205);
  }
  noStroke();
}

void mousePressed() {
  sa[num%lim] = new Sakura(random(-1, 200), random(0, 10), 3);
  num += 1;
}

void drawHead(float hx, float hy) {
  float dx = constrain((mouseX-hx)/20, -2, 2);
  float dy = constrain((mouseY-hy)/20, -2, 2);
  float ex = constrain((mouseX-hx)/20, -5, 5);
  float ey = constrain((mouseY-hy)/20, -2, 6);
  stroke(0);
  fill(255, 255, 255);
  ellipse(hx + dx, hy + dy, 100, 110);
  fill(0, 0, 0);
  ellipse(hx - 25 + ex, hy + ey, 10, 10);
  ellipse(hx + 25 + ex, hy + ey, 10, 10);
  hx = hx + dx;
  hy = hy + dy;
  beginShape();
  vertex(hx - 50, hy - 10);
  vertex(hx - 35, hy - 10);
  vertex(hx - 30, hy - 35);
  vertex(hx - 25, hy - 10);
  vertex(hx - 5, hy - 10);
  vertex(hx, hy - 35);
  vertex(hx + 5, hy - 10);
  vertex(hx + 25, hy - 10);
  vertex(hx + 30, hy - 35);
  vertex(hx + 35, hy - 10);
  vertex(hx + 55, hy - 10);
  bezierVertex(hx + 55, hy - 90, hx - 55, hy  - 90, 
  hx - 55, hy - 10);
  endShape(CLOSE);
}

void drawHairFlow(float hx, float hy) {
  float dx = constrain((mouseX-hx)/20, -2, 2);
  float dy = constrain((mouseY-hy)/20, -2, 2);
  stroke(0);
  strokeWeight(30);
  strokeCap(PROJECT);
  noFill();
  float t1 = frameCount / 100.0;
  float t2 = (frameCount + 1234)/ 100.0;
  float n = map(t1, 0, 1, hy, hy + 200);

  for (int i = 1; i < 25; i++) {
    float n1 = noise(4, i, t1)*height+100;
    float n2 = noise(5, i, t2)*height+100;
    float cons1 = constrain(n1, 300, 400);
    float cons2 = constrain(n2, 350, 500);
    bezier(
    hx+i*3 + dx, hy, 
    hx+i*3 + dx, hy + noise(1, i, t1), 
    noise(2, i, t1)*width + 100, cons1, 
    noise(3, i, t2)*width + 100, cons2
      );
  }
  strokeWeight(1);
}

void drawHair(float hx, float hy) {
  float dx = constrain((mouseX-hx)/20, -2, 2);
  float dy = constrain((mouseY-hy)/20, -2, 2);
  hx = hx + dx;
  hy = hy + dy;
  fill(0);
  beginShape();
  vertex(hx + 60, hy - 20);
  vertex(hx + 60, hy + 150);
  vertex(hx - 60, hy + 150);
  vertex(hx - 60, hy - 20);
  endShape();
}

void drawBodyParts(float bx, float by) {
  float fx = constrain((mouseX-bx)/20, -2, 2);
  image(body, bx + fx, by);
}

void drawSleeves(float sx, float sy) {
  float rot1 = map(mouseY, height, 0, 0, PI/8);
  float rot2 = map(mouseY, height, 0, 0, PI/6);
  float sc = map(mouseX, 0, width/2, 1, -0.05);
  float sc2 = map(mouseX, width/2, width, -0.05, 1);
  fill(255);

  pushMatrix();
  translate(sx, sy);
  translate(40, 0);
  rotate(rot1);
  scale(sc, 1);
  image(sleeve, -35, 0);
  translate(-40, 60);
  rotate(rot1);
  image(sleeve2, -70, 0);
  translate(-20, 50);
  rotate(rot2);
  ellipse(-75, 15, 50, 20);
  popMatrix();
}

void drawSleeves2 (float sx, float sy) {
  float rot1 = map(mouseY, height, 0, 0, PI/8);
  float rot2 = map(mouseY, height, 0, 0, PI/6);
  float sc = map(mouseX, 0, width/2, 1, -0.05);
  float sc2 = map(mouseX, width/2, width, -0.05, 1);
  fill(255);

  pushMatrix();
  translate(width - sx, sy);
  scale(-1, 1);
  translate(35, 0);
  rotate(rot1);
  scale(sc2, 1);
  image(sleeve, -35, 0);
  translate(-35, 60);
  rotate(rot1);
  image(sleeve2, -70, 0);
  translate(-20, 50);
  rotate(rot2);
  ellipse(-75, 15, 50, 20);
  popMatrix();
}

void drawBody(float bx, float by) {
  fill(255);
  beginShape();
  vertex(bx - 10, by);
  vertex(bx - 60, by + 350);
  vertex(bx + 60, by + 350);
  vertex(bx + 10, by);
  endShape();
}

class Sakura {
  float x, y, s;
  float changex = random(0, 4);
  float changey = random(1, 2);
  Sakura(float xx, float yy, float si) {
    x = xx;
    y = yy;
    s = si;
  }
  void display () {
    float n1 = noise((millis()+changex*1000)/2001.9);
    float ns = map(n1, 0, 1, 0.5, 2);
    float nr = map(n1, 0, 1, 0, 360);
    fill(255, 200, 235);
    pushMatrix();

    translate(x, y);
    scale(ns);
    rotate(radians(nr));
    translate(-x, -y);

    beginShape();
    vertex(x, y+20);
    bezierVertex(x - 10, y+10, x - 10, y -20, x - 5, y - 20);
    vertex(x, y - 10);
    vertex(x + 5, y - 20);
    bezierVertex(x + 10, y - 20, x + 10, y + 10, x, y + 20);
    endShape();
    popMatrix();
    x += random(changex);
    y += changey;
  }
  void fall() {
  }
}
