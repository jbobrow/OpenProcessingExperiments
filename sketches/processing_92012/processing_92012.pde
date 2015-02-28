
//Project: Opposite Waves
//Assignment: something that shows or plays with osciallation
//class: AVSYS Spring 2013

int xspacing = 1; 
int w;

float speed1 = 0.0; 
float speed2 = 0.0;
float amplitude = 300.0;
float period = 400.0;  
float dx;  
float[] yvalues;
float[] ayvalues;

void setup() {
  size(800, 600);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  ayvalues = new float[w/xspacing];
}

void draw() {
  background(255);
  calcWave();
  renderWave();

  if (mouseY < width/3) {
    speed1 += 0.07;
    speed2 -= 0.07;
  }
  else if (mouseY > width/3 && mouseY < width*2/3) {
    speed1 += 0.005;
    speed2 -= 0.005;
  }
  else if (mouseY > width*2/3) {
    speed1 += 0.07;
    speed2 -= 0.07;
  }
}

void calcWave() {
  speed1 += 0.03;
  speed2 -= 0.03;

  float x = speed1;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }

  float a = speed2;
  for (int i = 0; i < ayvalues.length; i++) {
    ayvalues[i] = sin(a)*amplitude;
    a+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(0);

  for (int x = 0; x < yvalues.length; x++) {
    for (int i=0; i<5; i++) {
      ellipse(x*xspacing*i, height/2+yvalues[x], 2, 2);
    }
  }

  for (int x = 0; x < ayvalues.length; x++) {
    for (int i=0; i<5; i++) {
      ellipse(x*xspacing*i, height/2+ayvalues[x], 2, 2);
    }
  }
}


