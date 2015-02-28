
ArrayList waves;
int waveWidth = 0;
void setup() {
  size(600, 200);
  smooth();
  noStroke();
  waves = new ArrayList();
}
void draw() {
  background(255);
  for (int i = waves.size()-1; i >= 0; i--) {
    Wave wave = (Wave) waves.get(i);
    wave.w++;
    wave.display();
    if (wave.finished()) {
      waves.remove(i);
    }
  }
}
void mousePressed() {
  waves.add(new Wave(mouseX, mouseY, waveWidth));
}
class Wave {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 127;
  Wave(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
  }
  void move() {
    speed = speed + gravity;
    y = y + speed;
    if (y > height) {
      speed = speed * -0.8;
      y = height;
    }
  }
  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } 
    else {
      return false;
    }
  }
  void display() {
    int i;
    noFill();
    strokeWeight(1);
    for(i = 0;i<w;i+=2) {
      stroke(127,196,255,2*(i/w)*life);
      ellipse(x,y+3*((w-i)/w)*sin(radians(i*10)),3*(w-i),(w-i));
    }
  }
}               
