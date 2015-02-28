
float rotm,roth,rots;
float ease = 6;//1=instant jump, 100=very smooth
int i;
void setup() {
  size(512,512,P2D);
  background(0);
  PFont font;
  font = loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER);
  textMode(SCREEN);
  stroke(255);
}

void draw() {
  fill(0,80);
  rect(-1,-1,width+1,height+1);
  fill(255);
  //minute rot calc and drawing//
  rotm += ((minute()*6)-rotm)/ease;
  for (i=0;i<60;i++) {
    text(59-i,width/2*cos(radians(6*i+rotm+6)),height/2+width/2*sin(radians(6*i+rotm+6)));
  }
  //hour rot calc ans drawing//
  roth += ((hour()*15)-roth)/ease;
  for (i=0;i<24;i++) {
    text(24-i,(width/2-40)*cos(radians(15*i+roth)),height/2+((width/2)-40)*sin(radians(15*i+roth)));
  }
  //second rot calc and drawing//
  rots += (180+(second()*6)-rots)/ease;
  for (i=0;i<60;i++) {
    text(59-i,width+(width/2-40)*cos(radians(6*i+rots+6)),height/2+((width/2)-40)*sin(radians(6*i+rots+6)));
  }
}


