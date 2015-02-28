
int mid = 250;
int lim = 40; //limits the number of falling things
Fall[] things = new Fall[lim];
int numthings = 0;
PImage falling, cloud, fire;

class Fall {
  float x, y, vy;
  float si;
  float grav1 = map(mouseX, 0, width/2, 0.03, 0);
  float grav2 = map(mouseX, width/2, width, 0, 0.04);
  
  Fall(float xin, float yin, float s) {
    s = random(0.3, 1);
    x = xin;
    y = yin;
    si = s;
  }
  
  void fall() {
    if (mouseX < width/2) 
      vy += grav1;
    else
      vy += grav2;
    y += vy;
  }
  
  void display() {
    pushMatrix();
      translate(x, 0);
      scale(si);
      if (mouseX < mid)
        falling = cloud;
      else
        falling = fire;
      image(falling, 0, y);
    popMatrix();
  }
}
  
void setup() {
  size(500, 500);
  cloud = loadImage("http://i.imgur.com/exOMC.png");
  fire = loadImage("http://i.imgur.com/xNNvv.png");
  smooth();
}

void draw() {
  float r = map(mouseX, 0, width, 125, 175);
  float g = map(mouseX, 0, width, 230, 60);
  float b = map(mouseX, 0, width, 255, 30);
  float a1 = map(mouseX, 0, width/2, 0, 255);
  float a2 = map(mouseX, width/2, width, 255, 0);
  background(r, g, b);
  if (numthings < lim)  {
    for (int i = 0; i < numthings % lim; i++) {
      things[i].display();
      things[i].fall();
    }
  }
  else {
    for (int i = 0; i < lim; i++) {
      things[i].display();
      things[i].fall();
    }
  }
  if (mouseX < mid) {
    noStroke();
    fill(r, g, b, a1);
    rect(0, 0, 500, 500);
    drawCloud();
    drawWings();
  }
  else {
    noStroke();
    fill(r, g, b, a2);
    rect(0, 0, 500, 500);
    fill(255, 50, 0);
    pushMatrix(); 
    translate(-20, -100);
    drawFire();
    popMatrix();

    fill(255, 115, 0);
    pushMatrix(); 
    translate(-20, -40);
    drawFire();
    popMatrix();

    fill(255, 250, 0);
    pushMatrix(); 
    translate(-20, 20);
    drawFire();
    popMatrix();
    drawChaosWings();
    drawHorns();
  }
  drawBase();
  if (mouseX < mid) {
    drawEyes();
    drawHalo();
  }
  else {
    drawChaosEye();
  }
}

void drawBase() {
  float aniHead;
  float animate;
  if (mouseX < width/2) {
    aniHead = map(mouseX, 0, width, 5, 0);
    animate = sin(frameCount*0.1) * aniHead;
  }
  else {
    aniHead = map(mouseX, width/2, width, 0, 4);
    animate = sin(frameCount*0.5) * aniHead;
  }
  float g = map(mouseX, width/2, width, 255, 0);
  float b = map(mouseX, width/2, width, 255, 0);
  fill(random(210, 255), g+random(0, 30), b+random(0, 30));
  beginShape();
  vertex(220, 250 + animate);
  vertex(170, 440 + animate);
  vertex(330, 440 + animate);
  vertex(280, 250 + animate);
  endShape();
  if (mouseX > width/2) {
    float flash = map(mouseX, width/2, width, 1, 0.85);
    fill(flash*random(230, 255), flash*random(200, 229), 
         flash*random(160, 190));
  }
  else fill(255, 229, 190);
  ellipse(250, 200 + animate, 130, 140);
}

void drawEyes() {
  float aniHead = map(mouseX, 0, width, 7, 0);
  float animate = sin(frameCount*0.1) * aniHead;
  float eyeH = map(mouseX, 0, width/2, 1, 20);
  fill(255, 255, 255);
  ellipse(mid - 30, 200 + animate, 20, eyeH);
  ellipse(mid + 30, 200 + animate, 20, eyeH);
}

