
size(600, 600);
smooth();
background(255);
noStroke();

PFont font;
font = loadFont("CamilleBD-48.vlw");
textFont(font);


int number = 25;
int w = width/number;
int h = height/number;

for (int i=0;i<number;i=i+2) {
  for (int j=0; j<number; j++) {
    int x = i*w;
    int y = j*h+55;

    if ((i+j) % 2 == 0) {
      fill(233,171,168);
      text("T", x, y);
      textSize(130);
    }
    else if ((i+j) % 3 == 0) {
      fill(228,105,54);
      text("ar",x,y);
    }
    else if ((i+j) % 1.5 ==0) {
      fill(129,199,207);
      text("5",x,y);
    }
    else {
     fill(156,65,73);
      text("a", x,y);
    }}}


