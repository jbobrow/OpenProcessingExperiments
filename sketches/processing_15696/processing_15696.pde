
PImage chloro;
PFont mysuperfont;
void setup () {
  size (1000,1000);
  background (225,225,225);
  chloro = loadImage ("chloro.jpg");
  mysuperfont = loadFont ("AndaleMono-72.vlw");
  for (int ypos=0; ypos<1000; ypos=ypos+10) {
    for (int xpos=0; xpos<1000; xpos=xpos+10) {
      fill(0,255,xpos);
      ellipse(xpos-30,ypos+10,40,10);
    }
  }
  tint(200,150,155,90);
  image (chloro,0,0,1000,1000);
  textFont(mysuperfont);
  fill (255,0,0);
  text ("Underneath the Surface", 30,700,50);
}

