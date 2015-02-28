
// grandProcessing
// A sketch combining all the intro knowledge

color[] kenzozine = new color[16];
int choice;
int p1 =1;
int p2 =2;
int wide = 600;
int high = 200;
int k = 20;
int s = 20;
float x;
float y;
  

void setup() {
  size(600, 600);
  smooth();
  background(kenzozine[p2]);
  noCursor();
  x = width/2;
  y = height/2;
  kenzozine[0] = color(255); //White
  kenzozine[1] = color(0);   //Black
  kenzozine[2] = color(209, 78, 89); //Rose
  kenzozine[3] = color(207, 74, 142); //Dark Pink
  kenzozine[4] = color(218, 133, 172); //Light Pink
  kenzozine[5] = color(205, 53, 96);//Rouge Pink
  kenzozine[6] = color(25, 154, 220); //Blue
  kenzozine[7] = color(169, 212, 205);
  kenzozine[8] = color(22, 171, 189);
  kenzozine[9] = color(31, 51, 237);
  kenzozine[10] = color(1, 130, 66);
  kenzozine[11] = color(219, 129, 71);
  kenzozine[12] = color(221, 47, 54);
  kenzozine[13] = color(225, 213, 95);
  kenzozine[13] = color(214, 180, 16);
  kenzozine[14] = color(148, 46, 228);
  kenzozine[15] = color(245, 239, 213);
  kenzozine[15] = color(215, 7, 29);
  frameRate(3);
}

void draw() {
  for (int x = 0; x < width; x+= s) {
    for (int y = 0; y < height; y += s) {
      color[] bam = kenzozine;
      noStroke();
      fill((bam[int(random(1, 5))]));
      rectMode(CORNER);
      rect(x, y, s, s);
    }
  }
}


void keyPressed() {
  p1 = int(random(4, 15));
  p2 = int(random(4, 15));

  int choice = key;
  switch(choice) {
  case 49:
    kenzozine = kenzozine;
    break;
  case 50:
    kenzozine = kenzozine;
    break;
  case 51:
    kenzozine = kenzozine;
    break;
  case 52:
    kenzozine = kenzozine;
    break;
  case 53:
    kenzozine = kenzozine;
    break;
  case 54:
    kenzozine = kenzozine;
    break;
  }
}

