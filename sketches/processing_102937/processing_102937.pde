
/* Press 'p' to pause
   press 'r' to reset number sequence.
   press the up and down keys to change the delay
   press 'c' to reset and change the background color.
   (this reset however will not change the delay back 
   to the default).
*/ 
int ran;
int backg = 80;
float textx;
float texty;
float x;
int input = 100;
void setup() {
  size(600, 600);
  background(backg);
}
void draw() {
  delay(input);
  ran = int(random(4));
  textx = random(-20, 1350);
  texty = random(0, 700);
  x = 12;
  textSize(x);
  fill(255);
  if(ran == 0) {
  float textr = (random(-1000000, 1000000));
   text(textr, textx, texty);
  }
  else  {
     int textr = int(random(-1000000, 1000000));
      text(textr, textx, texty);
  }
     if(keyPressed) {
    if(key == 'p') {
       noLoop();
     }
     if(key == 'r') {
       truth();
     }
     if(key == 'c') {
       colorChange();
     }
     if(key == CODED) {
       if(keyCode == UP) {
         input += 10;
       }
       if(keyCode == DOWN) {
         input -= 10;
       }
     }
     }
}
void keyReleased() {
  if(key == 'p') {
  loop();
  }
}
void truth() {
  background(backg);
  int ran;
float textx;
float texty;
float x;
input = 100;
}
void colorChange() {
  redraw();
  backg = int(random(0, 200));
  int backg2 = int(random(0, 200));
  int backg3 = int(random(0, 200));
  background(backg, backg2, backg3);
}
