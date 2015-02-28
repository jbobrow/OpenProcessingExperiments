
int cx1,cy1;
int rx1,ry1;
int youwon1;

void setup() {
  size(500,500);
  cx1=75;  cy1=75;
  rectMode(CENTER);
  imageMode(CENTER);
  im = loadImage("arceus-5.png");
  a = loadImage("arceus.png");
  frameRate(1);
}
PImage im;
PImage a;
int won=0;
void draw() {
  background(0);
  image(a, 250, 250); 
  if (youwon==1) {
    textSize(34);
    text("you caught arceus!",0,height/2);
    if ((frameCount-won) <5) return;
    youwon=2;
    setup2();
    return;
  }
  if (youwon>=2) {
    draw2();
    return;
  }
  fill(8,30,47,24);
  strokeWeight(4);
  if (rx1 != 0) rect(rx1,ry1,100,100);
  fill(255,0,0);
  cx1=(int)random(0,400);
  cy1=(int)random(0,400);
  image(im,cx1,cy1,100,100);
}

void mousePressed() {
  if (youwon==1) { return; }
  if (youwon>=2) {
    mousePressed2();
    return;
  }
  rx1=mouseX;  ry1=mouseY;
  if (abs(rx1-cx1)<100 && abs(ry1-cy1)<100) {
    youwon=1;  won=frameCount;
  }
}

