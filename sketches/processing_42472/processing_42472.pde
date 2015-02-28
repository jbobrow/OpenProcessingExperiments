

int pSize = 150;
P[] planet = new P[pSize];

void setup() {
  smooth();
  noStroke();
  size(500, 500);

  for (int i=0;i<pSize;i++) {
    planet[i] = new P(random(width), random(height), random(1), random(361),(int)random(100)+155);
  }
}



void draw() {
//  background(50);
 fill(0,10);
 rect(0,0,width,height);
 
  for (int i=0;i<pSize;i++) {
    planet[i].update();
  }
}

class P {
  float x=0;
  float y=0;
  float d=0;
  float a=0;
  int c=0;
  
  public P(float x, float y, float d, float a,int c) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.a = a;
    this.c = c;
  }

  public void update() {
    noStroke();
    fill(c);
    ellipse(x, y, d, d);

    x+= cos(radians(a))*1;
    y+= sin(radians(a))*1;
    a+=random(2);
  }
}


