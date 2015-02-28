
int act = 0; int st = 0;
PImage [ ] BG = new PImage[8]; int wat = 0;
float charx = 10; float chary = 430; float sp = 0;
float jump = 0; float grvt = 19.9; boolean jumping = false;
int jt = 0; boolean CanPress = true; int lf = 10;
String tim = "0"; int tm = 0; boolean strt = false;
PImage chr; PImage ht; String rnkng = "NULL";

int [ ] GRDX = {0  ,120,0  ,150,280,515,670,620,420,100};
int [ ] GRDY = {480,380,280,280,220,-40,30 ,480,420,460};
int [ ] GRDW = {220,130,100,120,120,160,120,120,140,140};
int [ ] GRMX = {0  ,0  ,0  ,0  ,150,0  ,200,250,0  ,180};
int [ ] GRMY = {0  ,0  ,0  ,0  ,0  ,200,0  ,0  ,100,0  };
int [ ] GRSX = {0  ,0  ,0  ,0  ,5  ,0  ,7  ,2  ,0  ,5  };
int [ ] GRSY = {0  ,0  ,0  ,0  ,0  ,3  ,0  ,0  ,2  ,0  };

boolean [ ] gr = new boolean [GRDX.length]; color [ ] grc = new int[gr.length+1];

int [ ] grdx = new int [gr.length]; int [ ] grdy = new int [gr.length];
int [ ] grdw = new int [gr.length];
int [ ] grmx = new int [gr.length]; int [ ] grmy = new int [gr.length];
int [ ] grsx = new int [gr.length]; int [ ] grsy = new int [gr.length];

boolean [ ] ongr = new boolean [gr.length];

void setup() {
  size(1000,500);
  noStroke(); cursor(LINE);
  /*
  ht = loadImage("HATA.png");
  BG[0] = loadImage("BG1.png");
  BG[1] = loadImage("BG2.png");
  BG[2] = loadImage("BG3.png");
  BG[3] = loadImage("BG4.png");
  BG[4] = loadImage("BG5.png");
  BG[5] = loadImage("BG6.png");
  BG[6] = loadImage("RANKING.png");
  BG[7] = loadImage("BG7.png");
  */
}

void GameOne() {
  if (strt) {
    tim = ""+(millis() - tm)/1000+"";
    tim = ""+tim+"."+(millis() - tm)00+"";
  } else { tm = millis(); }
  //初期設定
  boolean jutu = false;
  //Exit
  if (keyPressed && key == 'q') { act = 4; delay(1000); }
  //背景表示
  background(255);//image(BG[1],0,0,1000,500);
  //足場、キャラ表示
  if (chary>height+20) {rejust(); lf -= 1;}
  for (int i=0;i<gr.length;i++) {
    fill(grc[i]);
    if (gr[i]) rect(grdx[i],grdy[i],grdw[i],20);
  }
  if (gr[9]) rect(grdx[9]+55,grdy[9]-50,20,50);//image(ht,grdx[9]+55,grdy[9]-50);
  fill(grc[gr.length]);
  rect(charx,chary,10,10);
  //クリア
  if (charx>grdx[9]+45 && charx<grdx[9]+75 && chary>grdy[9]-50 && chary<grdy[9]+10 && ongr[9]) {
    delay(500); act = 0;//act = 7; saveData();
  }
  //キャラ移動
  chary += grvt;
  chary -= jump;
  charx += sp;
  //足場移動
  for (int i=0;i<gr.length;i++) {
    if (grdx[i] < GRDX[i] || grdx[i] > GRDX[i] + grmx[i]) grsx[i] *= -1;
    grdx[i] += grsx[i];
    if (grdy[i] < GRDY[i] || grdy[i] > GRDY[i] + grmy[i]) grsy[i] *= -1;
    grdy[i] += grsy[i];
    if (ongr[i]) { charx += grsx[i]; chary += grsy[i]; }
  }
  //上に乗っているかの判定
  for (int i=0;i<gr.length;i++) {
    ongr[i] = false;
    if (gr[i] && charx >= grdx[i] - 10 && charx <= grdw[i] + grdx[i] && chary > grdy[i] - 10 && chary < grdy[i] + 10) {
      try { if (gr[i-1]) gr[i] = false; } catch(Exception h) {};
      chary = grdy[i] - 10; jumping = false; jutu = true;
      ongr[i] = true;
    } else if (!jutu) { jumping = true; }
  }
  //下にぶつかったかの判定
  for (int i=0;i<gr.length;i++) {
    if (jumping && gr[i] && charx>= grdx[i] - 10 && charx <= grdw[i] + grdx[i] && chary > grdy[i] && chary < grdy[i] + 20) {
      chary = grdy[i] + 20; jump *= 0.8;
    }
  }
  //ジャンプ関連
  if (!jumping) { if (mousePressed && mouseButton == LEFT) {
    if (CanPress) {
      jump = 40;jt++;CanPress = false;
      try { gr[jt] = true; } catch (Exception b) { }
      try { gr[jt+1] = true; } catch (Exception c) { }
      try { gr[jt-1] = false; } catch (Exception e) {}
    }
  } else { CanPress = true; } }
  jump *= 0.95;
  if (jump < 0) { jump = 0; }
  //スピード変更関連
  if (keyPressed && keyCode == RIGHT) { sp+=0.48; strt = true;
  } else if (keyPressed && keyCode == LEFT)  { sp-=0.48; strt = true;
  } else { sp*=0.8; }
  if (sp>5) sp=5; else if (sp<-5) sp=-5;
  //キャラ位置
  if (charx<0) { charx=0; sp=0; }
  if (charx>width-10) { charx=width-10; sp=0; }
  
  fill(0);
  textSize(50);
  text(tim,10,50);
  text("LIFE : "+lf,10,100);
}


void GameTop() {
  background(255);//image(BG[0],0,0,1000,500);
  fill(0);
  textSize(90);
  text("  PLAY GAME",180,70,640,116);
  fill(255,255,255,0);
  if (st == 0) {
    fill(139,184,255,80);
    if ((keyPressed && key == 's') || (mousePressed && mouseButton == CENTER)) {
      act = 1; lf = 7; rejust();
    }
  }
  rect(180,70,640,116);
  /*
  fill(255,255,255,0);
  if (st == 1) {
    fill(139,184,255,80);
    if ((keyPressed && key == 's') || (mousePressed && mouseButton == CENTER)) {
      act = 2; rejust();
    }
  }
  rect(180,186,640,116);
  fill(255,255,255,0);
  if (st == 2) {
    fill(139,184,255,80);
    if ((keyPressed && key == 's') || (mousePressed && mouseButton == CENTER)) {
      act = 6; rejust();
    }
  }
  rect(180,302,640,116);
  */
}

void draw() {
  if (act == 0) GameTop();
  if (act == 1) GameOne();
}
