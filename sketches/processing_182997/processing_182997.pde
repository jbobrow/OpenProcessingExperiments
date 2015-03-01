
int Ypos;
int Xpos;
int hradi;
void setup() {
  frameRate(24);
  size(600, 300);
  Xpos=0;
  Ypos=44;
  hradi=1;
  
}


void draw() {
  background(11);
  for (int i=0; i<600; i=i+60) {
    andlit(i+33, Ypos);
    andlit2(Xpos,50);
    Xpos = Xpos+hradi;
    if (Xpos == 1200) hradi = -1;
    if (Xpos < 0) hradi = 1;
    Ypos = Ypos+hradi;
    if (Ypos > 300) hradi = -1;
    if (Ypos < 0) hradi = 1;
    //andlit(100,44);
    // andlit(170,44);
  }
}

void andlit(int x, int y) {

  float staerd = random(5, 9);
  float randomStaerd = random(54, 67);
  float innri = 0.2;
  float glampi = 0.9;
  fill(random(0),random(255),random(255));
  ellipse(x, y, randomStaerd, randomStaerd+15);
  fill(255);
  ellipse(x+11, y, staerd+4, staerd);
  ellipse(x-11, y, staerd+4, staerd);
  fill(255, 0, 0);
  ellipse(x+11, y, staerd*glampi, staerd*glampi);
  ellipse(x-11, y, staerd*glampi, staerd*glampi);
  fill(0);
  ellipse(x+11, y, staerd*innri, staerd);
  ellipse(x-11, y, staerd*innri, staerd);
  fill(237, 202, 127);
  triangle(x-3, y+random(14, 17), x+3, y+random(14, 17), x, y);
  stroke(126, 3, 124);
  strokeWeight(random(1, 5));
  line(x-11, y+26, x+11, y+26);
  stroke(0);
  strokeWeight(1);
  line(x-11, y+26, x+11, y+26);
}

void andlit2(int x, int y) {

  float staerd = 8;
  //float staerd = 55;
  float innri = 0.2;
  float glampi = 0.9;
  fill(255,245,155);
  ellipse(x, y, 55, 70);
  fill(255);
  ellipse(x+11, y, staerd+4, staerd);
  ellipse(x-11, y, staerd+4, staerd);
  fill(255, 0, 0);
  ellipse(x+11, y, staerd*glampi, staerd*glampi);
  ellipse(x-11, y, staerd*glampi, staerd*glampi);
  fill(0);
  ellipse(x+11, y, staerd*innri, staerd);
  ellipse(x-11, y, staerd*innri, staerd);
  fill(237, 202, 127);
  triangle(x-3, y+16, x+3, y+16, x, y);
  stroke(126, 3, 124);
  strokeWeight(4);
  line(x-11, y+26, x+11, y+26);
  stroke(0);
  strokeWeight(1);
  line(x-11, y+26, x+11, y+26);
}
