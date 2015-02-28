
PGraphics pg;
int x;
float x1, y1;

void setup() {
  size(512, 512);
  pg=createGraphics(width*2, height*2, P2D);
  smooth();
  background(0, 0, 127);
  noLoop();
}

void draw() {
  pg.beginDraw();
  pg.stroke(0);
  for(x=0; x<pg.width; x++) {
    x1=map(x, 0, pg.width, -7, 7);
    if((x1>-7 && x1<-3) || (x1>-1 && x1<1) || (x1>3 && x1<7)) {
      y1=2*sqrt(-abs(abs(x1)-1)*abs(3-abs(x1))/((abs(x1)-1)*(3-abs(x1))))*(1+abs(abs(x1)-3)/(abs(x1)-3))*sqrt(1-sq(x1/7))+(5+0.97*(abs(x1-0.5)+abs(x1+0.5))-3*(abs(x1-0.75)+abs(x1+0.75)))*(1+abs(1-abs(x1))/(1-abs(x1)));
      //pg.set(x, int(map(y1, 7, -7, 0, height)), color(0, 0, 255));
      //pg.stroke(0, 106, 224);
      pg.line(x, pg.height/2, x, int(map(y1, 7, -7, 0, pg.height)));
    }
    if((x1>-7 && x1<-4) || (x1>4 && x1<7)) {
      y1=-3*sqrt(1-sq(x1/7))*sqrt(abs(abs(x1)-4)/(abs(x1)-4));
      //pg.set(x, int(map(y1, 7, -7, 0, height)), color(255, 0, 0));
      //pg.stroke(255, 0, 0);
      pg.line(x, pg.height/2, x, int(map(y1, 7, -7, 0, pg.height)));
    }
    if(x1>-4 && x1<4) {
      y1=abs(x1/2)-0.0913722*sq(x1)-3+sqrt(1-sq(abs(abs(x1)-2)-1));
      //pg.set(x, int(map(y1, 7, -7, 0, height)), color(255, 255, 0));
      //pg.stroke(255, 143, 0);
      pg.line(x, pg.height/2, x, int(map(y1, 7, -7, 0, pg.height)));
    }
    if((x1>-3 && x1<-1) || (x1>1 && x1<3)) {
      y1=(2.71052+(1.5-.5*abs(x1))-1.35526*sqrt(4-sq(abs(x1)-1)))*sqrt(abs(abs(x1)-1)/(abs(x1)-1))+0.9;
      //pg.set(x, int(map(y1, 7, -7, 0, height)), color(0, 255, 0));
      //pg.stroke(0, 154, 10);
      pg.line(x, pg.height/2, x, int(map(y1, 7, -7, 0, pg.height)));
    }
  }
  pg.endDraw();
  //pg.save("batman_sign.png");
  image(pg, 0, 0, width, height);
}
