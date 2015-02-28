
rain[] rainDrops;
ripple[] ripples;
int rippleCount;
int rainCount;
int timer;
int timer2;

void setup () {
  size(900, 900);
  smooth();
  ripples = new ripple[200];
  rainDrops = new rain[40];
  rippleCount = 0;
  rainCount = 0;
  timer = 0;
  timer2 = 0;
  strokeWeight(2);
}


void draw () {
  background(15);

  if (mousePressed&&timer2>6) {
    ripples[rippleCount++] = new ripple(mouseX, mouseY, 110);
    timer2 = 0;
  }
  timer2++;
  
  rain();
}


void mousePressed () {
}

void rain() {
  if (rainCount<40&&timer>6) {
    int tempY = (int)random(0, height);
    rainDrops[rainCount++] = new rain ((int)random(0, width), tempY-30, tempY);
    timer=0;
  }
  timer++;
  for (int i = 0; i < rainCount; i++) {
    if (rainDrops[i].drawRain()) {
      ripples[rippleCount++] = rainDrops[i].makePuddle();
      for (int ii = i; ii < rainCount; ii++) {
        rainDrops[ii] = rainDrops[ii+1];
      }
      rainCount--;
      i--;
    }
  }

  for (int i = 0; i < rippleCount; i++) {
    if (ripples[i].drawRipple()<1) {     
      for (int ii = i; ii < rippleCount; ii++) {
        ripples[ii] = ripples[ii+1];
      }
      rippleCount--;
    }
  }
}


