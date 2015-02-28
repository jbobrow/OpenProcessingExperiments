
// Created by Hana Svatos-Raznjevic
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Villa Savoye by Le Corbusier

int x=10;
int y=10;
float dir=1;
int speed=1;
void setup () {
  size(1400, 500);
  strokeWeight(0);
  background(255);
  noCursor();
}

void draw () {
  fill(0, 0, mouseX); //green
  stroke(250);
  rect(0, 0, x, 500);

  noStroke();

  fill (144, 240, 136);
  rect(0, 200, 1400, 20);

  fill(mouseX); 

  rect(0, 280, 1400, mouseY);
  fill (35, 113, 29);
  rect (0, 300, 1400, 6);

  fill (212, 244, 247, 63);
  rect (x, 30, y, 6);
  fill (182, 230, 234, 189);
  rect (x, 44, y, 10);
  fill (182, 216, 234, 189);
  rect (x, 56, y, 9);
  fill (182, 244, 224, 189);
  rect (x, 69, y, 4);
  fill (255, 255, 255);
  rect (x, 160, y, 100);
  fill (213, 231, 234);
  rect (x, 195, y, 27);
  fill (mouseX, 182, 193, 176); //red
  rect (x, 195, 224, 27); 

  fill (3, 92, 100, 19);
  rect (x, 30, y, 560);
  fill (3, 92, 100, 89);
  rect (x, 20, y, 560);
  fill (39, 242, 203, 89);
  rect (x, 20, y, 560);


  fill (55, 106, 129, 146);
  rect (906, 195, 105, 27);

  fill (3, 92, 100, 49);
  rect (689, 30, 3, 560);
  fill (21, 79, 85);
  rect (800, 85, 14, 75);
  fill (155, 932, 217, 230);
  rect (570, 86, 200, 75);

  fill (21, 79, 45);
  rect (699, 85, 14, 75);
  fill (73, 137, 103, 197);
  rect (640, 260, mouseX, 75);
  fill (250);
  rect (673, 260, 6, 75);
  fill (250);
  rect (900, 260, 6, 75);
  fill (210, 245, 218);
  rect (1009, 260, 6, 75);
  fill (250);
  rect (786, 260, 6, 75);
  fill(255, 255, 0);
  rect(x, 260, 7, 75); // new yellow
  noStroke ();


  fill (65, mouseX, mouseY, 25);
  rect (1111, 0, 300, 500);
  fill (140, mouseX, mouseY, 20);
  rect (1040, 0, 360, 500);
  fill (200, mouseX, mouseY, 20);
  rect (1005, 7, 57, 500);
  fill (540, mouseX, mouseY, 76);
  rect (720, 260, 80, 75);
  fill (253, mouseX, mouseY, 140);
  rect (690, 145, 70, 16);

  x += speed*dir;
  if (x>1200||x<0) {
    dir=dir*(-1);
  }
  y +=speed*dir;
  if (y<0) {
    dir=dir*-1;
  }
}












