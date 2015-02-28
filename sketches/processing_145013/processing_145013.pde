
ArrayList<Walker> walkers = new ArrayList<Walker>();
int time=0;
float speed = 0.3; 
int amoutOfWalkers=5;

void setup() {
  size(500, 500);
  background(0);
  for (int i=0;i<amoutOfWalkers;i++) walkers.add(new Walker(i));
}

void draw() {
  
  for (int i=0;i<10*speed;i++) {
    for (Walker w:walkers) w.update(time);
    for (Walker w:walkers) w.render();
    time++;
  }
  
}

class Walker {
  PVector currentPos = new PVector(random(width), random(height));
  int initSeed;
  color myColor;

  Walker(int initSeed) {
    this.initSeed = initSeed;
    myColor = color((int)random(0, 150), 255, (int)random(0, 150)); //<>//
  }

  void update(int time) {
    //PVector dir = PVector.fromAngle(noise(time*0.001+initSeed)*TWO_PI*10);
    float a=noise(time*0.001+initSeed)*TWO_PI*10;
    currentPos.add(round(cos(a)), round(sin(a)));

    int x = (int)currentPos.x;
    int y = (int)currentPos.y;
    if (get(x, y)!=color(0)|| x<0 || y <0 || x>width || y> height) {
      currentPos = new PVector(random(width), random(height));
      update(time);
    }
  }

  void render() {
    stroke(myColor);
    set((int)currentPos.x, (int)currentPos.y, myColor);
  }
}



