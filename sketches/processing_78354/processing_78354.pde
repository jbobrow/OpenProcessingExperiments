
// Jeffrey Chen CP1 Tron November 2,2012
void setup() {
  size(350, 350);
  background(0);
  key = 'w';
}
int px=125;
int py=250;
int cx=175;
int cy=250;
boolean gameOver=false;
boolean win=false;
int count=0;
void draw() {
  count++;
  if ( count==1) {
    grid();
  }
  if (win==true){
    fill(255);
    textAlign(175, 175);
    text("You Win :D", 175, 175);
  }
  if (gameOver==true) {
    fill(255, 0, 0);
    textAlign(175, 175);
    text("GAME OVER", 250, 250);
  }
  else if (gameOver==false && win==false) {
    player();
    computer();
  }
  if (get(px, py) != color(0) && get(px, py) != color(0, 0, 255)) {
    gameOver=true;
  }
  if (get(cx, cy) != color(0) && get(cx, cy) != color(0, 0, 255)) {
    win=true;
  }
}
void grid() {
  for (int ry=0; ry< height; ry+=20) {
    stroke(0, 0, 255);
    rect(0, ry, width, 1);
  }
  for (int rx=0; rx< width; rx+=20) {
    rect(rx, 0, 1, height);
  }
  noFill();
  strokeWeight(10);
  stroke(255);
  rect(0, 0, width, height);
}

void player() {
  fill(200, 250, 0);
  noStroke();
  rect(px, py, 1, 1);
  if (keyPressed=true && key=='w') {
    py-=1;
  }
  else if (keyPressed=true && key=='s') {
    py+=1;
  }
  else if (keyPressed=true && key=='a') {
    px-=1;
  }
  else if (keyPressed=true && key=='d') {
    px+=1;
  }
}
int cd=int(random(37,41));
void computer() {
  fill(255, 0, 0);
  rect(cx, cy, 1, 1);
  if (cd==UP) {
    cy-=1;
    if (get(cx, cy-2) != color(0) && get(cx, cy-2) != color(0, 0, 255)) {
      int num=int(random(2));
      if (num==0) {
        cd=RIGHT;
      }
      else {
        cd=LEFT;
      }
    }
  }
  else if (cd==DOWN) {
    cy+=1;
    if (get(cx, cy+2) != color(0) && get(cx, cy+2) != color(0, 0, 255)) {
      int num=int(random(2));
      if (num==0) {
        cd=RIGHT;
      }
      else {
        cd=LEFT;
      }
    }
  }


  else if (cd==LEFT) {
    cx-=1;

     if (get(cx-2, cy) != color(0) && get(cx-2, cy) != color(0, 0, 255)) {
      int num=int(random(2));
      if (num==1) {
        cd=UP;
      }
      else {
        cd=DOWN;
      }
    }
  }

  else if (cd==RIGHT) {
    cx+=1;

     if (get(cx+2, cy) != color(0) && get(cx+2, cy) != color(0, 0, 255)) {
      int num=int(random(2));
      if (num==0) {
        cd=UP;
      }
      else {
        cd=DOWN;
      }
    }
  }
}


