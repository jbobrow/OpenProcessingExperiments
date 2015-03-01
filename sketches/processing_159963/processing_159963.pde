
int gX1 = 20;
int gX2 = 50;
PFont coolFont;
int rX1 = 300;
int gY1 = 20;
int gY2 = 100;
int rY1 = 300;
int rX2;
int rY2;
int posx = 300;
int posy = 300;
int Tposx = 50;
int Tposy = 50; 
int Txd;
int Tyd;
int xd = int(random(10));
int yd = int(random(10));
int w = 20;
int h = 20;
int b = 10;
int s1 = 0;
int dSize = 0;

void setup() {
  size(600, 600);
  frameRate(60);
}

void draw() {
  background(0);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  rectMode(CENTER);
  rect(rX1, rY1, gX1, gY1);
  fill(#114E43);
  ellipse(50, 50, 100, 100);
  if (s1 > 5) {
   rect(rX2, rY2, dSize, dSize);
   
  }
  if (rX1+10>Tposx&Tposx>rX1-10&rY1+10>Tposy&Tposy>rY1-10){
    Tposx = 50;
    Tposy = 50;
    Txd = 0;
    Tyd = 0;
    s1++;
    rY1 = int(random(600));
    rX1 = int(random(600));
    if (s1 > 5) {
      rY2 = int(random(600));
      rX2 = int(random(600));
      dSize= dSize + 6;
    }
  } 
  if (rX2+dSize/2>Tposx&Tposx>rX2-dSize/2&rY2+dSize/2>Tposy&Tposy>rY2-dSize/2){
    Tposx = 50;
    Tposy = 50;
    Txd = 0;
    Tyd = 0;
    rY1 = int(random(600));
    rX1 = int(random(600));
    s1--;
    dSize = dSize + 12;
    if (s1 > 5) {
      rY2 = int(random(600));
      rX2 = int(random(600));
    }
  } 
  if (posx>width-b) {
     xd = -xd;}
  if (posy>height-b) {
     yd = -yd;}
  if (posx<0+b) {
     xd = -xd;}
  if (posy<0+b) {
     yd = -yd;}
  if (posy==Tposy+b&posx==Tposx+b) {
     yd = -yd;
     xd = -xd;
  }
  if (posy==Tposy-b&posx==Tposx-b) {
     yd = -yd;
     xd = -xd;
  }
  ball (Tposx, Tposy, w, h);
  Tposx = Tposx + Txd;
  Tposy = Tposy + Tyd;
  if (Tposx>width-b) {
     Txd = -Txd;}
  if (Tposy>height-b) {
     Tyd = -Tyd;}
  if (Tposx<0+b) {
     Txd = -Txd;}
  if (Tposy<0+b) {
     Tyd = -Tyd;}
  if (posy==Tposy+b&posx==Tposx+b) {
     Tyd = -Tyd;
     Txd = -Txd;
  }
  if (posy==Tposy-b&posx==Tposx-b) {
     Tyd = -Tyd;
     Txd = -Txd;
  }
  fill(#FFFFFF);
  coolFont = loadFont("IowanOldStyle-Roman-48.vlw");
  textFont(coolFont);
  textAlign(CENTER);
  text(s1, 550, 50);
}
void ball (int x, int y, int w, int h) {
  noStroke();
  fill(#E12F4E);
  ellipse(x, y, w, h);
}

void mousePressed(){
  Tposx = 50;
  Tposy = 50;
  noLoop();
}

void mouseReleased(){
  Txd = (mouseX - Tposx)/5;
  Tyd = (mouseY - Tposy)/5;
  loop();
}


