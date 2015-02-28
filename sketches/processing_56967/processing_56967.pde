
float x = 10;
float y = 10;

float w = 10;
float h = 10;

float speedmod = 0;
float speed = 0;
float res = 0.03;
float g = 0.1;
float gc = .981;

int change = 1;
int gchange = 1;

int click;

int end = 1;

int re = 255;
int gree = 255;
int blu = 255;

PFont font;

void setup() {
  size (1000, 400);
  smooth();
  //  frameRate(10);
  click = 1;
  background(255);
  end = 1;
}
void draw() {
  if (click == 1) {

    x = x+speed+speedmod;
    speed = speed-res;
    fill(re, gree, blu, 90);
    rect(-3, -3, width+3, height+3);
    line(0, height-30, width, height-30);
    ellipse(x, y, w, h);

    if (end == 1) {
      g = g + gc;
      y = y+g;
      if (y >height-(0.5*h)-30) {
        g = -g;
       /* gc = gc+(gc/4);*/
        gchange = -gchange;
      }
      if ((g > 0) && (gchange<0)) {
        gchange = -gchange;
      }
    }
    if (x >width-(0.5*w)) {
      speed = -speed;
      res = -res;
      change = -change;
    }
    if (x<0.5*w) {
      speed = -speed;
      res = -res;
      change = -change;
    }

    if ((speed<=0) && (change>0)) {
      res = 0;
      speed = 0;
    }
    if ((g<=0) && (gchange>0)) {
      gc = 0;
      g = 0;
    }
    if ((g>=0) && (gchange<0)) {
      gc = 0;
      g = 0;
    }
    if ((speed>=0) && (change<0)) {
      res = 0;
      speed = 0;
    }
    if ((gchange == 1) && (y>=(height-(30+0.5*h)))) {
      end = 0;
    }
    else {
    }
    if (keyPressed) {
      if (key == ENTER) {
        h = h+1;
        w = w+1;
      }
      if (key == BACKSPACE) {
        h = h-1;
        w = w-1;
      }
      if (key == CODED){
        if (keyCode == RIGHT){
          if (change == 1){
          speed = speed-res+1;
          }else{
            speed = speed-res-1;
          }
        }
      if (key == CODED){
        if (keyCode == LEFT){
          if (change == -1){
          speed = speed-res+1;
          }else{
            speed = speed-res-1;
          }
          }
        }
        if (key == CODED){
        if (keyCode == DOWN){
          if (gchange == -1){
          gc = gc+0.01;
          }else{
            gc = gc+0.01;
          }
          }
        }
        if (key == CODED){
        if (keyCode == UP){
          if (gchange == -1){
          gc = gc-0.01;
          }else{
            gc = gc-0.01;
          }
        }
        }
      }
      if (key == CODED){
        if (keyCode == CONTROL){
          re = (int)random(100, 255);
          gree = (int)random(100, 255);
          blu = (int)random(100, 255);
        }
      }
      if (key == DELETE) {
        y = 10;
        x = 10;
        gchange = 1;
        change = 1;
        speed = 0;
        res = 0.03;
        g = 0.1;
        end = 1;
        gc = 0.981;
      }
    }

    print(gc);
  }
}


void mousePressed() {
  if (click == 1) {
    click = 0;
  }
  else {
    click = 1;
  }
}


