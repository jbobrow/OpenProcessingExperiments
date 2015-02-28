
snapper[][] snappers = new snapper[125][125];
void setup() {
  smooth();
  size(500, 500, P2D);
  for(int x = 0; x < 125; x++) {
    for(int y = 0; y < 125; y++) {
      snappers[x][y] = new snapper(x*4, y*4);
    }
  }
}
void draw() {
  background(0);
  for(int x = 0; x < 125; x++) {
    for(int y = 0; y < 125; y++) {
      snappers[x][y].update();
    }
  }
  colorMode(HSB);
  for(int x = 1; x < 124; x++) {
    for(int y = 1; y < 124; y++) {
      stroke(sin((abs(snappers[x][y].xv)*abs(snappers[x][y].yv))/10)*255, 255, 255, 100);
      //stroke(255);
      line(snappers[x][y].xc, snappers[x][y].yc, snappers[x+1][y].xc, snappers[x+1][y].yc);
      line(snappers[x][y].xc, snappers[x][y].yc, snappers[x][y+1].xc, snappers[x][y+1].yc);
    }
  }
  for(int i = 1; i < 124; i++) {
   line(snappers[124][i].xc, snappers[124][i].yc, snappers[124][i+1].xc, snappers[124][i+1].yc);
   line(snappers[i][124].xc, snappers[i][124].yc, snappers[i+1][124].xc, snappers[i+1][124].yc);
  }
  colorMode(RGB);
  if(keyPressed) {
    saveFrame("output.png");
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
    xv += 0.01*(xs-xc);
    yv += 0.01*(ys-yc);
    if(mousePressed){
      if(mouseButton==LEFT){
      xv += 0.005*(mouseX-xc)*(100/dist(mouseX, mouseY, xc, yc));
      yv += 0.005*(mouseY-yc)*(100/dist(mouseX, mouseY, xc, yc));
      }else{
        xv += -0.005*(mouseX-xc)*(100/dist(mouseX, mouseY, xc, yc));
        yv += -0.005*(mouseY-yc)*(100/dist(mouseX, mouseY, xc, yc));
      }
    }
    xv /= 1.015;
    yv /= 1.015;
    xc += xv;
    yc += yv;
  }
}

