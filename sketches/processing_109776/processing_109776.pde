
int x;
int y;
int a;
int b;
int c;
int d;
int X;
int Y;
int vx;
int vy;
int VX;
int VY;
int VVX;
int VVY;
int vvx;
int vvy;
int count = 0;
int tm0=0;
int ms;
int s;
int m;
float r = 50;
float k;
float vk;
PFont font = createFont("MS Gothic", 48, true);
void setup() {
  colorMode(RGB, 256);
  background(255);
  size(500, 500);
  background(255);
  textFont(font);
  textSize(18);
  frameRate(50);
  x = height/2;
  y = height/2;
  X = height/2;
  Y = height/2;
  a = height/2;
  b = height/2;
  c = height/2;
  d = height/2;
  k = 0;
  vx = 5;
  vy = 6;
  VX = 5;
  VY = 6;
  VVX = -5;
  VVY = -6;
  vvx = 5;
  vvy = 6;
  vk = -0.1;
}
void draw() { 
  background(255);
  haikei(height/2, height/2);
  chara(x-50, y-70);
  gokuraku(X, Y);
  fill(0);
  text("HP:", 5, 20);
  x = x + vx;
  y = y + vy;
  X = X + VX;
  Y = Y + VY;
  a = a + VVX;
  b = b + VVY;
  c = c + vvx;
  d = d + vvy;
  k = k + vk;
  if (k < -630) {
    k=width;
  }
  if (x > width-40) {
    vx=-5;
  }
  if (x < 40) {
    vx=5;
  }
  if (y >height-110) {
    vy=-6;
  }
  if (y < 40) {
    vy=6;
  }
  if (X > width-70) {
    VX=-5;
  }
  if (X < 0) {
    VX=5;
  }
  if (Y >height) {
    VY=-6;
  }
  if (Y < 0) {
    VY=6;
  }
  if (mousePressed) {
    if ((mouseX > x-50)&&(mouseX < x+50)&&(mouseY > y-50)&&(mouseY < y+50)) {
      x =constrain(mouseX, 0, 500);
      y =constrain(mouseY, 0, 500);
      noFill();
      int tm=millis()-tm0;
      ms=tm%1000;
      if (ms>=1) {
        s=(tm-ms)/1000;
      }
      text(nf(m, 2)+":"+nf(s, 2), 5, 40);
    }
    if (X > width-70) {
      VX=int(random(-8, -25));
    }
    if (X < 0) {
      VX=int(random(8, 100));
    }
    if (Y > height) {
      VY=int(random(-8, -25));
    }
    if (Y < 0) {
      VY=int(random(8, 100));
    }
    if (a > width-70) {
      VVX=int(random(-8, -25));
    }
    if (a < 0) {
      VVX=int(random(8, 25));
    }
    if (b > height) {
      VVY=int(random(-8, -25));
    }
    if (b < 0) {
      VVY=int(random(8, 25));
    }
    if (c > width-70) {
      vvx=int(random(-8, -100));
    }
    if (c < 0) {
      vvx=int(random(8, 100));
    }
    if (d > height) {
      vvy=int(random(-8, -100));
    }
    if (d < 0) {
      vvy=int(random(8, 100));
    }
    if ( (r >= abs(x-X)) &&(r+20 >= abs(y-Y)) ) {
      if (x<=X) {
        VX=20;
        VY=5;
        count = count + 1;
      }
      if (y<=Y) {
        VX=5;
        VY=20;
        count = count + 1;
      }
      if (X<=x) {
        VX=-20;
        VY=-5;
        count = count + 1;
      }
      if (Y<=y) {
        VX=-5;
        VY=-20;
        count = count + 1;
      }
    }
    if (s<5) {
    }
    else {
      if ( (r >= abs(x-a)) &&(r+20 >= abs(y-b)) ) {
        if (x<=a) {
          VVX=20;
          VVY=5;
          count = count + 1;
        }
        if (y<=b) {
          VVX=5;
          VVY=20;
          count = count + 1;
        }
        if (a<=x) {
          VVX=-20;
          VVY=-5;
          count = count + 1;
        }
        if (b<=y) {
          VVX=-5;
          VVY=-20;
          count = count + 1;
        }
      }
    }
    if (s<9) {
    }
    else {
      if ( (r >= abs(x-c)) &&(r+20 >= abs(y-d)) ) {
        if (x<=c) {
          vvx=20;
          vvy=5;
          count = count + 1;
        }
        if (y<=d) {
          vvx=5;
          vvy=20;
          count = count + 1;
        }
        if (c<=x) {
          vvx=-20;
          vvy=-5;
          count = count + 1;
        }
        if (d<=y) {
          vvx=-5;
          vvy=-20;
          count = count + 1;
        }
      }
    }
  }      
  else {
    fill(0, 170, 255, 50);
    ellipse(x, y+25, 250, 250);
    tm0=millis();
  }
  if (s>4) {
    gokuraku2(a, b);
  }
  if (s>9) {
    gokuraku3(c, d);
  }
  if (count>14) {
    fill(0);
    text("GAME OVER", height/2-40, height/2);
    noLoop();
  }
  else {
    fill(255, 0, 0);
    rect(35, 8.5, max(0, 465-count*30), 10);
  }
  if (s>14) {
    fill(255);
    rect(0, 0, 1000, 1000);
    fill(0);
    text("CLEAR!!", height/2-40, height/2);
    noLoop();
  }
}

