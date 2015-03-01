
float[] rs, re, rd;
int N = 800;

void setup(){
  size(600, 600, P3D);
  smooth();
  stroke(0, 50);
  noFill();
  strokeWeight(1);
  rs = new float[N];
  re = new float[N];
  rd = new float[N];
  for (int i = 0; i < N; i++){
    rs[i] = random(TWO_PI);
    re[i] = random(-PI, PI);
    rd[i] = random(-radians(5), radians(5));
  }
}

void draw(){
  background(255);
  translate(width/2, height/2);
  for (int i = 0; i < N; i++){
    float r = i * width / N;
    rotateX(radians(1/400.0+sin(frameCount/400.0)));
    arc(0, 0, r, r, rs[i], rs[i]+re[i]);
    rs[i] += rd[i];
  }
}

