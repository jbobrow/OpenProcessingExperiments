
float r;
float yoza=200;
float x=50;
void setup () {
  size (900, 450);
  background (0);
  stroke (255,255,255,150);
  strokeWeight(1);
  smooth();
  while(yoza<500) {

    line(0, yoza, yoza, 500);
    line(900, yoza, yoza, 0);
    line(0, yoza, yoza, 450);
    line(450, yoza, yoza, 0);
    line(x, yoza, yoza, yoza);
    line (x,yoza,yoza,450);
  
    yoza=yoza+1;
    x=x+5;
  }
  }

