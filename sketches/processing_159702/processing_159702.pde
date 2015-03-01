
/* size(1600,900);
background(#222222);

fill(255,255,255,255);
noStroke();
ellipse(725,200, 100,100);

fill(0,0,0,255);
noStroke();
ellipse(725,200, 80,80);

fill(#ffffff);
noStroke();
quad(475, 100, 500, 300, 700, 300, 720, 100);

fill(#FBFFCE);
ellipse (width/2+200, 200, 150,150); */

void setup() {
  size(600, 600);
  background(0);
}

void draw () {
  int opacityAdd = 10;
  while (opacityAdd < 200) {
    fill(255, 255, 255, 10+opacityAdd);
    ellipse(300, 300, 150, 150);
  }
  while (opacityAdd > 200) {
    fill(255, 255, 255, 200-opacityAdd);
    ellipse(300, 300, 150, 150);
  }
}