void drawHalo() {
  float aniHead = map(mouseX, 0, width/2, 5, 0);
  float haloH = map(mouseX, 0, width/2, 20, 0);
  float haloW = map(mouseX, 0, width/2, 100, 0);
  float animate = sin(frameCount*0.1) * aniHead;
  strokeWeight(5);
  stroke(255, 255, 0);
  noFill();
  ellipse(mid, 100 + animate, haloW, haloH);
  strokeWeight(1);
  stroke(0);
  fill(255);
}

void drawWing(int wx, int wy) {
  float aniHead = map(mouseX, 0, width/2, 5, 0);
  float animate = sin(frameCount*0.1) * aniHead;
  beginShape();
  vertex(wx, wy + animate);
  bezierVertex(wx - 50, wy - 100 + animate, wx - 110, wy + animate, 
  wx - 130, wy + 100 + animate);
  bezierVertex(wx - 130, wy + 130 + animate, wx - 110, wy + 100 
    + animate, wx - 100, wy + 70 + animate);
  bezierVertex(wx - 100, wy + 100 + animate, wx - 80, wy + 70 
    + animate, wx - 70, wy + 40 + animate);
  bezierVertex(wx - 70, wy + 70 + animate, wx - 50, wy + 40 
    + animate, wx - 40, wy + 20 + animate);
  bezierVertex(wx - 40, wy + 50 + animate, wx - 20, wy + 10
    + animate, wx - 10, wy + animate);
  endShape();
}

void drawWings() {
  float aniHead = map(mouseX, 0, width/2, 1, 0);
  float animate = sin(frameCount*0.1) * aniHead;
  float s = map(mouseX, 0, width/2, 1, 0.3);
  fill(255, 255, 255);
  pushMatrix();
  translate(250, 300);
  rotate(PI/8 * animate *0.1);
  scale(s, s);
  drawWing(-20, 0);
  popMatrix();

  pushMatrix();
  translate(250, 300);
  rotate(-PI/8 * animate *0.1);
  scale(-s, s);
  drawWing(-20, 0);
  popMatrix();
}

void drawChaosEye() {
  float aniHead = map(mouseX, width/2, width, 0, 4);
  float animate = sin(frameCount*0.5) * aniHead;
  float eyeW = map(mouseX, width/2, width, 0, 5);
  float eyeH = map(mouseX, width/2, width, 20, 1);
  float eyeFill = map(mouseX, width/2, width, 255, 0);
  fill(250, 250, eyeFill);
  pushMatrix();
  translate(mid - 30, 200 + animate);
  rotate(PI/4);
  ellipse(0, 0, 20 + eyeW, eyeH + animate);
  popMatrix();

  pushMatrix();
  translate(mid + 30, 200 + animate);
  rotate(-PI/4);
  ellipse(0, 0, 20 + eyeW, eyeH + animate);
  popMatrix();
}

void drawHorn() {
  float aniHead = map(mouseX, width/2, width, 0, 4);
  float animate = sin(frameCount*0.5) * aniHead;
  int hx = -40;
  int hy = 0;
  beginShape();
  vertex(hx, hy + 40 + animate); 
  bezierVertex(hx - 50, hy + 20 + animate, hx - 50, hy - 80 
    + animate, hx, hy - 100 + animate);
  vertex(hx, hy - 100 + animate);
  bezierVertex(hx - 30, hy - 80 + animate, hx - 30, hy + 40 
    + animate, hx + 50, hy - 20 + animate);
  endShape();
}

void drawHorns() {
  float s = map(mouseX, width/2, width, 0.2, 1);
  fill(random(200, 255), 0, 0);
  pushMatrix();
  translate(250, 150);
  scale(s, s);
  drawHorn();
  popMatrix();

  pushMatrix();
  translate(250, 150);
  scale(-s, s);
  drawHorn();
  popMatrix();
}


