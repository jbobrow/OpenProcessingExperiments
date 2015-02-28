
void easy() {
  background(0);
  if (keyPressed) {
    if (keyCode == RIGHT) {
      tx += 3;
    }
    if (keyCode == LEFT) {
      tx -= 3;
    }
    if (keyCode == UP) {
      ty -= 3;
    }
    if (keyCode == DOWN) {
      ty += 3;
    }
  }
  fill(255);
  for(i = 0;i < 10;i ++) {
    rect(x[i],y[i],10,10);
    y[i] += s[i];
    if (y[i] > 500) {
      x[i] = random(150);
      s[i] = random(4,6);
      y[i] = 0;
    }
    if (keyPressed) {
      if (key == ' ') {
        textSize(30);
        text(" RESINED ",7,240);
        act = 10;
      }
    }
    if (ty >= y[i] - 5 && ty <= y[i] + 5 && tx >= x[i] - 5 && tx <= x[i] + 5) {
      textSize(25);
      text("GAMEOVER",7,240);
      act = 10;
    }
  }
  fill(255);
  rect(tx,ty,3,3);
  if (tx <= 0) {
    tx = 3;
  }
  if (tx >= 150) {
    tx = 147;
  }
  if (ty <= 0) {
    ty = 3;
  }
  if (ty >= 500) {
    ty = 497;
  }
  i = 0;
  fill(255);
  textSize(30);
  text(nokori,10,40);
  nokori --;
  if (nokori < 0) {
    text("CLEAR!!",18,240);
    act = 11;
  }
}
void endless() {
  background(0);
  if (es < 1000) {
    rs = 10;
  } else if (es < 2500) {
    rs = 15;
  } else if (es < 5000) {
    rs = 20;
  } else if (es < 10000) {
    rs = 25;
  } else if (es < 30000) {
    rs = 30;
  } else {
    rs = 35;
  }
  if (keyPressed) {
    if (keyCode == RIGHT) {
      tx += 3;
    }
    if (keyCode == LEFT) {
      tx -= 3;
    }
    if (keyCode == UP) {
      ty -= 3;
    }
    if (keyCode == DOWN) {
      ty += 3;
    }
  }
  fill(255);
  for(i = 0;i < 12;i ++) {
    if (es > 800 && es < 1000) {
      fill(random(255), random(255), random(255));
    } else if (es > 2300 && es < 2500) {
      fill(random(255), random(255), random(255));
    } else if (es > 4800 && es < 5000) {
      fill(random(255), random(255), random(255));
    } else if (es > 9800 && es < 10000) {
      fill(random(255), random(255), random(255));
    } else if (es > 28000 && es < 30000) {
      fill(random(255), random(255), random(255));
    } else {
      fill(255);
    }
    rect(x[i],y[i],rs,rs);
    y[i] += s[i];
    if (y[i] > 500) {
      x[i] = random(150);
      s[i] = random(4,6);
      y[i] = 0;
    }
    fill(255);
    if (keyPressed) {
      if (key == ' ') {
        textSize(30);
        text(" RESINED ",7,240);
        act = 100;
      }
    }
    if (ty >= y[i] - rs/2 && ty <= y[i] + rs/2 && tx >= x[i] - rs/2 && tx <= x[i] + rs/2) {
      textSize(25);
      text("GAMEOVER",7,240);
      act = 100;
    }
  }
  fill(255);
  rect(tx,ty,3,3);
  if (tx <= 0) {
    tx = 3;
  }
  if (tx >= 150) {
    tx = 147;
  }
  if (ty <= 0) {
    ty = 3;
  }
  if (ty >= 500) {
    ty = 497;
  }
  i = 0;
  fill(255);
  textSize(30);
  if (es > hs) {
    fill(255,0,0);
  }
  text(es,10,40);
  es ++;
}
void hard() {
  background(0);
  if (keyPressed) {
    if (keyCode == RIGHT) {
      tx += 3;
    }
    if (keyCode == LEFT) {
      tx -= 3;
    }
    if (keyCode == UP) {
      ty -= 3;
    }
    if (keyCode == DOWN) {
      ty += 3;
    }
  }
  fill(255);
  for(i = 0;i < 15;i ++) {
    rect(x[i],y[i],20,20);
    y[i] += s[i];
    if (y[i] > 500) {
      x[i] = random(150);
      s[i] = random(4,6);
      y[i] = 0;
    }
    if (keyPressed) {
      if (key == ' ') {
        textSize(30);
        text(" RESINED ",7,240);
        act = 10;
      }
    }
    if (ty >= y[i] - 10 && ty <= y[i] + 10 && tx >= x[i] - 10 && tx <= x[i] + 10) {
      textSize(25);
      text("GAMEOVER",7,240);
      act = 10;
    }
  }
  fill(255);
  rect(tx,ty,3,3);
  if (tx <= 0) {
    tx = 3;
  }
  if (tx >= 150) {
    tx = 147;
  }
  if (ty <= 0) {
    ty = 3;
  }
  if (ty >= 500) {
    ty = 497;
  }
  i = 0;
  fill(255);
  textSize(30);
  text(nokori,10,40);
  nokori --;
  if (nokori < 0) {
    text("CLEAR!!",18,240);
    act = 13;
  }
}
void normal() {
  background(0);
  if (keyPressed) {
    if (keyCode == RIGHT) {
      tx += 3;
    }
    if (keyCode == LEFT) {
      tx -= 3;
    }
    if (keyCode == UP) {
      ty -= 3;
    }
    if (keyCode == DOWN) {
      ty += 3;
    }
  }
  fill(255);
  for(i = 0;i < 12;i ++) {
    rect(x[i],y[i],15,15);
    y[i] += s[i];
    if (y[i] > 500) {
      x[i] = random(150);
      s[i] = random(4,6);
      y[i] = 0;
    }
    if (keyPressed) {
      if (key == ' ') {
        textSize(30);
        text(" RESINED ",7,240);
        act = 10;
      }
    }
    if (ty >= y[i] - 7.5 && ty <= y[i] + 7.5 && tx >= x[i] - 7.5 && tx <= x[i] + 7.5) {
      textSize(25);
      text("GAMEOVER",7,240);
      act = 10;
    }
  }
  fill(255);
  rect(tx,ty,3,3);
  if (tx <= 0) {
    tx = 3;
  }
  if (tx >= 150) {
    tx = 147;
  }
  if (ty <= 0) {
    ty = 3;
  }
  if (ty >= 500) {
    ty = 497;
  }
  i = 0;
  fill(255);
  textSize(30);
  text(nokori,10,40);
  nokori --;
  if (nokori < 0) {
    text("CLEAR!!",18,240);
    act = 12;
  }
}
void sai() {
  background(0);
  textSize(30);
  fill(255);
  text("EASY",10,50);
  textSize(10);
  text("Press E To Start",10,70);
  textSize(30);
  fill(255);
  text("NORMAL",10,100);
  textSize(10);
  text("Press N To Start",10,120);
  textSize(30);
  fill(255);
  text("HARD",10,150);
  textSize(10);
  text("Press H To Start",10,170);
  if (hc >= 3) {
    textSize(30);
    fill(255);
    text("VERY HARD",10,200);
    textSize(10);
    text("Press V To Start",10,220);
  }
  fill(255);
  text("EASY CLEAR",10,250);
  text(ec,80,250);
  fill(255);
  text("NORMAL CLEAR",10,270);
  text(nc,90,270); 
  fill(255);
  text("HARD CLEAR",10,290);
  text(hc,80,290);
  fill(255);
  if (hc >= 3) {
    text("VERY HARD CLEAR",10,310);
    text(vc,120,310);
  }
  textSize(30);
  fill(255);
  text("ENDLESS", 10, 350);
  textSize(10);
  text("Press L To Start", 10, 370);
  text("ENDLESS High Score", 10, 420);
  fill(255);
  text(hs, 10, 440);
  if (keyPressed) {
    if (key == 'e') {
      act = 1;
    }
    if (key == 'n') {
      act = 2;
    }
    if (key == 'h') {
      act = 3;
    }
    if (key == 'v') {
      if (hc >= 3) {
        act = 4;
      }
    }
    if (key == 'l') {
      act = 5;
    }
  } 
}
    
    void veryhard() {
  background(0);
  if (keyPressed) {
    if (keyCode == RIGHT) {
      tx += 3;
    }
    if (keyCode == LEFT) {
      tx -= 3;
    }
    if (keyCode == UP) {
      ty -= 3;
    }
    if (keyCode == DOWN) {
      ty += 3;
    }
  }
  fill(255);
  for(i = 0;i < 20;i ++) {
    rect(x[i],y[i],20,20);
    y[i] += s[i];
    if (y[i] > 500) {
      x[i] = random(150);
      s[i] = random(4,6);
      y[i] = 0;
    }
    if (keyPressed) {
      if (key == ' ') {
        textSize(30);
        text(" RESINED ",7,240);
        act = 10;
      }
    }
    if (ty >= y[i] - 12.5 && ty <= y[i] + 12.5 && tx >= x[i] - 12.5 && tx <= x[i] + 12.5) {
      textSize(25);
      text("GAMEOVER",7,240);
      act = 10;
    }
  }
  fill(255);
  rect(tx,ty,3,3);
  if (tx <= 0) {
    tx = 3;
  }
  if (tx >= 150) {
    tx = 147;
  }
  if (ty <= 0) {
    ty = 3;
  }
  if (ty >= 500) {
    ty = 497;
  }
  i = 0;
  fill(255);
  textSize(30);
  text(nokori,10,40);
  nokori --;
  if (nokori < 0) {
    text("CLEAR!!",18,240);
    act = 14;
  }
}
int act = 0;
int i = 0;
float [ ] x = {random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150),random(150)};
float [ ] y = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float [ ] s = {random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3),random(1,3)};
float tx = 75;
float ty = 495;
int nokori = 1800;
int ec = 0;//EASY  クリア回数
int nc = 0;//NOMAL クリア回数
int hc = 0;//HARD  クリア回数
int vc = 0;//V.HARDクリア回数
int es = 0;
int hs = 0;//ENDLS.ハイスコア
float rs = 10;

