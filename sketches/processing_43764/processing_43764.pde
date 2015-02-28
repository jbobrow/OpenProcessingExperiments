
size(600, 600);
smooth();
background(255);
noStroke();

PFont font;
font = loadFont("CamilleBD-48.vlw");
textFont(font);


int number = 20;
int w = width/number;
int h = height/number;

for (int i=0;i<number;i++) {
  for (int j=0; j<number; j++) {
    int x = i*w;
    int y = j*h;

    if ((i+j) % 2 == 0) {
      fill(129,199,207);
      text("f", x, y);
      textSize(120);
    }
    else if ((i+j) % 3 == 0) {
      fill(180,185,91);
      text("M",x,y);
    }
    else {
     fill(228,105,54);
      text("i", x,y);
    }}}