void chara(int a, int b) {
  pushMatrix();
  translate(a, b);
  noStroke();
  strokeWeight(1);
  fill(210, 120, 40);
  ellipse(50, 80, 20, 20);
  fill(222, 138, 60);
  ellipse(50, 50, constrain(y-100, 75, 80), 60);
  triangle(20, 10, 15, 40, 40, 30);
  triangle(80, 10, 60, 30, 85, 40);
  fill(0);
  ellipse(35, 45, 20, 15);
  ellipse(65, 45, 20, 15);
  stroke(0);
  line(12, 42, 30, 45);
  line(45, 45, 55, 45);
  line(70, 45, 88, 42);
  line(50, 57, 45, 62);
  line(50, 57, 55, 62);
  pushMatrix();
  translate(35, 54);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, 3.3));
  line(16, 0, 0, 0);
  popMatrix();
  pushMatrix();
  translate(35, 56);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, 3.08));
  line(16, 0, 0, 0);
  popMatrix();
  pushMatrix();
  translate(35, 58);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, 2.84));
  line(16, 0, 0, 0);
  popMatrix();
  pushMatrix();
  translate(65, 54);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, -3.3));
  line(-16, 0, 0, 0);
  popMatrix();
  pushMatrix();
  translate(65, 56);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, -3.08));
  line(-16, 0, 0, 0);
  popMatrix();
  pushMatrix();
  translate(65, 58);
  rotate(map(constrain(y+100, 250, 500), 0, 400, 0, -2.84));
  line(-16, 0, 0, 0);
  popMatrix();
  line(50, 20, 50, 35);
  line(45, 24, 55, 24);
  line(45, 28, 55, 28);
  strokeJoin(ROUND);
  triangle(45, 52, 55, 52, 50, 57);
  noStroke();
  pushMatrix();
  translate(22.5, 90);
  rotate(map(constrain(y+100, 290, 500), 0, 180, 0, -2.84));
  rotate(map(constrain(x+200, 390, 500), 0, 180, 0, 2.84));
  fill(210, 120, 40);
  ellipse(0, 25, 15, 15);
  fill(232, 232, 232);
  rect(-7.5, 0, 15, 25);
  popMatrix();
  pushMatrix();
  translate(77, 90);
  rotate(map(constrain(y+100, 290, 500), 0, 180, 0, 2.84));
  rotate(map(constrain(x+100, 290, 400), 0, 180, 0, 2.84));
  fill(210, 120, 40);
  ellipse(0, 25, 15, 15);
  fill(232, 232, 232);
  rect(-7.5, 0, 15, 25);
  popMatrix();
  fill(0);
  rect(33, constrain(y-120, 110, 160), 12, 10);
  rect(55, constrain(y-120, 110, 160), 12, 10);
  arc(30, constrain(y-110, 120, 170), 30, 20, -PI, 0);
  arc(70, constrain(y-110, 120, 170), 30, 20, -PI, 0);
  fill(232, 232, 232);
  quad(0, 80, 30, 65, 70, 100, 30, 100);
  quad(30, 100, 70, 65, 100, 80, 70, 100);
  quad(10, 100, 15, 90, 80, 85, 90, 100);
  quad(10, 100, 5, constrain(y-120, 110, 160), 95, constrain(y-120, 110, 160), 90, 100);
  popMatrix();
}
void gokuraku(int a, int b) {
  pushMatrix();
  translate(a, b);
  fill(0);
  textSize(18);
  text("Gokuraku", 0, 0);
  popMatrix();
}

void gokuraku2(int a, int b) {
  pushMatrix();
  translate(a, b);
  fill(0);
  textSize(18);
  text("Gokuraku", 0, 0);
  popMatrix();
}
void gokuraku3(int a, int b) {
  pushMatrix();
  translate(a, b);
  fill(0);
  textSize(18);
  text("Gokuraku", 0, 0);
  popMatrix();
}
void haikei(int a, int b) {
  background(10, 200, 255);
  fill(255);
  ellipse(k+10, 40, 150, 40);
  ellipse(k+90, 70, 150, 40);
  ellipse(k+300, 170, 150, 40);
  ellipse(k+550, 100, 150, 40);
  strokeWeight(2);
  stroke(115,40,15);
  fill(180, 45, 45);
  rect(440, 130, 30, 200);
  fill(255, 220, 105);
  rect(250, 300, 240, 200);
  fill(215, 150, 40);
  rect(300, 350, 60, 200);
  fill(180, 45, 45);
  ellipse(350, 410, 10, 10);
  fill(210, 245, 255);
  rect(400, 340, 60, 40);
  fill(250, 48, 48);
  triangle(370, 100, 220, 300, 520, 300);
  stroke(70);
  fill(165, 165, 165);
  rect(-10, 470, 520, 30);
}



