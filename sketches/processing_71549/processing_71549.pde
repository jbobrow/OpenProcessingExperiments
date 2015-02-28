
int w = 800;
int h = 600;
float dx;
float dy;
float x = 1;
float y = 0.5;
float a = 1.4;
float b = 1.56;
float c = 1.4;
float d = -6.56;
int steps = 500000;
float zoid;
float[][] pix = new float[w][h];
float[][] zeta = new float[w][h];
float t = 1;
int mx;
int my;
float il = 140;
float ilh = 140;
boolean Thwater;
boolean Abaab;
  
void setup() {
  size(800, 600, P2D);
  background(0);
}
  
void draw() {
  if(mx != mouseX||my != mouseY) {
    steps = 80000;
    Thwater = true;
  }else{
    steps = 500000;
    Thwater = false;
  }
  fill(0, 0, 0, 60);
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
    if(int(x*il+width/2)>0&&int(x*il+width/2)<width&&int(y*ilh+height/2)>0&&int(y*ilh+height/2)<height) {
    pix[int(x*il+width/2)][int(y*ilh+height/2)]+=4;
    zeta[int(x*il+width/2)][int(y*ilh+height/2)]+=zoid/20;
    }
  }
  for(int n = 0; n < width; n++) {
    for(int m = 0; m < height; m++) {
      colorMode(RGB);
      if(pix[n][m]>5) {
        if(Thwater) {
          stroke(255, 255, 255, pix[n][m]*20);
        }else{
          stroke(255, pix[n][m]/sqrt(t*5), zeta[n][m]/sqrt(t*5), pix[n][m]/sqrt(t*20));
        }
      point(n, m);
      }
    }
  }
  t++;
  mx = mouseX;
  my = mouseY;
  fill(255);
  text("a: " + a, 30, 30);
  text("b: " + b, 30, 43);
  text("c: " + c, 30, 56);
  text("d: " + d, 30, 69);
  text("x=sin(ay)-cos(bx)", 30, 82);
  text("y=sin(cx)-cos(dy)", 30, 95);
}
  
void mouseMoved() {
  if(Abaab) {
    a = float(mouseX-width/2)/50;
    b = float(mouseY-height/2)/50;
  }else{
    c = float(mouseX-width/2)/50;
    d = float(mouseY-height/2)/50;
  }
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
  if(key=='p') {
    saveFrame("Output.png");
  }else{
    Abaab = !Abaab;
  }
}

