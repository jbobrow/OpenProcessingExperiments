
int b = 0;
int r = 255;
int g = 255;
int pd = 20;
int s = 0;
int l = 200;
int bo = 0;
int px = mouseX+80;
int py = mouseY-60;
int ps = 5;
int d = 25;
int L = 1;
int time = 0;
int out = 1000;
float r1;
float g1;
float b1;
float a;
float bak;
float bak2;
float bak3;
float bb;
float diam;
float x;
float y;
float y1 = 42;
float y2 = -44;
float tx = 770;
float ty = 240;
float ty1 = 260;
float rx = 780;
float ry = 220;
float ry1 = 280;
float gx = 790;
float gy = 200;
float gy1 = 300;
float ply = 80;
float ply2 = 140;
float ply3 = 350;
float ply4 = 415;
boolean mouseMoved = false;
boolean keyReleased = false;
boolean win = false;
boolean lose = false;
boolean hit = false;
boolean miss = false;
boolean mouse = false;
boolean score = false;
void setup() {
  size(800, 500);
  smooth();
}
void draw() {
  if(mouse == true) {
    mouseY = mouseY;
  }
  if(mouse == false) {
    delay(d);
   mouseY = mouseY+int(random(y1));
   mouseY = mouseY+int(random(y2));
  }
loop();
background(200);
strokeWeight(8);
stroke(b);
line(tx, ty, tx, ty1);
stroke(r, 0, 0);
line(rx, ry, rx, ry1);
stroke(0, g, 0);
line(gx, gy, gx, gy1);
stroke(240, 73, 198);
line(790, ply, 790, ply2);
line(790, ply3, 790, ply4);
stroke(0);
strokeWeight(5);
float mx = constrain(mouseX, 0, 120);
line(mx, mouseY-60, mx+80, mouseY-60);
fill(0);
textSize(14);
text("level = ", 20, 30);
text(L, 66, 30);
time = time+1;
textSize(10);
text("time =", 600, 20);
text(time, 640, 20);
   if(time == out) {
     lose = true;
   }
   if(keyPressed) {
     if(key == 'x') {
     mouse = true;
stroke(20, 10, 255);
px = px+5;
py = mouseY-60;
mouseY = mouseY;
pd = int(20);
ellipse(px, py, ps, ps);
  }
   }
     if(px >= 786 && py <= ply2 && py >= ply) {
       s = s-5;
       lose = false;
       noLoop();
       fill(255, 0, 0);
       textSize(20);
       text(s, 700, 20);
     }
     if(px >= 786 && py <= ply4 && py >= ply3) {
       s = s-5;
       lose = false;
       noLoop();
       fill(255, 0, 0);
       textSize(20);
       text(s, 700, 20);
     }
     if(py < 200 && px >= 790) {
     lose = true;
   }
   if(py > 300 && px >= 790) {
     lose = true;
   }
    if(py >= 240 && py <= 260 && px >= 780) {
      s = s + 15;
      score = true;
      textSize(22);
      fill(255, 0, 0);
      text("Bulls eye!", 400, 250);
    }
    if(1 < 222) {
      stroke(255,200);
      strokeWeight(1);
      line(200, 0, 200, 500);
    }
    if(py >= 220 && py <= 280 && px >= 790) {
      s = s+10;
      score = true;
    }
     if(py >= 200 && py <= 300 && px >= 798) {
     s = s + 5;
     score = true;
   }
    if(score == true) {
      noLoop();
      textSize(16);
      fill(40);
      s = s+bo;
      text(s, 700, 20);
    }
    if(s >= 50) {
      win = true;
    } 
    if(win == true) {
      redraw();
      time = 0;
      out = out-50;
      background(255);
      textSize(22);
      fill(0, 0, 255);
      stroke(0, 0, 255);
      text("you win", 400, 250);
      fill(0);
      textSize(10);
      text("click", 400, 280);
      text("score = ", 670, 60);
      fill(60, 80, 80);
      text(s, 710, 60);
      text("bonuspoints =", 670, 80);
      bo = bo+s-50;
      text(bo, 742, 80);
      L = L + 1;
      d = d-5;
      y1 = y1 + 2;
      y2 = y2 - 2;
    }
       if(L >= 10) {
         win = false;
         lose = false;
        bak = random(255);
        bak2 = random(40);
        bak3 = random(60);
        bb = random(200);
        r1 = random(255);
        g1 = random(255);
        b1 = random(255);
        a = random(255);
        diam = random(100);
        x = random(width);
        y = random(height);
        noStroke();
        background(bak3, bak2, bak);
         fill(r1, g1, b1, a);
         ellipse(x, y, diam, diam);
         textSize(32);
         fill(0, 0, 255);
         text("you have completed this game", 5, 200);
         fill(0, 255, 0);
         text("designed by Timothy Warren Bennett", 5, 250);
         fill(255, 0, 0);
         text("this was done useing GOOSTERWARE", 5, 300);
       }
    if(lose == true) {
      background(0);
      lose = true;
      s = 0;
      bo = 0;
      time = 0;
      out = out+50;
      loop();
      fill(255);
      textSize(122);
      fill(255, 0, 0);
      text("YOU LOSE!!", 122, 260);
      textSize(10);
      fill(255);
      text("Click to play again", 390, 280);
      noLoop();
      y1 = y1-2;
      y2 = y2+2;
      redraw();
      L = L-1;
      d = d+5;
 
    }
   }
   void mouseClicked() {
     loop();
     background(200);
     b = 0;
     L = L;
     time = time;
     if(win == false) {
       redraw();
     s = s;
     }
     if(win == true) {
       s = 0;
       }
bo = bo;
time = time+1;
int r = 255;
int g = 255;
int pd = 20;
px = mouseX+80;
px = px;
int py = mouseY-60;
int ps = 5;
float tx = 770;
float ty = 240;
float ty1 = 260;
float rx = 780;
float ry = 220;
float ry1 = 280;
float gx = 790;
float gy = 200;
float gy1 = 300;
d = d;
win = false;
lose = false;
hit = false;
miss = false; 
mouse = false;
score = false;
   }
  void keyReleased() {
   if(px < 798)
   if(key == 'x') {
     lose = true;
   }
  }
