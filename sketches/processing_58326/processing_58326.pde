
float t;
float tt;
float c;
int weight = 6;
ball[] balls = new ball[weight];
int mode = 1;
float rr;
float r;
float rrr;
void setup() {
  size(300, 300, P2D);
  for(int i = 0; i < weight; i++) {
    balls[i] = new ball();
  }
}
void draw() {
  float[][] pixi = new float[width][height];
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = sqrt(dist(i, j, mouseX, mouseY));
      tt = sqrt(dist(i, j, balls[0].X, balls[0].Y));
      for(int n = 1; n < weight; n++) {
        tt = tt * sqrt(dist(i, j, balls[n].X, balls[n].Y) * 0.1);
      }
      c = t*tt;
      pixi[i][j] = 255-(c / 100);
      if(mode==2) {
      for(int l = 0; l < 255; l+=50) {
        if(pixi[i][j] > l && pixi[i][j] < l+10) {
          pixi[i][j] = 755;
        }
      }
      if(pixi[i][j] != 755) {
        pixi[i][j] = -500;
      }
      }
      if(mode==3) {
      for(int l = 0; l < 255; l+=50) {
        if(pixi[i][j] > l && pixi[i][j] < l+10) {
          pixi[i][j] = -255;
        }
      }
      }
    }
  }
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = pixi[i][j];
      stroke(t, r + t, rr + t * rrr);
      point(i, j);
    }
  }
  for(int i = 0; i < weight; i++) {
    balls[i].render();
  }
  if(keyPressed) {
    if(key=='c') {
      r = random(-20, 20);
      rr = random(-40, 80);
      rrr = random(0.5, 1.5);
    }else if(key=='1') {
      mode = 1;
    }else if(key=='2') {
      mode = 2;
    }else if(key=='3') {
      mode = 3;
    }
  }
}
class ball {
  float X;
  float Y;
  float Xv;
  float Yv;
  float w;
  ball() {
    X = random(screen.width);
    Y = random(screen.height);
    w = random(1 / 2, 2);
  }
  void render() {
    if(!mousePressed) {
      Xv /= 1.1;
      Yv /= 1.1;
    }else{
    Xv += 0.01 * (mouseX - X) * w;
    Yv += 0.01 * (mouseY - Y) * w;
    }
    X += Xv;
    Y += Yv;
  }
}

