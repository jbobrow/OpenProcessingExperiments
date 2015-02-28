
int k = 10;
boolean kpressed = false;

void setup() {
    size (400,400);
    smooth();
    background(255);
    fill(0);
    noStroke();
}

void draw() {
    background(255);
    for (int b = 0; b <= k; b++) {
      for (int i = 0; i<= k; i = i+2) {
          if (b%2 == 0) {
            rect(i*(width/k), b*(height/k),width/k, height/k);
          }
          else {
          rect(width/k + i*(width/k), b*(height/k),width/k, height/k);
          }
      }
    }
    if (key == '+' && kpressed == false) {
    k = k+2;
    kpressed = true;
    }
    if (key == '-' && kpressed == false && k >2) {
    k = k-2;
    kpressed = true;
    }
}

void keyReleased() {
kpressed = false;}

