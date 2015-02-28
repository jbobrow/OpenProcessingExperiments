
import tfft.doubleW;

int it = 0;
int nx = 96;
int nz = nx;
int px = 9*nx/2;
int pz = px;
int ifn = 2;
doubleW t = new doubleW(0.0D);
double k0 = 10.0D;
double re = 1000.0D;
doubleW visc = new doubleW(0.0D);
double cflnum = 0.8D;
doubleW dt = new doubleW(0.0D);
doubleW cn = new doubleW(0.0D);
doubleW cnm1 = new doubleW(0.0D);
Complex om2[] = new Complex[(nx / 2) * nz];
Complex uc[] = new Complex[(3 * nx / 4 + 1) * (3 * nz / 2) * 4];
double ur[] = new double[(3 * nx / 4 + 1) * (3 * nz / 2) * 8];
Complex fnm1[] = new Complex[(nx / 2) * nz];
double tfftxz[] = new double[(3 * nx / 2 + 2) * (3 * nz / 2)];
double alfa[] = new double[nx / 2];
double gamma[] = new double[nz];
double prex[] = new double[3 * nx / 2];
double prez[] = new double[3 * nx + 15];
int ix[] = new int[15];
int iz[] = new int[15];
int pixarr[] = new int[px * pz];
boolean cb = false;

PImage pImage;
Pao pao;
PFont font;
int loop = 0;
int ctmp;
long fps;
long currentTime;
Simulator sim;
boolean running = false;

void setup () {
  println("px: " + px);
  size(432, 458, JAVA2D);
  //size(px, pz + 24, JAVA2D);
  
  // create the startfield
  pao = new Pao();
  pImage = new PImage(px, pz);
  createStartField();
  
  font = loadFont("Verdana-14.vlw");
  textFont(font);
  
  //start simulation
  toggleRunning();
}

void draw() {
  background(255);
  if (loop % 50 == 0) {
      println("fps: " + fps);
  }
  image(pImage, 0.0f, 0.0f);
  drawPerformance();
}

void drawPerformance () {
  stroke(0, 255);
  fill(0, 255);
  text("Copyright © 2011 @drtobbe  -  " + "fps: " + fps + "  f: " + loop, 5, pz + 18);
}

void createStartField() {
  println("createStartField");
  currentTime = millis();
  loop = 1;
  pao.pao(ur, 0, (3 * nx) / 2 + 2, (3 * nx) / 2, alfa, 0, gamma, 0, nx, nx, re, k0, visc);
  Init.init(nx, nz, alfa, 0, gamma, 0, fnm1, 0, prex, 0, prez, 0, ix, 0, iz, 0, cb);
  Calcom.calcom(nx, nz, alfa, 0, gamma, 0, ur, 0, om2, 0);
  Step2a.step2a((3 * nx) / 2 + 2, (3 * nz) / 2, ur, 0, tfftxz, 0, prex, 0, prez, 0, ix, 0, iz, 0, cb);
  Field2pix.field2pix(pixarr, 0, px, pz, ur, 0, (3 * nx) / 2, (3 * nz) / 2);
  setImgarray();
}


void iterate() {
  loop++;
  if (loop % 1000 == 0) {
    createStartField();
  }
  fps = 1000 * loop / (millis() - currentTime + 1);
  Nextdt.nextdt(nx, nz, ur, 0, cflnum, it, ifn, dt, cn);
  Step2b.step2b((3 * nx) / 2 + 2, (3 * nz) / 2, ur, 0, tfftxz, 0, prex, 0, prez, 0, ix, 0, iz, 0, cb);
  Step3.step3(nx / 2, nz, uc, 0, ur, 0, om2, 0, alfa, 0, gamma, 0, fnm1, 0, visc.val, t, dt.val, cn.val, cnm1);
  Step2a.step2a((3 * nx) / 2 + 2, (3 * nz) / 2, ur, 0, tfftxz, 0, prex, 0, prez, 0, ix, 0, iz, 0, cb);
  Field2pix.field2pix(pixarr, 0, px, pz, ur, 0, (3 * nx) / 2, (3 * nz) / 2);
  setImgarray();
}

void toggleRunning() {
  if (!running) {
    println("start");
    sim = new Simulator();
    sim.start();
  } else {
    println("stop");
    running = false;
  }
}

// Controls. The r key create startfield, g toggles run
void keyPressed() {
  if ((key == 'r') || (key == 'R'))
  if (!running) {
    createStartField();
  }
  if ((key == 'g') || (key == 'G'))
    toggleRunning();
}

void setImgarray() {
  for (int i = 0; i < px; i++) {
    for (int j = 0; j < pz; j++) {
      ctmp = pixarr[i + px * j];
      pImage.set(i, j, ctmp * (1 + 256 + 65536));
    }
  }
}

class Simulator extends Thread {
  public void run() {
    running = true;
    while(running) {
      iterate();
    }
  }
}

