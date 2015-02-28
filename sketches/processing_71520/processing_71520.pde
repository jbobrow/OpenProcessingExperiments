
float dx;
float dy;
float x = 1;
float y = 0.5;
float a = 0;
float b = 0;
float c = 2.4275403;
float d = -2.177196;
int steps = 50000;
float zoid;
boolean bright;
float[][] pix = new float[400][400];
float[][] zeta = new float[400][400];
float t = 1;
int mx;
int my;
   
void setup() {
  size(400, 400, P2D);
  background(0);
}
   
void draw() {
  if(mx != mouseX||my != mouseY) {
    bright = true;
  }else{
    bright = false;
  }
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  x = random(-2, 2);
  y = random(-2, 2);
  for(int i = 0; i < steps; i++) {
    dx = sin(a*y)-cos(b*x);
    dy = sin(c*x)-cos(d*y);
    zoid = (dist(dx, dy, x, y)*100)%255;
    stroke(zoid, 255-zoid, 255, 10);
    x = dx;
    y = dy;
    if(int(x*70+width/2)>0&&int(x*70+width/2)<width&&int(y*70+height/2)>0&&int(y*70+height/2)<height) {
    pix[int(x*70+width/2)][int(y*70+height/2)]+=10;
    zeta[int(x*70+width/2)][int(y*70+height/2)]+=zoid/10;
    }
  }
  for(int n = 0; n < width; n++) {
    for(int m = 0; m < height; m++) {
      colorMode(RGB);
      stroke(255, pix[n][m]/sqrt(t*5), zeta[n][m]/sqrt(t*5), pix[n][m]/sqrt(t*20));
      if(bright)
        stroke(255, 255, 255, pix[n][m]);
      point(n, m);
    }
  }
  t++;
  mx = mouseX;
  my = mouseY;
}
   
void mouseMoved() {
  a = float(mouseX-width/2)/50;
  b = float(mouseY-height/2)/50;
  x = random(-10, 10);
  y = random(-10, 10);
  for(int n = 0; n < width; n++) {
    for(int m = 0; m < height; m++) {
      pix[n][m]=0;
      zeta[n][m]=0;
    }
  }
  t = 1;
}
  
void keyPressed() {
  saveFrame("Output.png");
}

