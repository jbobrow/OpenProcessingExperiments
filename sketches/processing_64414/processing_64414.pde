
snake[] snakes = new snake[0];
float a = random(20);
float b = random(20);
float c = random(20);
float d = random(-50, 150);
float e = random(-50, 150);
float f = random(-50, 150);
boolean snd;
void setup() {
  background(224, 188, 129);
  size(700, 500, JAVA2D);
  stroke(0, 0, 0);
  smooth();
}
void draw() {
  for(int i = 0; i < snakes.length; i++) {
    if(!snakes[i].done())
    snakes[i].go();
  }
  if(mousePressed) {
    snakes = (snake[]) append(snakes, new snake(mouseX, mouseY, random(10, 20), random(100), random(0.9, 1.1), 0));
  }
  //It has a little sweep that runs every frame to clean up the array.
  snd = true;
  for(int i = 0; i < snakes.length; i++) {
    if(!snakes[i].done())
    snd = false;
  }
  if(snd == true) {
    for(int i = 0; i < snakes.length; i++) {
      snakes = (snake[]) shorten(snakes);
    }
  }
}
void mousePressed() {
  noStroke();
  fill(224, 188, 129, 150);
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
  float rotv;
  snake(int tX, int tY, float tfm, float trot, float tV, float trotv) {
    X = tX;
    Y = tY;
    rot = trot;
    tm = tfm;
    V = tV;
    rotv = trotv;
  }
  void go() {
    V += random(-0.03, 0.03);
    tm /= 1.01;
    strokeWeight(tm);
    rotv += random(-0.02, 0.02);
    rot += rotv;
    //stroke(255-137+tm*16, 255-66-tm*25, 255-tm, 40);
    stroke(a*tm+d, b*tm+e, c*tm+f, 40);
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    line(X, Y, X + V*sin(rot), Y + V*cos(rot));
    X += V*sin(rot);
    Y += V*cos(rot);
    fm++;
    if(random(400) > 398.5-(fm/20)) {
      snakes = (snake[]) append(snakes, new snake(int(X), int(Y), tm, rot + random(-0.2, 0.2), V, rotv));
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
void keyPressed() {
  if(key=='p') {
    saveFrame("bkground.png");
  }else if(key=='c') {
    a = random(20);
    b = random(20);
    c = random(20);
    d = random(-50, 150);
    e = random(-50, 150);
    f = random(-50, 150);
  }
}


