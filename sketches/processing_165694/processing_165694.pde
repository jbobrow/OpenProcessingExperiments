
float x, y;
float xx, yy;
float r = 40;
float rr = 26;
float rb = 16;
float xx2, yy2;
PFont font;
int point = 0;

void setup() {
  size(350, 350);
  font = createFont("SansSerif", 20);
  textFont(font);
  x = 100;
  y = 280;
  xx = random(20, width-20);
  yy = 10;
  xx2 = random(20, width-20);
  yy2 = -100;
}

void draw() {
  background(#000033);
  fill(#FFFF00);
  ellipse(60, 60, 50,50);
 
  
  if (mousePressed) {
    if (x > mouseX && x >= 10)x--;
    else if (x < mouseX && x <= width-10)x++;
  }

  if (point > 100) {
    tamatama();
  }
  tama();
  yuki();
  noStroke();
  fill(#777700);
  rect(0, 300, 350, 50);
  syoutotu();

  fill(255);
  textAlign(RIGHT);
  text("POINT  " + point, 280, 15);
}

void syoutotu() {
  if (dist(x, y, xx, yy) < (r+rb)/2 || dist(x, y-30, xx, yy) < (rr+rb)/2) {
    xx = random(10, width-10);
    yy = 10;
    point += 10;
    r++;
    rr++;
  } else if(dist(x, y, xx2, yy2) < (r+rb)/2 || dist(x, y-30, xx2, yy2) < (rr+rb)/2){
    point += 10;
    xx2 = random(10, width-10);
    yy2 = 10;
    r++;
    rr++;
  } else if (yy > 300) {
    xx = random(10, width-10);
    yy = 10;
    r -= 2;
    rr -= 2;
  }else if (yy2 > 300) {
    xx2 = random(10, width-10);
    yy2 = 10;
    r -= 2;
    rr -= 2;
  }
}

void yuki() {
  noStroke();
  fill(#EEEEEE);
  ellipse(x, y, r, r);
  ellipse(x, y-30, rr, rr);
  stroke(#996600);
  strokeWeight(2);
  line(x-10, y-10, x-25, y-25);
  line(x-20, y-20, x-20, y-30);
  line(x-20, y-20, x-27, y-20);
  stroke(0);
  strokeWeight(3);
  line(x+5, y-35, x+5, y-30);
  line(x, y-35, x, y-30);
}

void tama() {
  fill(200);
  yy++;
  ellipse(xx, yy, rb, rb);
}
void tamatama() {
  fill(200);
  yy2++;
  ellipse(xx2, yy2, rb, rb);
}

