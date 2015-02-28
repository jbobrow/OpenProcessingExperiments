
float t;
float tt;
float c;
int weight = 7;
ball[] balls = new ball[weight];
int mode = 1;
float fram;
int cm = 1;
boolean blr;
void setup() {
  noiseDetail(3,0.5);
  size(300, 300, P2D);
  for(int i = 0; i < weight; i++) {
    balls[i] = new ball();
  }
}
void draw() {
  float[][] pixi = new float[width][height];
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = 1000/pow(dist(i, j, mouseX, mouseY)/4, 2);
      tt = 1000/pow(dist(i, j, balls[0].X, balls[0].Y)/4, 2);
      for(int n = 1; n < weight; n++) {
        tt = tt + 1000/pow(dist(i, j, balls[n].X, balls[n].Y)/4, 2);
      }
      c = t+tt;
      pixi[i][j] = c;
      if(mode==2) {
      for(int l = 0; l < 255; l+=50) {
        if(pixi[i][j] > l && pixi[i][j] < l+25) {
          pixi[i][j] = 755;
        }
      }
      if(pixi[i][j] != 755) {
        pixi[i][j] = noise(float(i)/50, float(j)/50, fram/40)*255;
      }
      }
      if(mode==3) {
      for(int l = 0; l < 255; l+=50) {
        if(pixi[i][j] > l && pixi[i][j] < l+25) {
          pixi[i][j] = 255;
        }
      }
      }
      if(mode==4) {
        if(pixi[i][j] < 100) {
          pixi[i][j] = 0;
        }else{
          pixi[i][j] = noise(float(i)/50, float(j)/50, fram/40)*255;
        }
      }
      if(mode==5) {
        if(pixi[i][j] > 100) {
          pixi[i][j] = 255/2;
        }else{
          pixi[i][j] = 255;
        }
      }
    }
  }
  if(blr == true) {
  pixi[mouseX][mouseY] = 0;
  float[][] temppix = pixi;
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      temppix[x][y] = (pixi[x+1][y] + pixi[x][y+1] + pixi[x-1][y] + pixi[x][y-1] + pixi[x+1][y+1] + pixi[x+1][y-1] + pixi[x-1][y+1] + pixi[x-1][y-1]) / 9;
    }
  }
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      pixi[x][y] = temppix[x][y];
    }
  }
  }
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      t = pixi[i][j];
      if(cm == 1) {
      colorMode(RGB);
      stroke(t, t, t);
      }
      if(cm == 2) {
      colorMode(HSB);
      stroke(t, 255, 255);
      }
      point(i, j);
    }
  }
  for(int i = 0; i < weight; i++) {
    balls[i].render();
  }
  fram++;
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
void keyPressed() {
   if(key=='p') {
     saveFrame("output.png");
   }else if(key=='1') {
     mode = 1;
   }else if(key=='2') {
     mode = 2;
   }else if(key=='3') {
     mode = 3;
   }else if(key=='4') {
     mode = 4;
   }else if(key=='5') {
     mode = 5;
   }else if(key=='c') {
     cm++;
     if(cm > 2) {
       cm = 1;
     }
   }
   else if(key=='b') {
     blr = !blr;
   }
 }

