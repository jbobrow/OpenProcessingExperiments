
void setup() {
  size(500, 500, P3D);
  background(255);
}

int rectalpha = 20;
int fr = 20;
float a = 0.02;

void rgba() {
  fill(random(255), rectalpha);
}

void rPos() {
  rect(random(-250, 250), random(-250, 250), random(10, 200), random(10, 200));
}

void drawings() {
  //stroke(255);
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
  rgba();
  rPos();
}

void draw() {
  translate(250, 250);
  fill(255, 20);
  rotateY(a*PI);
  noStroke();
  rect(-250, -250, 500, 500);
  if (mousePressed == true) {
  fr = 60;
  } else {
  fr = 20;
  }
  rotateY(a*PI);
  frameRate(fr);
  drawings();
  a += 0.02;
  //noStroke();
}