void setup() {
  size(150,500);
  background(255);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  if (act == 0) {
    sai();
  }
  if (act == 1) {
    easy();
  }
  if (act == 2) {
    normal();
  }
  if (act == 3) {
    hard();
  }
  if (act == 4) {
    veryhard();
  }
  if (act == 5) {
    endless();
  }
  if (act == 10) {
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      act = 0;
      nokori = 1800;
    }
  }
  if (act == 11) {//EASY CLEAR
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      ec ++;
      act = 0;
      nokori = 1800;
    }
  }
  if (act == 12) {//NORMAL CLEAR
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      nc ++;
      act = 0;
      nokori = 1800;
    }
  }
  if (act == 13) {//HARD CLEAR
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      hc ++;
      act = 0;
      nokori = 1800;
    }
  }
  if (act == 14) {//V.HARD CLEAR
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      vc ++;
      act = 0;
      nokori = 1800;
    }
  }
  if (act == 100) {//E.D. HIGHSCORE
    if (keyPressed && key=='z') {
      for(i = 0;i < 20;i ++) {
        tx = 75;
        ty = 495;
        s[i] = random(1,3);
        x[i] = random(150);
        y[i] = 0;
      }
      if (es > hs) {
        hs = es-1;
      }
      act = 0;
      es = 0;
    }
  }
}
