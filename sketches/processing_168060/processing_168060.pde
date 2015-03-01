
PFont font;
float angle;
float a = 0;
float point;
float round;
float life = 100;
Boolean clockStop = false;
Boolean onoff = true;
int step = 0;
int lev  = 1;
String ans;

void setup() {
  size(200, 200);
  font = createFont("SansSerif", 40);
  textFont(font);
}

void draw() {
  background (200 );
  angle = map(a, 0, 1, 0, TWO_PI);
  
  strokeWeight(4 );
  fill(#00FFFF);
  ellipse(100, 100, 190, 190);
  fill(#FF0000);
  arc(100, 100, 190, 190, 4.54, PI+HALF_PI);
  fill(#FFFF00);
  arc(100, 100, 190, 190, 4.18, 4.54);
  fill(#0000FF);
  arc(100, 100, 190, 190, 3.66, 4.18);
  strokeWeight(2 );
  line(100, 5, 100, 15);
  line(100, 195, 100, 185);
  line(5, 100, 15, 100);
  line(195, 100, 185, 100);

  pushMatrix();
  translate(100, 100);
  fill(50);
  rotate(angle );
  triangle(0, -90, 8, 10, -8, 10);
  popMatrix();
  fill(100);
  ellipse(100, 100, 10, 10);

  if (clockStop) {
    switch(lev) {
    case 1:
      a += 0.01;
      break;
    case 2:
      a += 0.02;
      break;
    case 3:
      a += 0.04;
      break;
    }
  }

  if (step == 0) {
    fill(#FF9900);
    switch(lev) {
    case 1:
      text("LV 1 GO", 20, 140);
      break;
    case 2:
      text("LV 2 GO", 20, 140);
      break;
    case 3:
      text("LV 3 GO", 20, 140);
      break;
    }
    life--;
    if (life == 0) {
      step++;
    }
  }
  if (step == 2) {
    round = angle/TWO_PI;
    point = angle%TWO_PI;
    if (4.54+HALF_PI < point && point <= TWO_PI || point < 0.01) {
      ans = "Good";
    } else if (4.18+HALF_PI < point && point <= 4.54+HALF_PI) {
      ans = "G??d";
    } else if (3.66+HALF_PI < point && point <= 4.18+HALF_PI) {
      ans = "!?%|";
    }else{
      ans = "....";
      }
    text(ans + " : " + int(round), 20, 140);
  }
 // println(angle + " : " + step + " : " + round + " : " + point + " : " + lev);
}

void mousePressed() {
  if (onoff) {
    if (step == 1) {
      if (!clockStop) {
        clockStop = true;
      } else {
        clockStop = false;
        step++;
      }
    } else if (step == 2) {
      a= 0;
      lev++;
      step = 0;
      life = 60;
      if(lev == 4){
        lev = 1;
      }
    }
    onoff = false;
  }
}

void mouseReleased() {
  onoff = true;
}

