
snapper[][] snappers = new snapper[125][125];
 import processing.pdf.*;
boolean record;

 
void setup() {
  smooth();
  size(400, 400, P2D);
  for(int x = 0; x < 50; x++) {
    for(int y = 0; y < 50; y++) {
      snappers[x][y] = new snapper(x*8, y*8);//Grid size
    }
  }
}
void draw() {
  if (record) {
        beginRecord(PDF, "frame-####.pdf"); 
  }
  
  background(0);
  for(int x = 0; x < 50; x++) {
    for(int y = 0; y < 50; y++) {
      snappers[x][y].update();
    }
  }
  colorMode(HSB);
  for(int x = 1; x < 49; x++) {
    for(int y = 1; y < 49; y++) {
      stroke(cos((abs(snappers[x][y].xv)*abs(snappers[x][y].yv))/20)*250, 200, 250, 255);//color
      //stroke(255);
      line(snappers[x][y].xc, snappers[x][y].yc, snappers[x+1][y].xc, snappers[x+1][y].yc);
      line(snappers[x][y].xc, snappers[x][y].yc, snappers[x][y+1].xc, snappers[x][y+1].yc);
    }
  }
  for(int i = 1; i < 49; i++) {
   line(snappers[49][i].xc, snappers[49][i].yc, snappers[49][i+1].xc, snappers[49][i+1].yc);
   line(snappers[i][49].xc, snappers[i][49].yc, snappers[i+1][49].xc, snappers[i+1][49].yc);
  }
  if (record) {
    endRecord();
  record = false;
  }
}

void keyPressed() {
  if (key == 'p') {
  record = true;
  }
}

class snapper {
  //x-set, x-current
  float xs;
  float ys;
  float xc;
  float yc;
  float xv;
  float yv;
  snapper(int tx, int ty) {
    xs = tx;
    ys = ty;
    xc = tx;
    yc = ty;
  }
  void update() {
    xv += 0.000000005*(xs-xc);// reformation speed.
    yv += 0.000000005*(ys-yc);// smaller=slower recovery
    if(mousePressed){
      if(mouseButton==LEFT){
      xv += 0.003*(mouseX-xc)*(100/dist(mouseX, mouseY, xc, yc));// pinch, compressing
      yv += 0.003*(mouseY-yc)*(100/dist(mouseX, mouseY, xc, yc));// strength, bigger=more
      }else{
        xv += -0.003*(mouseX-xc)*(100/dist(mouseX, mouseY, xc, yc));//swelling
        yv += -0.003*(mouseY-yc)*(100/dist(mouseX, mouseY, xc, yc));//strength, bigger = more
      }
    }
    xv /= 1.35;//overlap,spring back, smaller = more
    yv /= 1.35;
    xc += xv;
    yc += yv;
  }
}



