
int w = 300;
int h = 300;
int l = 5;
par[] wungee = new par[l];
float[][] dote = new float[w][h];
float mowow = 20;
float a = 0.63;
float b = 0.2;
float c = 0.05;
float d = -36;
float e = -20;
float f = -19;
boolean powooga;
void setup() {
  size(300, 300, P2D);
  background(255);
  for(int i = 0; i < l; i++) {
    wungee[i] = new par();
  }
}
void draw() {
  havaba();
  if(powooga)
    filter(POSTERIZE, 5);
}
void havaba() {
  for(int i = 0; i < l; i++) {
    for(int x = 0; x < width; x++) {
      for(int y = 0; y < height; y++) {
        float r = dist(wungee[i].x/mowow, wungee[i].y/mowow, x/mowow, y/mowow);
        dote[x][y] += 100/(r*r);
      }
    }
    wungee[i].upguapo();
  }
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      dote[x][y] = (dote[x+1][y] + dote[x-1][y] + dote[x][y+1] + dote[x][y-1])/3.3;
    }
  }
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      stroke(dote[x][y]/2);
      stroke(a*dote[x][y]+d, b*dote[x][y]+e, c*dote[x][y]+f);
      point(x, y);
      dote[x][y] /= 1.8;
    }
  }
}
void keyPressed() {
  if(key=='p') {
    powooga = !powooga;
  } else {
    a = random(0.5);
    b = random(0.5);
    c = random(0.5);
    d = random(-50, 150);
    e = random(-50, 150);
    f = random(-50, 150);
    mowow = random(15, 25);
  }
}
class par {
  float x, y, xv, yv, q;
  par() {
    x = random(width);
    y = random(height);
    q = random(0.005, 0.01);
  }
  void upguapo() {
    xv += q*(mouseX-x);
    yv += q*(mouseY-y);
    x += xv;
    y += yv;
    if(mousePressed) {
      xv /= 1.1;
      yv /= 1.1;
    }
  }
}

