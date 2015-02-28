
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/60845*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
spaghetti[] spaghettis = new spaghetti[0];
void setup() {
  background(0);
  size(500, 500);
  stroke(241, 230, 146, 10);
  smooth();
}
void draw() {
  for(int i = 0; i < spaghettis.length; i++) {
    if(!spaghettis[i].done())
    spaghettis[i].go();
  }
  if(mousePressed) {
    spaghettis = (spaghetti[]) append(spaghettis, new spaghetti(mouseX, mouseY, 8, random(100), 1));
  }
}
void mousePressed() {
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  for(int i = 0; i < spaghettis.length; i++) {
    spaghettis[i].tm = 1;
  }
}
class spaghetti {
  float X;
  float Y;
  float rot;
  float V;
  float tm;
  int fm;
  spaghetti(int tX, int tY, float tfm, float trot, float tV) {
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
      spaghettis = (spaghetti[]) append(spaghettis, new spaghetti(int(X), int(Y), tm, rot + random(-0.2, 0.2), V));
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

