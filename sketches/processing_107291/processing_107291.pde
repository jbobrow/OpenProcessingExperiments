
float cs = 3;
color b = color(44,117,255,30);
float t;
Par[][] p = new Par[128][128];
void setup() {
  size(512, 512, P2D);
  background(0);
  fill(0,0,0,20);
  stroke(0);
  for(int i = 0; i < p.length*p.length; i++) {
    p[i/p.length][i%p.length] = new Par(i/p.length*4, i%p.length*4);
  }
}
void draw() {
  stroke(0);
  rect(0,0,width,height);
  stroke(b);
  for(Par[] d:p)for(Par q:d)
    q.update();
  t += 0.01;
}
class Par {
  float x;
  float y;
  float xv;
  float yv;
  float w;
  float ww;
  float gu;
  float hu;
  Par(int x2, int y2) {
    x = random(width);
    y = random(height);
    w = random(0.3, 1.5);
    ww = random(-1,1);
    gu = x2;
    hu = y2;
  }
  void update() {
    stroke(44*(w+1), 117*(ww+1), 255, 30);
    float m = 128;
    float d = dist(x/m,y/m,mouseX/m,mouseY/m);
    xv += 0.001*(mouseX-x)*pow(d, ww)*w;
    yv += 0.001*(mouseY-y)*pow(d, ww)*w;
    float drg = (noise(x/20+492,y/20+490,t*2.2)-0.5)/300 + 1.05;
    xv /= drg;
    yv /= drg;
    xv += noise(x/20,y/20,t)-0.5;
    yv += noise(x/20,y/20+424,t)-0.5;
    x += xv;
    y += yv;
    line(x,y,x-xv/3,y-yv/3);
  }
}