void drawChaosWing(int wx, int wy) {
  float aniHead = map(mouseX, width/2, width, 0, 4);
  float animate = sin(frameCount*0.5) * aniHead;
  beginShape();
  vertex(wx, wy + animate);
  bezierVertex(wx - 50, wy - 150 + animate, wx - 110, wy - 50
    + animate, wx - 130, wy + 100 + animate);
  bezierVertex(wx - 130, wy + 80 + animate, wx - 110, wy + 50 
    + animate, wx - 100, wy + 70 + animate);
  bezierVertex(wx - 100, wy + 50 + animate, wx - 80, wy + 20 
    + animate, wx - 70, wy + 40 + animate);
  bezierVertex(wx - 70, wy + 20 + animate, wx - 50, wy - 10 
    + animate, wx - 40, wy + 20 + animate);
  bezierVertex(wx - 40, wy + animate, wx - 20, wy - 40
    + animate, wx - 10, wy + animate);
  endShape();
}

void drawChaosWings() {
  float aniHead = map(mouseX, width/2, width, 0, 2);
  float animate = sin(frameCount*0.4) * aniHead;
  float s = map(mouseX, width/2, width, 0.3, 1);
  fill(0, 0, 0);
  pushMatrix();
  translate(250, 320);
  rotate(PI/8 * animate * 0.1);
  scale(s, s);
  drawChaosWing(-25, 0);
  popMatrix();

  pushMatrix();
  translate(250, 320);
  rotate(-PI/8 * animate * 0.1);
  scale(-s, s);
  drawChaosWing(-25, 0);
  popMatrix();
}

void drawHalfCloud() {
  float aniHead = map(mouseX, 0, width/2, 5, 0);
  float animate = sin(frameCount*0.1) * aniHead;
  beginShape();
  vertex(250, 470 + animate);
  bezierVertex(250, 500 + animate, 200, 500 + animate, 200, 
  470 + animate);
  vertex(200, 470 + animate);
  bezierVertex(180, 500 + animate, 160, 490 + animate, 150, 
  470 + animate);
  vertex(150, 470 + animate);
  bezierVertex(120, 490 + animate, 100, 440 + animate, 120, 
  420 + animate);
  vertex(120, 420 + animate);
  bezierVertex(110, 390 + animate, 140, 380 + animate, 150, 
  390 + animate);
  vertex(150, 390 + animate);
  bezierVertex(145, 350 + animate, 200, 350 + animate, 190, 
  380 + animate);
  vertex(250, 250 + animate);
  endShape();
}

void drawCloud() {
  noStroke();
  fill(255, 255, 255);
  float s = map(mouseX, width/2, 0, 0, 1);
  pushMatrix(); 
  translate(250, 400);
  scale(s, s);
  translate(-250, -400);
  drawHalfCloud();
  popMatrix();

  pushMatrix(); 
  translate(250, 400);
  scale(-s, s);
  translate(-250, -400);
  drawHalfCloud();
  popMatrix();
  stroke(0);
}

void drawFire() {
  float aniHead = map(mouseX, width/2, width, 0, 6);
  float animate = sin(frameCount*0.4) * aniHead;
  float moveup = map(mouseX, width/2, width, 200, 0);
  noStroke();
  beginShape();
  vertex(0, moveup + 500);
  vertex(0, moveup + 450);

  for (int i = 0; i < 500; i += 80) {
    vertex(i+20, moveup + 420);
    bezierVertex(i+22+ animate, moveup + 425 + animate, i+50+ animate, moveup + 420+ animate, i+30, moveup + 400+ animate);
    bezierVertex(i+40+ animate, moveup + 405 + animate, i+50+ animate, moveup + 400+ animate, i+50, moveup + 420+ animate);
    bezierVertex(i+50+ animate, moveup + 440 + animate, i+90+ animate, moveup + 400+ animate, i+60, moveup + 380+ animate);
    bezierVertex(i+80+ animate, moveup + 390 + animate, i+90+ animate, moveup + 440+ animate, i+100, moveup + 420+ animate);
  }
  vertex(500, moveup + 500);
  endShape();
  stroke(0);
}

void mouseClicked() {
  things[numthings%lim] = new Fall(random(30, 450), 10, 1);
  numthings += 1;
}
