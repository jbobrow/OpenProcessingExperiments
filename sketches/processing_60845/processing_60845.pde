
snake[] snakes = new snake[0];
void setup() {
  background(255);
  size(500, 500);
  stroke(0, 0, 0, 10);
  smooth();
}
void draw() {
  for(int i = 0; i < snakes.length; i++) {
    if(!snakes[i].done())
    snakes[i].go();
  }
  if(mousePressed) {
    snakes = (snake[]) append(snakes, new snake(mouseX, mouseY, 15, random(100), 1));
  }
}
void mousePressed() {
  fill(255, 255, 255, 150);
  rect(0, 0, width, height);
  for(int i = 0; i < snakes.length; i++) {
    snakes[i].tm = 1;
  }
}
class snake {
  float X;
  float Y;
  float rot;
  float V;
  float tm;
  int fm;
  snake(int tX, int tY, float tfm, float trot, float tV) {
    X = tX;
    Y = tY;
    rot = trot;
    tm = tfm;
    V = tV;
  }
  void go() {
    V += random(-0.03, 0.03);
    tm /= 1.01;
    strokeWeight(tm);
    rot += random(-0.2, 0.2);
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    X += V*sin(rot);
    Y += V*cos(rot);
    fm++;
    if(random(400) > 398.5-(fm/20)) {
      snakes = (snake[]) append(snakes, new snake(int(X), int(Y), tm, rot + random(-0.2, 0.2), V));
    }
  }
  boolean done() {
    if(tm < 1.01) {
      return true;
    }else{
      return false;
    }
  }
}

