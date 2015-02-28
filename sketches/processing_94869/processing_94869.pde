
int value = 0;
int y = 0;

void setup() {
  background(255);
  size(800, 500);
  noStroke();
}

void draw() {
  background(255);
  y = (y + 25) %10;
  Pokeball(0, 0-y);
  Pokeball2(0, 0);
  Pokeball3(0, 0);
  fill(255, 255, 0);
  textSize(200);
  text("Choose", 25, 180);
  textSize(200);
  text("One", 200, 470);
}
void mousePressed() {
  if (value == 0) {
    value = 255;
  } else {
    value = 255;
  }
}
void Pokeball(int x, int y) {
  fill(0);
  rect(40, 250, 10, 40);//left of ball
  rect(50, 230, 10, 20);//2nd left of ball
  fill(155, 31, 31);
  rect(50, 250, 10, 20);//left of ball
  fill(0);
  rect(50, 270, 10, 10);//left of ball
  rect(50, 290, 10, 20);//still left
  rect(60, 220, 20, 10);//left of ball
  fill(155, 31, 31);
  rect(60, 230, 20, 10);//left of ball
  rect(60, 240, 10, 10);//left
  rect(60, 250, 20, 10);//left
  rect(60, 260, 30, 10);//left
  rect(60, 270, 20, 10);//left
  fill(0);
  rect(60, 280, 20, 10);//left
  rect(60, 310, 20, 10);//left
  rect(80, 210, 40, 10);//finally middle
  fill(155, 31, 31);
  rect(80, 220, 40, 10);//middle 
  rect(90, 230, 30, 10);//middle
  rect(100, 240, 20, 10);//middle
  rect(90, 250, 30, 10);//middle
  fill(0);
  rect(90, 260, 20, 10);//middle
  rect(80, 270, 10, 20);//middle
  rect(90, 290, 20, 10);//middle
  rect(80, 320, 40, 10);//middle
  fill(155, 31, 31);
  rect(110, 260, 10, 10);//right end of middle
  fill(0);
  rect(110, 270, 10, 20);//right end of middle
  rect(120, 220, 20, 10);//right
  fill(155, 31, 31);
  rect(120, 230, 20, 50);//right
  fill(0);
  rect(120, 280, 20, 10);//right
  rect(120, 310, 20, 10);//right
  rect(140, 230, 10, 20);//2nd right
  fill(155, 31, 31);
  rect(140, 250, 10, 20);//2nd right
  fill(0);
  rect(140, 270, 10, 10);//2nd right
  rect(140, 290, 10, 20);//2nd right
  rect(150, 250, 10, 40);//FINALLY DONE
}
void Pokeball2(int x, int y) {
  fill(0);
  rect(40+300, 250, 10, 40);//left of ball
  rect(50+300, 230, 10, 20);//2nd left of ball
  fill(155, 31, 31);
  rect(50+300, 250, 10, 20);//left of ball
  fill(0);
  rect(50+300, 270, 10, 10);//left of ball
  rect(50+300, 290, 10, 20);//still left
  rect(60+300, 220, 20, 10);//left of ball
  fill(155, 31, 31);
  rect(60+300, 230, 20, 10);//left of ball
  rect(60+300, 240, 10, 10);//left
  rect(60+300, 250, 20, 10);//left
  rect(60+300, 260, 30, 10);//left
  rect(60+300, 270, 20, 10);//left
  fill(0);
  rect(60+300, 280, 20, 10);//left
  rect(60+300, 310, 20, 10);//left
  rect(80+300, 210, 40, 10);//finally middle
  fill(155, 31, 31);
  rect(80+300, 220, 40, 10);//middle 
  rect(90+300, 230, 30, 10);//middle
  rect(100+300, 240, 20, 10);//middle
  rect(90+300, 250, 30, 10);//middle
  fill(0);
  rect(90+300, 260, 20, 10);//middle
  rect(80+300, 270, 10, 20);//middle
  rect(90+300, 290, 20, 10);//middle
  rect(80+300, 320, 40, 10);//middle
  fill(155, 31, 31);
  rect(110+300, 260, 10, 10);//right end of middle
  fill(0);
  rect(110+300, 270, 10, 20);//right end of middle
  rect(120+300, 220, 20, 10);//right
  fill(155, 31, 31);
  rect(120+300, 230, 20, 50);//right
  fill(0);
  rect(120+300, 280, 20, 10);//right
  rect(120+300, 310, 20, 10);//right
  rect(140+300, 230, 10, 20);//2nd right
  fill(155, 31, 31);
  rect(140+300, 250, 10, 20);//2nd right
  fill(0);
  rect(140+300, 270, 10, 10);//2nd right
  rect(140+300, 290, 10, 20);//2nd right
  rect(150+300, 250, 10, 40);//FINALLY DONE
}
void Pokeball3(int x, int y) {
  fill(0);
  rect(40+600, 250, 10, 40);//left of ball
  rect(50+600, 230, 10, 20);//2nd left of ball
  fill(155, 31, 31);
  rect(50+600, 250, 10, 20);//left of ball
  fill(0);
  rect(50+600, 270, 10, 10);//left of ball
  rect(50+600, 290, 10, 20);//still left
  rect(60+600, 220, 20, 10);//left of ball
  fill(155, 31, 31);
  rect(60+600, 230, 20, 10);//left of ball
  rect(60+600, 240, 10, 10);//left
  rect(60+600, 250, 20, 10);//left
  rect(60+600, 260, 30, 10);//left
  rect(60+600, 270, 20, 10);//left
  fill(0);
  rect(60+600, 280, 20, 10);//left
  rect(60+600, 310, 20, 10);//left
  rect(80+600, 210, 40, 10);//finally middle
  fill(155, 31, 31);
  rect(80+600, 220, 40, 10);//middle 
  rect(90+600, 230, 30, 10);//middle
  rect(100+600, 240, 20, 10);//middle
  rect(90+600, 250, 30, 10);//middle
  fill(0);
  rect(90+600, 260, 20, 10);//middle
  rect(80+600, 270, 10, 20);//middle
  rect(90+600, 290, 20, 10);//middle
  rect(80+600, 320, 40, 10);//middle
  fill(155, 31, 31);
  rect(110+600, 260, 10, 10);//right end of middle
  fill(0);
  rect(110+600, 270, 10, 20);//right end of middle
  rect(120+600, 220, 20, 10);//right
  fill(155, 31, 31);
  rect(120+600, 230, 20, 50);//right
  fill(0);
  rect(120+600, 280, 20, 10);//right
  rect(120+600, 310, 20, 10);//right
  rect(140+600, 230, 10, 20);//2nd right
  fill(155, 31, 31);
  rect(140+600, 250, 10, 20);//2nd right
  fill(0);
  rect(140+600, 270, 10, 10);//2nd right
  rect(140+600, 290, 10, 20);//2nd right
  rect(150+600, 250, 10, 40);//FINALLY DONE
}


