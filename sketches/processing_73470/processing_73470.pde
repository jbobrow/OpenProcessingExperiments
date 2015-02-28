
int sValue = 100;
O[] orbit = new O[sValue];
float g = 0.5;
float glow = 100;

void setup() {
  smooth();
  noStroke();
  size(600, 600);

  for (int i=0;i<sValue;i++) {
    orbit[i] = new O((float)random(width), (float)random(height), (float)random(5), (float)random(360), (float)random(0.7), (int)random(110)+165);
  }
}

void draw() {
  egg();

  fill(0, 10);
  rect(0, 0, width, height);

  for (int i=0;i<sValue;i++) {
    orbit[i].swimmers();
  }
}
void egg() {   


  if (glow>170) {
    g = -0.8;
  } 

  if (glow <100) {
    g =0.8;
  }

  glow +=g;

  fill(255, 255, 92, 255);
  ellipse(width/2, height/2, 80, 80);
  fill(255, 255, 153, 200);
  ellipse(width/2, height/2, 90, 90);
  fill(255, 255, 143, 100);
  ellipse(width/2, height/2, 100, 100);
  fill(255, 255, 204, 10);
  ellipse(width/2, height/2, glow, glow);
}
class O {
  float x=0;
  float y=0;
  float d=0;
  float a=0;
  float m=0;
  int c=0;

  public O(float x, float y, float d, float a, float m, int c) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.a = a;
    this.m = m;
    this.c = c;
  }

  public void swimmers() {
    noStroke();
    fill(c);

    float ychange = sin(radians(a));
    ellipse(x, y+height/9, d, d);
    x+=m;
    a+=0.5;
    y+= ychange;

    if (x>width) {
      m=m*-1;
    }

    if (x<0) {
      m=m*-1;
    }
  }
}


