
int [ ] drm = new int [300];
int [ ] drx = new int [drm.length];
int combo = 0;
int point = 0;
int nowDo = 0;
int all = 0;
int hit = 0;
int bad = 0;
int god = 0;
int grt = 0;
int mxp = 0;
int act = 0;
String now = "";
boolean CanPress = true;
boolean fins = false;

void setup() {
  size(500,100);
  frameRate(100);
  background(255,188,188);
///////////////////////////////////////////////////////////////////////////////////////////
  for (int i=0;i<drm.length;i++) {
    int rad = int(random(7));
    if (rad < 3) {
      drm[i] = 0;
    } else if (rad < 5) {
      drm[i] = 1;
    } else { drm[i] = 2; }
    drx[i] = width+i*15;
  }
  drm[drm.length-1] = 0;
///////////////////////////////////////////////////////////////////////////////////////////
  for (int i=0;i<drm.length;i++) { if (drm[i] != 0) { all ++; } }
  mxp = all*100;
}

void menu() {
  background(255);
  fill(0);
  text("RYTHM GAME",120,30);
  text("PRESS S TO START",120,70);
  if (keyPressed && key == 's') { act = 1; }
}

void fin() {
  background(255,0,0);
  text(point+"P !",5,22);
  if (point > mxp*2/5) {
    text("CLEARED !",125,22);
  } else { text("NOT CLEARED !",85,22); }
  if (all == combo) text("FULL COMBO !",265,22);
  text("YOU HITTED "+hit+" TIME !",5,60);
  text("YOU HITTED "+int(hit*100/all)+" % !",235,60);
  text("GREAT : "+grt+"  GOOD : "+god+"  BAD : "+bad,5,98);
  if (mousePressed) {
    combo = 0; point = 0; nowDo = 0; all = 0;
    hit = 0; bad = 0; god = 0; grt = 0;
    mxp = 0; now = ""; CanPress = true;
    setup(); act = 0; fins = false;
  }
}

void game() {
  background(255,188,188);
  fill(188);
  rect(0,20,800,60);
///////////////////////////////////////////////////////////////////////////////////////////
  for (int i=0;i<drm.length;i++) {
    if (drm[i] == 1 && drx[i] <= 500 && drx[i] >= 0) {
      fill(255,0,0); ellipse(drx[i],50,20,20);
    } else if (drm[i] == 2 && drx[i] <= 500 && drx[i] >= 0) {
      fill(0,0,255); ellipse(drx[i],50,20,20);
    }
    drx[i] -= 1;
  }
///////////////////////////////////////////////////////////////////////////////////////////  
  if (keyPressed) {
    if (CanPress == true) {
      if (key == 'f' || key == 'j') {
        if (drx[nowDo] < 60 && drx[nowDo] > 40 && drm[nowDo] == 1 && fins == false)  {
          if (drx[nowDo] < 52.5 && drx[nowDo] > 47.5) {
            CanPress = false; now = "GREAT";
            point += 100; combo ++; hit ++; grt ++;
            drx[nowDo] = -10; nowDo++;
          } else {
            CanPress = false; now = "GOOD";
            point += 50; combo ++; hit ++; god ++;
            drx[nowDo] = -10; nowDo++;
          }
          if (combo == 50) { point *= 1.1; }
          if (combo == 100) { point *= 1.2; }
          if (combo == 150) { point *= 1.3; }
          if (combo == 200) { point *= 1.4; }
          if (combo == 250) { point *= 1.5; }
        } else if (drx[nowDo] > 60 && drx[nowDo] < 80) {
          CanPress = false; drx[nowDo] = -10;
          now = "BAD"; nowDo ++; combo = 0; bad ++; point -= 50;
        }
      }
    }
    if (CanPress == true) {
      if (key == 'd' || key == 'k') {
        if (drx[nowDo] < 60 && drx[nowDo] > 40 && drm[nowDo] == 2)  {
          if (drx[nowDo] < 52.5 && drx[nowDo] > 47.5) {
            CanPress = false; now = "GREAT";
            point += 100; combo ++; hit ++; grt ++;
            drx[nowDo] = -10; nowDo++;
          } else {
            CanPress = false; now = "GOOD";
            point += 50; combo ++; hit ++; god ++;
            drx[nowDo] = -10; nowDo++;
          }
          if (combo == 50) { point *= 1.1; }
          if (combo == 100) { point *= 1.2; }
          if (combo == 150) { point *= 1.3; }
          if (combo == 200) { point *= 1.4; }
          if (combo == 250) { point *= 1.5; }
        } else if (drx[nowDo] > 60 && drx[nowDo] < 80) {
          CanPress = false; drx[nowDo] = -10;
          now = "BAD"; nowDo ++; combo = 0; bad ++; point -= 50;
        }
      }
    }
    CanPress = false;
  } else { CanPress = true; }
///////////////////////////////////////////////////////////////////////////////////////////
  fill(150,150,150,100);
  ellipse(50,50,25,25);
  fill(255);
  ellipse(15,50,40,40);
  fill(0);
  textAlign(CENTER);
  text(combo,15,55);
  textAlign(CORNER);
  text(point,420,15);
  text(now,50,15);
///////////////////////////////////////////////////////////////////////////////////////////
  if (nowDo == drm.length) {  act = 2; fins = true;}
  if (fins == false && drx[nowDo] < 40) {
    now = "BAD"; nowDo ++; combo = 0; bad ++; point -= 50;
  }
///////////////////////////////////////////////////////////////////////////////////////////
  if (fins == false && drm[nowDo] == 0) {
    nowDo ++;
  }
  if (point < 0) { point = 0; }
}

void draw() {
  if (act == 0) {
  menu();
  } else if (act == 1) {
    game();
  } else if (act == 2) {
    fin();
  }
}
