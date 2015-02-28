
int px;
int py;
int value;
void setup() {
  size (400, 460);
  background(255);
  frameRate(40);
  px=0;
  py=0;
  value=0;
}

void draw () {
  px=10+px;
  py=10+py;
  fill(0);
  rect(240, 60, -py, 8);
  rect(0, 400, py, 8) ;
  rect(40, 445, py, 8);
  rect(160, 400, 8, -py);
  rect(240, 340, 8, -py);
  rect(160, 340, py, 8);
  rect(40, 220, py, 8);
  rect(240, 0, -py, 8);
  rect(370, 340, 8, -py);
  rect(240, 150, py, 8);
  rect(280, 340, 8, py);
  rect(40, 0, 8, px);
  rect(248, 32, py, 8);
  noStroke();
  if (px>350) { //amarelo
    fill(255, 255-value,0);
    rect(40, 60, -60, -60);
    rect(48, 408, 232, 37);
    rect(248, 40, 122, 110);
  }

  if (px>380) { //azul
    fill (0, 0, 255-value);
    rect(168, 400, 112, -52);
    rect(48, 68, 112, 152);
  }

  if (px>400) {// vermelho
    fill(255, value,0);
    rect(48, 8, 112, 52);
    rect(168, 340, 72, -112);
    rect(248, 340, 122, -112);
  } 

  if (px>450) { //preto
    fill(0,0,0+value);
    rect(168, 68, 72, 152);
    rect(340, 158, 60, 182);
   
  }
  fill(0);
  rect(40, 260, 120, 8);
  rect(340, 340, 8, 60);
  rect(340,158,8,200);
  
  fill(255);
  rect(0,408,20,20);
  rect(240,8,-15,15);
  rect(248,158,15,15);
  rect(48,228,15,15);
  rect(288,348,15,15);
  rect(48,453,15,15);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
